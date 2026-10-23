import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync} from 'node:fs';
const run=(...args)=>execFileSync('calcit',args,{encoding:'utf8',stdio:['ignore','pipe','pipe'],maxBuffer:8*1024*1024});
const json=(...args)=>JSON.parse(run(...args,'--format','json'));
const q=(...args)=>json('query',...args).data;
assert.equal(run('-v').trim(),'0.30.1');
const config=q('config');
assert.equal(config.entries.find(e=>e.name==='default').target,'browser');
assert.equal(config.entries.find(e=>e.name==='server').target,'node');
const inventory=()=>{
  const result=[];const ns=q('ns').namespaces;assert.equal(ns.length,7);
  for(const name of ns){
    const defs=run('query','defs',name).split('\n').filter(l=>/^  \S/.test(l)).map(l=>l.trim().split(' ')[0]);
    assert.equal(defs.length,q('ns',name).definition_count);
    for(const d of defs)result.push(q('def',`${name}/${d}`));
  }
  assert.equal(result.length,40);
  assert.equal(result.reduce((n,d)=>n+d.tests.length+d.examples.length,0),0);
  return result;
};
const before=inventory();assert.deepEqual(before,JSON.parse(readFileSync('acceptance/reviewed.json','utf8')));
const method=q('type','calcit.core/Option').methods.find(m=>m.name==='.unwrap-or');
assert.equal(method.definition,'calcit.core/option:unwrap-or');
const expected=structuredClone(before),counts={option:0,constructors:0};
function normalize(node){
  if(!Array.isArray(node))return node;
  const n=node.map(normalize);
  if(n[0]==='option:unwrap-or'){assert.equal(n.length,3);n[0]='.unwrap-or';counts.option++;}
  if(n[0]==='%{}'){
    assert.ok(['Coalescer','HeartbeatLease','RetryBackoff'].includes(n[1]));
    assert.ok(n.slice(2).every(p=>p.length===2&&p[0].startsWith(':')));
    counts.constructors++;return [n[1],...n.slice(2).flat()];
  }
  return n;
}
for(const d of expected)d.code=normalize(d.code);
assert.deepEqual(counts,{option:2,constructors:3});
const client=expected.find(d=>d.id==='cumulo-util.client/main!');
const watcher=before.find(d=>d.id==='cumulo-util.activity/watch-browser-lifecycle!');
const cleanup=watcher.schema.find(p=>Array.isArray(p)&&p[0]===':return')[1];
assert.deepEqual(cleanup,['::',"'Fn",['{}',[':return',"'Unit"],[':args',['[]']]]]);
assert.equal(client.schema.find(p=>Array.isArray(p)&&p[0]===':return')[1],"'Fn");
client.schema.find(p=>Array.isArray(p)&&p[0]===':return')[1]=cleanup;
const ops=[];
for(let i=0;i<before.length;i++){
  const a=before[i],b=expected[i];
  if(JSON.stringify(a.code)!==JSON.stringify(b.code))ops.push(['edit','def',b.id,'--overwrite','--input-format','json-ast','--code',JSON.stringify(b.code)]);
  if(JSON.stringify(a.schema)!==JSON.stringify(b.schema))ops.push(['edit','schema',b.id,'--input-format','json-ast','--code',JSON.stringify(['::',"'Fn",['{}',...b.schema.slice(1).filter(p=>p[0]!==':kind')]])]);
}
assert.equal(ops.length,6);
writeFileSync('acceptance/before.json',JSON.stringify(before,null,2));
writeFileSync('acceptance/operations.json',JSON.stringify(ops,null,2));
const args=['edit','transaction','--file','acceptance/operations.json','--format','json'];
const preview=JSON.parse(run(...args,'--dry-run'));assert.ok(preview.scoped_revision);
writeFileSync('acceptance/preview.json',JSON.stringify(preview,null,2));
writeFileSync('acceptance/applied.json',run(...args,'--expect-revision',preview.scoped_revision));
const after=inventory(),actual=after.find(d=>d.id===client.id);
const fields=s=>Object.fromEntries(s[0]==='::'?s[2].slice(1):s.slice(1).filter(p=>p[0]!==':kind'));
assert.deepEqual(fields(actual.schema),fields(client.schema));client.schema=actual.schema;
assert.deepEqual(after,expected,'All40views retain actual lifecycle/storage/scheduler semantics, docs/tests/FFI and other schemas; no get-backup-path or write-mildly behavior change');
assert.deepEqual(q('config'),config);
writeFileSync('acceptance/after.json',JSON.stringify(after,null,2));
const diff=json('analyze','program-diff','HEAD');assert.equal(diff.data.evidence.changes.length,6);
writeFileSync('acceptance/program-diff.json',JSON.stringify(diff,null,2));
writeFileSync('acceptance/snapshot-blob.txt',execFileSync('git',['hash-object','calcit.cirru'],{encoding:'utf8'}));
writeFileSync('acceptance/preserved.json',JSON.stringify({definitions:40,namespaces:7,tests:0,examples:0,...counts,regions:6,unsafe:0,cleanupFunctionRuntimeUnchanged:true,allOtherCodeSchemasDocsFFIConfigUnchanged:true,backupESM48StillOpen:true},null,2));
