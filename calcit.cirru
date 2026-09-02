
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |cumulo-util)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'cumulo-util.client/main!) (:mode :native) (:reload-fn 'cumulo-util.client/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'cumulo-util.app/main!) (:mode :native) (:reload-fn 'cumulo-util.app/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'cumulo-util.activity $ %{} 'FileEntry
      :defs $ {}
        'page-online? $ %{} 'CodeEntry (:doc "|Returns the browser online hint. It does not prove WebSocket or server health.")
          :code $ quote
            defn page-online? () $ not= false (unsafe-coerce js/navigator.onLine 'Bool)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ []
              :features $ #{} :js-ffi
        'page-visible? $ %{} 'CodeEntry (:doc "|Returns whether the browser document is currently visible.")
          :code $ quote
            defn page-visible? () $ = |visible (unsafe-coerce js/document.visibilityState 'String)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ []
              :features $ #{} :js-ffi
        'watch-browser-lifecycle! $ %{} 'CodeEntry (:doc "|Reports visibility, online/offline, throttled page touch, and visible-page heartbeat signals. Returns cleanup for every listener and timer.")
          :code $ quote
            defn watch-browser-lifecycle! (callback heartbeat-ms)
              let
                  interval-ms $ heartbeat-ms.unwrap-or 3000
                  *cooling $ atom false
                  *touch-timer $ atom 0
                  emit-touch! $ fn ()
                    when (not @*cooling) (callback :touch) (reset! *cooling true)
                      reset! *touch-timer $ flipped js/setTimeout 800
                        fn () $ reset! *cooling false
                  on-visibility $ fn (event)
                    if (page-visible?)
                      do (callback :visible) (emit-touch!)
                      callback :hidden
                  on-online $ fn (event) (callback :online)
                  on-offline $ fn (event) (callback :offline)
                  on-focus $ fn (event) (emit-touch!)
                  timer $ flipped js/setInterval interval-ms
                    fn () $ when (page-visible?) (callback :heartbeat)
                js/window.addEventListener |visibilitychange on-visibility
                js/window.addEventListener |online on-online
                js/window.addEventListener |offline on-offline
                js/window.addEventListener |focus on-focus
                callback $ if (page-visible?) :visible :hidden
                callback $ if (page-online?) :online :offline
                fn () (js/window.removeEventListener |visibilitychange on-visibility) (js/window.removeEventListener |online on-online) (js/window.removeEventListener |offline on-offline) (js/window.removeEventListener |focus on-focus) (js/clearInterval timer) (js/clearTimeout @*touch-timer)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ [] 'Fn (:: 'Option 'Number)
        'watch-page-activity! $ %{} 'CodeEntry (:doc "|Reports :visible and :hidden transitions plus :heartbeat while visible. Emits the current visibility immediately and returns a cleanup function.")
          :code $ quote
            defn watch-page-activity! (cb ? duration)
              watch-browser-lifecycle!
                fn (signal)
                  when
                    or (= signal :visible) (= signal :hidden) (= signal :heartbeat)
                    cb signal
                js-nullish->option duration
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ [] 'Fn (:: 'JsNullish 'Number)
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc "|Typed browser visibility and activity lifecycle signals. Transport protocols and reconnect policy belong to applications.")
        :code $ quote (ns cumulo-util.activity)
    'cumulo-util.app $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (println |Started) (task!) (write-mildly! |a/a/a |a) &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () (println |Reload) (task!)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        'task! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn task! () $ echo |Task...
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns cumulo-util.app $ :require
            cumulo-util.file :refer $ write-mildly!
    'cumulo-util.client $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ watch-page-activity!
              fn (activity) (println |activity activity)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ []
              :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! $
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns cumulo-util.client $ :require
            cumulo-util.activity :refer $ watch-page-activity!
    'cumulo-util.core $ %{} 'FileEntry
      :defs $ {}
        'on-page-touch $ %{} 'CodeEntry (:doc "|Registers a throttled focus and visible-page callback through the unified lifecycle watcher. Returns cleanup for every listener and timer.")
          :code $ quote
            defn on-page-touch (listener)
              watch-browser-lifecycle!
                fn (signal)
                  when (= signal :touch) (listener)
                %none
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ [] 'Fn
              :features $ #{} :js-ffi
        'visibility-heartbeat $ %{} 'CodeEntry (:doc "|Calls cb at the requested interval while the document is visible. Defaults to 3000 ms and returns the JavaScript interval handle.")
          :code $ quote
            defn visibility-heartbeat (cb ? duration)
              unsafe-coerce
                flipped js/setInterval
                  either (unsafe-coerce duration 'Dynamic) 3000
                  fn () $ when (page-visible?) (cb)
                , 'Number
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Number)
              :args $ [] 'Fn (:: 'Option 'Number)
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc "|Legacy zero-argument browser callbacks kept isolated for compatibility. New applications should use cumulo-util.activity.")
        :code $ quote
          ns cumulo-util.core $ :require
            cumulo-util.activity :refer $ watch-browser-lifecycle! page-visible?
    'cumulo-util.file $ %{} 'FileEntry
      :defs $ {}
        'get-backup-path! $ %{} 'CodeEntry (:doc "|Builds the legacy month/day snapshot path under the module backups directory.")
          :code $ quote
            defn get-backup-path! () $ let
                now $ new js/Date
              path/join js/__dirname |backups
                str $ inc (.!getMonth now)
                str (.!getDate now) |-snapshot.edn
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'String)
              :args $ []
              :features $ #{} :js-ffi
        'merge-local-edn! $ %{} 'CodeEntry (:doc "|Merges a base map with Cirru EDN loaded from filepath when present; handler receives whether the file exists.")
          :code $ quote
            defn merge-local-edn! (x0 filepath handler)
              merge x0 $ let
                  found? $ fs/existsSync filepath
                if (fn? handler) (handler found?)
                if found?
                  parse-cirru-edn $ fs/readFileSync filepath |utf8
                  , nil
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Map)
              :args $ [] 'Map 'String (:: 'Optional 'Fn)
              :features $ #{} :js-ffi
        'sh! $ %{} 'CodeEntry (:doc "|Runs a shell command synchronously and prints the command and output.")
          :code $ quote
            defn sh! (command) (println command)
              println $ .toString (cp/execSync command)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'String
              :features $ #{} :js-ffi
        'write-mildly! $ %{} 'CodeEntry (:doc "|Atomically replaces a UTF-8 text file only when its content changed, creating parent directories as needed.")
          :code $ quote
            defn write-mildly! (file-path content)
              let
                  dir $ path/dirname file-path
                  filename $ path/basename file-path
                  temp-name $ str |/tmp/ (js/Date.now) |- (js/Math.random) |- filename
                  do-write! $ fn () (fs/writeFileSync temp-name content) (fs/renameSync temp-name file-path) (println "|Write to file:" file-path)
                if (fs/existsSync file-path)
                  let
                      old-content $ fs/readFileSync file-path |utf8
                    if (not= content old-content) (do-write!) (; println "|same file, skipping:" file-path)
                  do
                    when
                      and (not= |. dir)
                        not $ fs/existsSync dir
                      fs/mkdirSync dir $ to-js-data
                        {} $ :recursive true
                    do-write!
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'String 'String
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc "|Small Node.js filesystem and process helpers. Browser lifecycle helpers belong in cumulo-util.activity.")
        :code $ quote
          ns cumulo-util.file $ :require (|path :as path) (|fs :as fs) (|child_process :as cp) (|net :as net)
    'cumulo-util.realtime $ %{} 'FileEntry
      :defs $ {}
        'CoalescedPlan $ %{} 'CodeEntry (:doc "|The next coalesced state and delay for one externally-owned timer.")
          :code $ quote
            defstruct CoalescedPlan (:state 'cumulo-util.realtime/Coalescer) (:delay-ms 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'Coalescer $ %{} 'CodeEntry (:doc "||Immutable coalescing configuration with explicit pending-window state.")
          :code $ quote
            def Coalescer $ impl-traits
              defstruct Coalescer (:delay-ms 'Number) (:max-wait-ms 'Number) (:pending? 'Bool) (:first-request-ms 'Number)
              , CoalescerOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'CoalescerOps $ %{} 'CodeEntry (:doc "|Method contract for deterministic single-flight dispatch coalescing state.")
          :code $ quote
            deftrait CoalescerOps
              .request $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/Coalescer 'Number
                  :return 'cumulo-util.realtime/CoalescedPlan
              .flush $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/Coalescer
                  :return 'cumulo-util.realtime/Coalescer
              .cancel $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/Coalescer
                  :return 'cumulo-util.realtime/Coalescer
          :examples $ []
          :schema $ :: 'Trait
        'CoalescerOpsImpl $ %{} 'CodeEntry (:doc "|Coalescer method implementation.")
          :code $ quote
            defimpl CoalescerOpsImpl CoalescerOps (.request coalescer:request) (.flush coalescer:flush) (.cancel coalescer:cancel)
          :examples $ []
          :schema $ :: 'Impl
        'HeartbeatLease $ %{} 'CodeEntry (:doc "|Last-seen timestamp and absolute expiry deadline for a heartbeat lease.")
          :code $ quote
            def HeartbeatLease $ impl-traits
              defstruct HeartbeatLease (:last-seen-ms 'Number) (:deadline-ms 'Number)
              , HeartbeatLeaseOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'HeartbeatLeaseOps $ %{} 'CodeEntry (:doc "|Method contract for renewing and inspecting a transport-independent heartbeat lease.")
          :code $ quote
            deftrait HeartbeatLeaseOps
              .renew $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
                  :return 'cumulo-util.realtime/HeartbeatLease
              .expired? $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
                  :return 'Bool
          :examples $ []
          :schema $ :: 'Trait
        'HeartbeatLeaseOpsImpl $ %{} 'CodeEntry (:doc "|HeartbeatLease method implementation.")
          :code $ quote
            defimpl HeartbeatLeaseOpsImpl HeartbeatLeaseOps (.renew heartbeat-lease:renew) (.expired? heartbeat-lease:expired?)
          :examples $ []
          :schema $ :: 'Impl
        'RetryBackoff $ %{} 'CodeEntry (:doc "|Immutable exponential-backoff configuration and current attempt count.")
          :code $ quote
            def RetryBackoff $ impl-traits
              defstruct RetryBackoff (:base-delay-ms 'Number) (:max-delay-ms 'Number) (:jitter-ratio 'Number) (:attempt 'Number)
              , RetryBackoffOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'RetryBackoffOps $ %{} 'CodeEntry (:doc "|Method contract for advancing or resetting immutable retry backoff state.")
          :code $ quote
            deftrait RetryBackoffOps
              .next $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
                  :return 'cumulo-util.realtime/RetryStep
              .reset $ :: 'Fn
                {}
                  :args $ [] 'cumulo-util.realtime/RetryBackoff
                  :return 'cumulo-util.realtime/RetryBackoff
          :examples $ []
          :schema $ :: 'Trait
        'RetryBackoffOpsImpl $ %{} 'CodeEntry (:doc "|RetryBackoff method implementation.")
          :code $ quote
            defimpl RetryBackoffOpsImpl RetryBackoffOps (.next retry-backoff:next) (.reset retry-backoff:reset)
          :examples $ []
          :schema $ :: 'Impl
        'RetryStep $ %{} 'CodeEntry (:doc "|One retry delay and the immutable state to use for the next retry.")
          :code $ quote
            defstruct RetryStep (:delay-ms 'Number) (:next 'cumulo-util.realtime/RetryBackoff)
          :examples $ []
          :schema $ :: 'StructDef
        'coalescer $ %{} 'CodeEntry (:doc "|Create an idle coalescer. The caller owns actual timers and invokes request with its clock.")
          :code $ quote
            defn coalescer (delay-ms max-wait-ms)
              let
                  safe-delay $ if (> delay-ms 0) delay-ms 0
                  safe-max-wait $ if (> max-wait-ms safe-delay) max-wait-ms safe-delay
                %{} Coalescer (:delay-ms safe-delay) (:max-wait-ms safe-max-wait) (:pending? false) (:first-request-ms 0)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/Coalescer)
              :args $ [] 'Number 'Number
          :tags $ #{} :scaffold
        'coalescer:cancel $ %{} 'CodeEntry (:doc "||Clear explicit pending state after cancelling the externally-owned timer.")
          :code $ quote
            defn coalescer:cancel (self) (coalescer:flush self)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/Coalescer)
              :args $ [] 'cumulo-util.realtime/Coalescer
          :tags $ #{} :scaffold
        'coalescer:flush $ %{} 'CodeEntry (:doc "||Clear explicit pending state after an immediate flush.")
          :code $ quote
            defn coalescer:flush (self)
              let
                  cleared $ assoc self :pending? false
                assoc cleared :first-request-ms 0
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/Coalescer)
              :args $ [] 'cumulo-util.realtime/Coalescer
          :tags $ #{} :scaffold
        'coalescer:request $ %{} 'CodeEntry (:doc "||Merge a dispatch request and return the bounded delay for the caller-owned one timer.")
          :code $ quote
            defn coalescer:request (self now-ms)
              if (:pending? self)
                let
                    elapsed-ms $ if
                      > now-ms $ :first-request-ms self
                      - now-ms $ :first-request-ms self
                      , 0
                    remaining-ms $ if
                      > elapsed-ms $ :max-wait-ms self
                      , 0
                        - (:max-wait-ms self) elapsed-ms
                    delay-ms $ if
                      > (:delay-ms self) remaining-ms
                      , remaining-ms (:delay-ms self)
                  %{} CoalescedPlan (:state self) (:delay-ms delay-ms)
                let
                    pending-state $ assoc self :pending? true
                    next-state $ assoc pending-state :first-request-ms now-ms
                    delay-ms $ if
                      > (:delay-ms self) (:max-wait-ms self)
                      :max-wait-ms self
                      :delay-ms self
                  %{} CoalescedPlan (:state next-state) (:delay-ms delay-ms)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/CoalescedPlan)
              :args $ [] 'cumulo-util.realtime/Coalescer 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease $ %{} 'CodeEntry (:doc "|Create or renew a heartbeat lease at now-ms for timeout-ms.")
          :code $ quote
            defn heartbeat-lease (now-ms timeout-ms)
              let
                  safe-timeout $ if (> timeout-ms 0) timeout-ms 0
                %{} HeartbeatLease (:last-seen-ms now-ms)
                  :deadline-ms $ + now-ms safe-timeout
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/HeartbeatLease)
              :args $ [] 'Number 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease:expired? $ %{} 'CodeEntry (:doc "|Whether now-ms is at or beyond the heartbeat deadline.")
          :code $ quote
            defn heartbeat-lease:expired? (self now-ms)
              >= now-ms $ :deadline-ms self
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease:renew $ %{} 'CodeEntry (:doc "|Renew a heartbeat lease at now-ms for timeout-ms.")
          :code $ quote
            defn heartbeat-lease:renew (self now-ms timeout-ms)
              let
                  safe-timeout $ if (> timeout-ms 0) timeout-ms 0
                  touched $ assoc self :last-seen-ms now-ms
                assoc touched :deadline-ms $ + now-ms safe-timeout
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/HeartbeatLease)
              :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
          :tags $ #{} :scaffold
        'retry-backoff $ %{} 'CodeEntry (:doc "|Create retry state with attempt zero. random-unit is supplied later to next, keeping tests deterministic.")
          :code $ quote
            defn retry-backoff (base-delay-ms max-delay-ms jitter-ratio)
              let
                  safe-base $ if (> base-delay-ms 0) base-delay-ms 0
                  safe-maximum $ if (> max-delay-ms safe-base) max-delay-ms safe-base
                  safe-jitter $ if (< jitter-ratio 0) 0
                    if (> jitter-ratio 1) 1 jitter-ratio
                %{} RetryBackoff (:base-delay-ms safe-base) (:max-delay-ms safe-maximum) (:jitter-ratio safe-jitter) (:attempt 0)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/RetryBackoff)
              :args $ [] 'Number 'Number 'Number
          :tags $ #{} :scaffold
        'retry-backoff:next $ %{} 'CodeEntry (:doc "|Calculate one clamped exponential retry delay from a caller-supplied random unit and advance state.")
          :code $ quote
            defn retry-backoff:next (self random-unit)
              let
                  capped-random $ if (< random-unit 0) 0
                    if (> random-unit 1) 1 random-unit
                  exponential-delay $ * (:base-delay-ms self)
                    pow 2 $ :attempt self
                  capped-delay $ if
                    > exponential-delay $ :max-delay-ms self
                    :max-delay-ms self
                    , exponential-delay
                  jitter $ * (- capped-random 0.5) (:jitter-ratio self)
                  delay-ms $ floor
                    * capped-delay $ + 1 jitter
                  next-state $ assoc self :attempt
                    + 1 $ :attempt self
                %{} RetryStep (:delay-ms delay-ms) (:next next-state)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/RetryStep)
              :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
          :tags $ #{} :scaffold
        'retry-backoff:reset $ %{} 'CodeEntry (:doc "|Return the same retry configuration at attempt zero.")
          :code $ quote
            defn retry-backoff:reset (self) (assoc self :attempt 0)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'cumulo-util.realtime/RetryBackoff)
              :args $ [] 'cumulo-util.realtime/RetryBackoff
          :tags $ #{} :scaffold
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns cumulo-util.realtime)
