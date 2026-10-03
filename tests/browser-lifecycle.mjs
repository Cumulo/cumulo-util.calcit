import fs from "node:fs"
import { syncBuiltinESMExports } from "node:module"

const listeners = new Map()
const intervals = new Map()
const timeouts = new Map()
let nextTimer = 1

globalThis.document = { visibilityState: "visible" }
Object.defineProperty(globalThis, "navigator", {
  configurable: true,
  value: { onLine: true },
})
globalThis.window = {
  addEventListener: (name, listener) => listeners.set(name, listener),
  removeEventListener: (name, listener) => {
    if (listeners.get(name) === listener) listeners.delete(name)
  },
}
globalThis.setInterval = (callback, interval) => {
  const id = nextTimer++
  intervals.set(id, { callback, interval })
  return id
}
globalThis.clearInterval = (id) => intervals.delete(id)
globalThis.setTimeout = (callback, delay) => {
  const id = nextTimer++
  timeouts.set(id, { callback, delay })
  return id
}
globalThis.clearTimeout = (id) => timeouts.delete(id)

const flushTimeouts = (delay) => {
  while (true) {
    const entry = [...timeouts.entries()].find(([, item]) => item.delay === delay)
    if (entry === undefined) return
    const [id, { callback }] = entry
    timeouts.delete(id)
    const result = callback()
    if (result !== undefined) {
      throw new Error(`Timer callback must return Calcit Unit, got ${String(result)}`)
    }
  }
}

const activity = await import("../js-out/cumulo-util.activity.mjs")
const legacy = await import("../js-out/cumulo-util.core.mjs")
const calcitCore = await import("../js-out/calcit.core.mjs")

const browserEvents = []
const stopBrowser = activity.watch_browser_lifecycle_$x_(
  (signal) => browserEvents.push(String(signal)),
  calcitCore._PCT_some(2345),
)
const browserTimer = [...intervals.values()][0]

document.visibilityState = "hidden"
listeners.get("visibilitychange")({})
navigator.onLine = false
listeners.get("offline")({})
listeners.get("focus")({})
listeners.get("focus")({})
flushTimeouts(800)
document.visibilityState = "visible"
listeners.get("visibilitychange")({})
navigator.onLine = true
listeners.get("online")({})
browserTimer.callback()

const expectedBrowser = ":visible,:online,:hidden,:offline,:touch,:visible,:touch,:online,:heartbeat"
if (browserEvents.join(",") !== expectedBrowser) {
  throw new Error(`Unexpected browser lifecycle sequence: ${browserEvents.join(",")}`)
}
if (browserTimer.interval !== 2345) {
  throw new Error(`Unexpected browser lifecycle interval: ${browserTimer.interval}`)
}

stopBrowser()
if (listeners.size !== 0 || intervals.size !== 0 || timeouts.size !== 0) {
  throw new Error("Browser lifecycle cleanup failed")
}

const activities = []
const stopActivity = activity.watch_page_activity_$x_(
  (activity) => activities.push(String(activity)),
  1234,
)
const activityTimer = [...intervals.values()][0]

document.visibilityState = "hidden"
listeners.get("visibilitychange")({})
activityTimer.callback()
document.visibilityState = "visible"
listeners.get("visibilitychange")({})
activityTimer.callback()

const expectedActivities = ":visible,:hidden,:visible,:heartbeat"
if (activities.join(",") !== expectedActivities) {
  throw new Error(`Unexpected activity sequence: ${activities.join(",")}`)
}
if (activityTimer.interval !== 1234) {
  throw new Error(`Unexpected activity interval: ${activityTimer.interval}`)
}

stopActivity()
if (listeners.has("visibilitychange") || intervals.size !== 0) {
  throw new Error("Activity watcher cleanup failed")
}

let touches = 0
const stopTouch = legacy.on_page_touch(() => {
  touches += 1
})
listeners.get("focus")({})
listeners.get("focus")({})
if (touches !== 1 || ![...timeouts.values()].some((item) => item.delay === 800)) {
  throw new Error(`Touch throttling failed: ${touches}`)
}
flushTimeouts(800)
listeners.get("visibilitychange")({})
if (touches !== 2) throw new Error(`Touch cooldown reset failed: ${touches}`)
stopTouch()

let heartbeats = 0
legacy.visibility_heartbeat(() => {
  heartbeats += 1
}, 4567)
const heartbeatTimer = [...intervals.values()][0]
heartbeatTimer.callback()
document.visibilityState = "hidden"
heartbeatTimer.callback()
if (heartbeats !== 1 || heartbeatTimer.interval !== 4567) {
  throw new Error(
    `Visibility heartbeat failed: ${heartbeats}/${heartbeatTimer.interval}`,
  )
}

console.log(`browser lifecycle passed: ${activities.join(" -> ")}`)

// Reuse this Node fixture for the migrated storage boundary; no real file I/O.
const files = await import("../js-out/cumulo-util.file.mjs")
const originalExists = fs.existsSync
const originalRead = fs.readFileSync
const base = calcitCore.parse_cirru_edn("{} (:a 1) (:keep 7)")
let exists = false
let content = "{} (:a 2) (:b 3)"
let reads = 0
const foundSignals = []
fs.existsSync = () => exists
fs.readFileSync = () => { reads += 1; return content }
syncBuiltinESMExports()
try {
  const handler = calcitCore._PCT_some(found => foundSignals.push(found))
  if (files.merge_local_edn_$x_(base, "fixture-only", handler) !== base || reads !== 0) {
    throw new Error("Missing storage must preserve base without reading")
  }
  exists = true
  const merged = calcitCore.to_js_data(files.merge_local_edn_$x_(base, "fixture-only", handler))
  if (merged.a !== 2 || merged.keep !== 7 || merged.b !== 3 || reads !== 1 || foundSignals.join() !== "false,true") {
    throw new Error("Storage merge or existence callback changed")
  }
  content = "[] 1 2"
  let rejected = false
  try { files.merge_local_edn_$x_(base, "fixture-only") } catch { rejected = true }
  if (!rejected) throw new Error("Storage decoder must reject non-Map data")
} finally {
  fs.existsSync = originalExists
  fs.readFileSync = originalRead
  syncBuiltinESMExports()
}
console.log("storage Map/absence/callback boundary passed")
