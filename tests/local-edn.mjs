import assert from 'node:assert/strict';
import { mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import * as c from '../js-out/calcit.core.mjs';
import { merge_local_edn_$x_, merge_local_edn_with_$x_ } from '../js-out/cumulo-util.file.mjs';

const directory = mkdtempSync(join(tmpdir(), 'cumulo-local-edn-'));
try {
  const file = join(directory, 'settings.cirru');
  const t = c.init_tags(['count', 'label', 'none', 'some']);
  const base = c._$n__$M_(t.count, 1);
  const observed = [];
  const handler = c._PCT__$o__$o_(c.Option, t.some, found => observed.push(found));
  const noHandler = c._PCT__$o__$o_(c.Option, t.none);
  const decode = text => {
    const data = c.parse_cirru_edn(text);
    assert.equal(typeof c.option_$o_unwrap(c.get(data, t.count)), 'number');
    return data;
  };

  assert.equal(merge_local_edn_with_$x_(base, file, handler, () => assert.fail('decoded missing file')), base);
  writeFileSync(file, '{} (:count 2)\n');
  const merged = merge_local_edn_with_$x_(base, file, handler, decode);
  assert.equal(c.option_$o_unwrap(c.get(merged, t.count)), 2);
  assert.deepEqual(observed, [false, true]);

  writeFileSync(file, '{} (:count |bad) (:label |legacy)\n');
  assert.throws(() => merge_local_edn_with_$x_(base, file, noHandler, decode), { code: 'ERR_ASSERTION' });
  assert.equal(c.option_$o_unwrap(c.get(merge_local_edn_$x_(base, file), t.label)), 'legacy');
} finally {
  rmSync(directory, { recursive: true, force: true });
}
