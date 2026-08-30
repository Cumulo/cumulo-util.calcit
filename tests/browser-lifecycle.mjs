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
    callback()
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
