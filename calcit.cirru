
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |cumulo-util
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'cumulo-util.client/main!) (:mode :js) (:reload-fn 'cumulo-util.client/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |js-ffi/
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'cumulo-util.app/main!) (:mode :js) (:reload-fn 'cumulo-util.app/reload!) (:target :node)
      :feature-policy $ {}
      :modules $ [] |js-ffi/
      :type-slots $ {}
  :files $ {}
    'cumulo-util.activity $ %{} 'FileEntry
      :defs $ {}
        'page-online? $ %{} 'CodeEntry
          :doc "|Returns the browser online hint. It does not prove WebSocket or server health."
          :code $ quote $ defn page-online? ()
            &let (online js/navigator.onLine)
              if (bool? online) online true
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ []
            :features $ #{} :js-ffi
        'page-visible? $ %{} 'CodeEntry
          :doc "|Returns whether the browser document is currently visible."
          :code $ quote $ defn page-visible? ()
            match (browser/visibility-state)
              (:visible) true
              _ false
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ []
            :features $ #{} :js-ffi
        'watch-browser-lifecycle! $ %{} 'CodeEntry
          :doc "|Reports visibility, online/offline, throttled page touch, and visible-page heartbeat signals. Returns cleanup for every listener and timer."
          :code $ quote $ defn watch-browser-lifecycle! (callback heartbeat-ms)
            let
                interval-ms $ option:unwrap-or heartbeat-ms 3000
                *cooling $ ref false
                *touch-timer $ ref 0
                emit-touch! $ fn () $ when (not @*cooling) (callback :touch) (reset! *cooling true)
                  reset! *touch-timer $ browser/set-timeout!
                    fn () (reset! *cooling false) &unit
                    , 800
                on-visibility $ fn (event)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] 'js-ffi.browser/EventHost
                  if (page-visible?)
                    do (callback :visible) (emit-touch!)
                    callback :hidden
                  , &unit
                on-online $ fn (event)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] 'js-ffi.browser/EventHost
                  callback :online
                  , &unit
                on-offline $ fn (event)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] 'js-ffi.browser/EventHost
                  callback :offline
                  , &unit
                on-focus $ fn (event)
                  hint-fn $ {} (:return 'Unit)
                    :args $ [] 'js-ffi.browser/EventHost
                  emit-touch!
                  , &unit
                timer $ browser/set-interval!
                  fn ()
                    when (page-visible?) (callback :heartbeat)
                    , &unit
                  , interval-ms
              browser/add-event-listener! |visibilitychange on-visibility
              browser/add-event-listener! |online on-online
              browser/add-event-listener! |offline on-offline
              browser/add-event-listener! |focus on-focus
              callback $ if (page-visible?) :visible :hidden
              callback $ if (page-online?) :online :offline
              fn () (browser/remove-event-listener! |visibilitychange on-visibility) (browser/remove-event-listener! |online on-online) (browser/remove-event-listener! |offline on-offline) (browser/remove-event-listener! |focus on-focus) (browser/clear-interval! timer) (browser/clear-timeout! @*touch-timer) &unit
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'Tag
              :: 'Option 'Number
            :features $ #{} :js-ffi
            :return $ :: 'Fn $ {} (:return 'Unit)
              :args $ []
        'watch-page-activity! $ %{} 'CodeEntry
          :doc "|Reports :visible and :hidden transitions plus :heartbeat while visible. Emits the current visibility immediately and returns a cleanup function."
          :code $ quote $ defn watch-page-activity! (cb duration)
            watch-browser-lifecycle!
              fn (signal)
                when
                  or (= signal :visible) (= signal :hidden) (= signal :heartbeat)
                  cb signal
                , &unit
              js-nullish->option duration
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'Tag
              :: 'JsNullish 'Number
            :features $ #{} :js-ffi
            :return $ :: 'Fn $ {} (:return 'Unit)
              :args $ []
      :ns $ %{} 'NsEntry
        :doc "|Typed browser visibility and activity lifecycle signals. Transport protocols and reconnect policy belong to applications."
        :code $ quote $ ns cumulo-util.activity
          :require $ js-ffi.browser :as browser
    'cumulo-util.app $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println |Started) (task!) (write-mildly! |a/a/a |a) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println |Reload) (task!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'task! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn task! () (echo |Task...)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns cumulo-util.app
          :require $ cumulo-util.file :refer $ write-mildly!
    'cumulo-util.client $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            watch-browser-lifecycle!
              fn (activity) (println |activity activity)
              Option :none
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Fn)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns cumulo-util.client
          :require $ cumulo-util.activity :refer $ watch-page-activity! watch-browser-lifecycle!
    'cumulo-util.core $ %{} 'FileEntry
      :defs $ {}
        'on-page-touch $ %{} 'CodeEntry
          :doc "|Registers a throttled focus and visible-page callback through the unified lifecycle watcher. Returns cleanup for every listener and timer."
          :code $ quote $ defn on-page-touch (listener)
            watch-browser-lifecycle!
              fn (signal)
                when (= signal :touch) (listener)
                , &unit
              Option :none
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
            :return $ :: 'Fn $ {} (:return 'Unit)
              :args $ []
        'visibility-heartbeat $ %{} 'CodeEntry
          :doc "|Calls cb at the requested interval while the document is visible. Defaults to 3000 ms and returns the JavaScript interval handle."
          :code $ quote $ defn visibility-heartbeat (cb duration)
            let
                interval-ms $ option:unwrap-or (js-nullish->option duration) 3000
              browser/set-interval!
                fn ()
                  when (page-visible?) (cb)
                  , &unit
                , interval-ms
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
              :: 'Fn $ {} (:return 'Unit)
                :args $ []
              :: 'JsNullish 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry
        :doc "|Legacy zero-argument browser callbacks kept isolated for compatibility. New applications should use cumulo-util.activity."
        :code $ quote $ ns cumulo-util.core
          :require
            cumulo-util.activity :refer $ watch-browser-lifecycle! page-visible?
            js-ffi.browser :as browser
    'cumulo-util.file $ %{} 'FileEntry
      :defs $ {}
        'backup-date-suffix $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn backup-date-suffix () (raise |JS-only)
          :examples $ []
          :ffi $ {} (:target :node)
            :js $ {} (:file |js-ffi-assets/backup-date-suffix.js)
              :modules $ {} $ :path |node:path
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
        'command-output $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn command-output (command) (raise |JS-only)
          :examples $ []
          :ffi $ {} (:target :node)
            :js $ {} (:file |js-ffi-assets/command-output.js)
              :modules $ {} $ :cp |node:child_process
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'get-backup-path! $ %{} 'CodeEntry
          :doc "|Builds the legacy month/day snapshot path under the module backups directory."
          :code $ quote $ defn get-backup-path! ()
            path/join js/__dirname |backups $ backup-date-suffix
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
        'merge-local-edn! $ %{} 'CodeEntry
          :doc "|Merges a base map with Cirru EDN loaded from filepath when present; handler receives whether the file exists."
          :code $ quote $ defn merge-local-edn! (x0 filepath handler)
            let
                found? $ node/file-exists? filepath
              when (handler .some?)
                (handler .unwrap) found?
              if found?
                merge-dynamic x0 $ decode-map-as
                  parse-cirru-edn $ node/read-text! filepath
                  :: 'Map 'Dynamic 'Dynamic
                , x0
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Dynamic 'Dynamic) 'String $ :: 'Option
              :: 'Fn $ {} (:return 'R)
                :args $ [] 'Bool
            :features $ #{} :js-ffi
            :generics $ [] 'R
            :return $ :: 'Map 'Dynamic 'Dynamic
        'sh! $ %{} 'CodeEntry
          :doc "|Runs a shell command synchronously and prints the command and output."
          :code $ quote $ defn sh! (command) (println command)
            println $ command-output command
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'write-mildly! $ %{} 'CodeEntry
          :doc "|Atomically replaces a UTF-8 text file only when its content changed, creating parent directories as needed."
          :code $ quote $ defn write-mildly! (file-path content)
            let
                dir $ assert-type (path/dirname file-path) 'String
                filename $ assert-type (path/basename file-path) 'String
                temp-name $ str |/tmp/ (js/Date.now) |- (js/Math.random) |- filename
                do-write! $ fn () (fs/writeFileSync temp-name content) (fs/renameSync temp-name file-path) (println "|Write to file:" file-path)
              if (fs/existsSync file-path)
                let
                    old-content $ assert-type (fs/readFileSync file-path |utf8) 'String
                  if (not= content old-content) (do-write!) (; println "|same file, skipping:" file-path)
                do
                  when
                    and (not= |. dir)
                      not $ fs/existsSync dir
                    fs/mkdirSync dir $ to-js-data $ {} (:recursive true)
                  do-write!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry
        :doc "|Small Node.js filesystem and process helpers. Browser lifecycle helpers belong in cumulo-util.activity."
        :code $ quote $ ns cumulo-util.file
          :require (|path :as path) (|fs :as fs) (|child_process :as cp) (|net :as net) (js-ffi.node :as node)
    'cumulo-util.realtime $ %{} 'FileEntry
      :defs $ {}
        'CoalescedPlan $ %{} 'CodeEntry
          :doc "|The next coalesced state and delay for one externally-owned timer."
          :code $ quote $ defstruct CoalescedPlan (:state 'cumulo-util.realtime/Coalescer) (:delay-ms 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'Coalescer $ %{} 'CodeEntry
          :doc "||Immutable coalescing configuration with explicit pending-window state."
          :code $ quote $ def Coalescer
            impl-traits
              defstruct Coalescer (:delay-ms 'Number) (:max-wait-ms 'Number) (:pending? 'Bool) (:first-request-ms 'Number)
              , CoalescerOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'CoalescerOps $ %{} 'CodeEntry
          :doc "|Method contract for deterministic single-flight dispatch coalescing state."
          :code $ quote $ deftrait CoalescerOps
            .request $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/Coalescer 'Number
              :return 'cumulo-util.realtime/CoalescedPlan
            .flush $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/Coalescer
              :return 'cumulo-util.realtime/Coalescer
            .cancel $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/Coalescer
              :return 'cumulo-util.realtime/Coalescer
          :examples $ []
          :schema $ :: 'Trait
        'CoalescerOpsImpl $ %{} 'CodeEntry (:doc "|Coalescer method implementation.")
          :code $ quote $ defimpl CoalescerOpsImpl CoalescerOps (.request coalescer:request) (.flush coalescer:flush) (.cancel coalescer:cancel)
          :examples $ []
          :schema $ :: 'Impl
        'HeartbeatLease $ %{} 'CodeEntry
          :doc "|Last-seen timestamp and absolute expiry deadline for a heartbeat lease."
          :code $ quote $ def HeartbeatLease
            impl-traits
              defstruct HeartbeatLease (:last-seen-ms 'Number) (:deadline-ms 'Number)
              , HeartbeatLeaseOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'HeartbeatLeaseOps $ %{} 'CodeEntry
          :doc "|Method contract for renewing and inspecting a transport-independent heartbeat lease."
          :code $ quote $ deftrait HeartbeatLeaseOps
            .renew $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
              :return 'cumulo-util.realtime/HeartbeatLease
            .expired? $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
              :return 'Bool
          :examples $ []
          :schema $ :: 'Trait
        'HeartbeatLeaseOpsImpl $ %{} 'CodeEntry (:doc "|HeartbeatLease method implementation.")
          :code $ quote $ defimpl HeartbeatLeaseOpsImpl HeartbeatLeaseOps (.renew heartbeat-lease:renew) (.expired? heartbeat-lease:expired?)
          :examples $ []
          :schema $ :: 'Impl
        'RetryBackoff $ %{} 'CodeEntry
          :doc "|Immutable exponential-backoff configuration and current attempt count."
          :code $ quote $ def RetryBackoff
            impl-traits
              defstruct RetryBackoff (:base-delay-ms 'Number) (:max-delay-ms 'Number) (:jitter-ratio 'Number) (:attempt 'Number)
              , RetryBackoffOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'RetryBackoffOps $ %{} 'CodeEntry
          :doc "|Method contract for advancing or resetting immutable retry backoff state."
          :code $ quote $ deftrait RetryBackoffOps
            .next $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
              :return 'cumulo-util.realtime/RetryStep
            .reset $ :: 'Fn $ {}
              :args $ [] 'cumulo-util.realtime/RetryBackoff
              :return 'cumulo-util.realtime/RetryBackoff
          :examples $ []
          :schema $ :: 'Trait
        'RetryBackoffOpsImpl $ %{} 'CodeEntry (:doc "|RetryBackoff method implementation.")
          :code $ quote $ defimpl RetryBackoffOpsImpl RetryBackoffOps (.next retry-backoff:next) (.reset retry-backoff:reset)
          :examples $ []
          :schema $ :: 'Impl
        'RetryStep $ %{} 'CodeEntry
          :doc "|One retry delay and the immutable state to use for the next retry."
          :code $ quote $ defstruct RetryStep (:delay-ms 'Number) (:next 'cumulo-util.realtime/RetryBackoff)
          :examples $ []
          :schema $ :: 'StructDef
        'coalescer $ %{} 'CodeEntry
          :doc "|Create an idle coalescer. The caller owns actual timers and invokes request with its clock."
          :code $ quote $ defn coalescer (delay-ms max-wait-ms)
            let
                safe-delay $ if (> delay-ms 0) delay-ms 0
                safe-max-wait $ if (> max-wait-ms safe-delay) max-wait-ms safe-delay
              %{} Coalescer (:delay-ms safe-delay) (:max-wait-ms safe-max-wait) (:pending? false) (:first-request-ms 0)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/Coalescer)
            :args $ [] 'Number 'Number
          :tags $ #{} :scaffold
        'coalescer:cancel $ %{} 'CodeEntry
          :doc "||Clear explicit pending state after cancelling the externally-owned timer."
          :code $ quote $ defn coalescer:cancel (self) (coalescer:flush self)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/Coalescer)
            :args $ [] 'cumulo-util.realtime/Coalescer
          :tags $ #{} :scaffold
        'coalescer:flush $ %{} 'CodeEntry
          :doc "||Clear explicit pending state after an immediate flush."
          :code $ quote $ defn coalescer:flush (self)
            let
                cleared $ struct-with self $ :pending? false
              struct-with cleared $ :first-request-ms 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/Coalescer)
            :args $ [] 'cumulo-util.realtime/Coalescer
          :tags $ #{} :scaffold
        'coalescer:request $ %{} 'CodeEntry
          :doc "||Merge a dispatch request and return the bounded delay for the caller-owned one timer."
          :code $ quote $ defn coalescer:request (self now-ms)
            if (:pending? self)
              let
                  elapsed-ms $ if
                    > now-ms $ :first-request-ms self
                    - now-ms $ :first-request-ms self
                    , 0
                  remaining-ms $ if
                    > elapsed-ms $ :max-wait-ms self
                    , 0 $ - (:max-wait-ms self) elapsed-ms
                  delay-ms $ if
                    > (:delay-ms self) remaining-ms
                    , remaining-ms $ :delay-ms self
                %{} CoalescedPlan (:state self) (:delay-ms delay-ms)
              let
                  pending-state $ struct-with self $ :pending? true
                  next-state $ struct-with pending-state $ :first-request-ms now-ms
                  delay-ms $ if
                    > (:delay-ms self) (:max-wait-ms self)
                    :max-wait-ms self
                    :delay-ms self
                %{} CoalescedPlan (:state next-state) (:delay-ms delay-ms)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/CoalescedPlan)
            :args $ [] 'cumulo-util.realtime/Coalescer 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease $ %{} 'CodeEntry
          :doc "|Create or renew a heartbeat lease at now-ms for timeout-ms."
          :code $ quote $ defn heartbeat-lease (now-ms timeout-ms)
            let
                safe-timeout $ if (> timeout-ms 0) timeout-ms 0
              %{} HeartbeatLease (:last-seen-ms now-ms)
                :deadline-ms $ + now-ms safe-timeout
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/HeartbeatLease)
            :args $ [] 'Number 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease:expired? $ %{} 'CodeEntry
          :doc "|Whether now-ms is at or beyond the heartbeat deadline."
          :code $ quote $ defn heartbeat-lease:expired? (self now-ms)
            >= now-ms $ :deadline-ms self
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
          :tags $ #{} :scaffold
        'heartbeat-lease:renew $ %{} 'CodeEntry
          :doc "|Renew a heartbeat lease at now-ms for timeout-ms."
          :code $ quote $ defn heartbeat-lease:renew (self now-ms timeout-ms)
            let
                safe-timeout $ if (> timeout-ms 0) timeout-ms 0
                touched $ struct-with self $ :last-seen-ms now-ms
              struct-with touched $ :deadline-ms $ + now-ms safe-timeout
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/HeartbeatLease)
            :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
          :tags $ #{} :scaffold
        'retry-backoff $ %{} 'CodeEntry
          :doc "|Create retry state with attempt zero. random-unit is supplied later to next, keeping tests deterministic."
          :code $ quote $ defn retry-backoff (base-delay-ms max-delay-ms jitter-ratio)
            let
                safe-base $ if (> base-delay-ms 0) base-delay-ms 0
                safe-maximum $ if (> max-delay-ms safe-base) max-delay-ms safe-base
                safe-jitter $ if (< jitter-ratio 0) 0 $ if (> jitter-ratio 1) 1 jitter-ratio
              %{} RetryBackoff (:base-delay-ms safe-base) (:max-delay-ms safe-maximum) (:jitter-ratio safe-jitter) (:attempt 0)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/RetryBackoff)
            :args $ [] 'Number 'Number 'Number
          :tags $ #{} :scaffold
        'retry-backoff:next $ %{} 'CodeEntry
          :doc "|Calculate one clamped exponential retry delay from a caller-supplied random unit and advance state."
          :code $ quote $ defn retry-backoff:next (self random-unit)
            let
                capped-random $ if (< random-unit 0) 0 $ if (> random-unit 1) 1 random-unit
                exponential-delay $ * (:base-delay-ms self)
                  pow 2 $ :attempt self
                capped-delay $ if
                  > exponential-delay $ :max-delay-ms self
                  :max-delay-ms self
                  , exponential-delay
                jitter $ * (- capped-random 0.5) (:jitter-ratio self)
                delay-ms $ floor $ * capped-delay (+ 1 jitter)
                next-state $ struct-with self $ :attempt
                  + 1 $ :attempt self
              %{} RetryStep (:delay-ms delay-ms) (:next next-state)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/RetryStep)
            :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
          :tags $ #{} :scaffold
        'retry-backoff:reset $ %{} 'CodeEntry
          :doc "|Return the same retry configuration at attempt zero."
          :code $ quote $ defn retry-backoff:reset (self)
            struct-with self $ :attempt 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'cumulo-util.realtime/RetryBackoff)
            :args $ [] 'cumulo-util.realtime/RetryBackoff
          :tags $ #{} :scaffold
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns cumulo-util.realtime
