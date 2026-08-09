
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `cr query` to inspect and `cr edit`/`cr tree` to modify. Run `cr docs agents --full` first. Manual edits must follow format and schema conventions, then run `cr edit format`.") (:package |cumulo-util) (:version |0.0.9)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'cumulo-util.client/main!) (:mode :native) (:reload-fn 'cumulo-util.client/reload!)
      :modules $ []
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'cumulo-util.app/main!) (:mode :native) (:reload-fn 'cumulo-util.app/reload!)
      :modules $ []
      :type-slots $ {}
  :files $ {}
    |cumulo-util.activity $ %{} 'FileEntry
      :defs $ {}
        |page-visible? $ %{} 'CodeEntry (:doc "|Returns whether the browser document is currently visible.")
          :code $ quote
            defn page-visible? () $ = |visible js/document.visibilityState
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ []
              :features $ #{} :js-ffi
        |watch-page-activity! $ %{} 'CodeEntry (:doc "|Reports :visible and :hidden transitions plus :heartbeat while visible. Emits the current visibility immediately and returns a cleanup function.")
          :code $ quote
            defn watch-page-activity! (cb ? duration)
              let
                  interval-ms $ either duration 3000
                  emit-visibility! $ fn (event)
                    cb $ if (page-visible?) :visible :hidden
                  timer $ flipped js/setInterval interval-ms
                    fn () $ when (page-visible?) (cb :heartbeat)
                js/window.addEventListener |visibilitychange emit-visibility!
                emit-visibility! nil
                fn () (js/window.removeEventListener |visibilitychange emit-visibility!) (js/clearInterval timer)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ [] 'Fn (:: 'Option 'Number)
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc "|Typed browser visibility and activity lifecycle signals. Transport protocols and reconnect policy belong to applications.")
        :code $ quote (ns cumulo-util.activity)
    |cumulo-util.app $ %{} 'FileEntry
      :defs $ {}
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (println |Started) (task!) (write-mildly! |a/a/a |a) nil
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! () (println |Reload) (task!)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ []
              :features $ #{} :js-ffi
        |task! $ %{} 'CodeEntry (:doc |)
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
    |cumulo-util.client $ %{} 'FileEntry
      :defs $ {}
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ watch-page-activity!
              fn (activity) (println |activity activity)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ []
              :features $ #{} :js-ffi
        |reload! $ %{} 'CodeEntry (:doc |)
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
    |cumulo-util.core $ %{} 'FileEntry
      :defs $ {}
        |on-page-touch $ %{} 'CodeEntry (:doc "|Registers throttled focus and visible-page listeners. Returns a cleanup function that removes both listeners.")
          :code $ quote
            defn on-page-touch (listener)
              let
                  *cooling $ atom false
                  call-listener $ fn ()
                    when (not @*cooling) (listener) (reset! *cooling true)
                      flipped js/setTimeout 800 $ fn () (reset! *cooling false)
                  on-focus $ fn (event) (call-listener)
                  on-visibility $ fn (event)
                    let
                        document-node $ unsafe-coerce js/document 'JsObject
                      when
                        = |visible $ .-visibilityState document-node
                        call-listener
                js/window.addEventListener |focus on-focus
                js/window.addEventListener |visibilitychange on-visibility
                fn () (js/window.removeEventListener |focus on-focus) (js/window.removeEventListener |visibilitychange on-visibility)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Fn)
              :args $ [] 'Fn
              :features $ #{} :js-ffi
        |visibility-heartbeat $ %{} 'CodeEntry (:doc "|Calls cb at the requested interval while the document is visible. Defaults to 3000 ms and returns the JavaScript interval handle.")
          :code $ quote
            defn visibility-heartbeat (cb ? duration)
              unsafe-coerce
                flipped js/setInterval (either duration 3000)
                  fn () $ let
                      document-node $ unsafe-coerce js/document 'JsObject
                    when
                      = |visible $ .-visibilityState document-node
                      cb
                , 'Number
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Number)
              :args $ [] 'Fn (:: 'Option 'Number)
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc "|Legacy zero-argument browser callbacks kept isolated for compatibility. New applications should use cumulo-util.activity.")
        :code $ quote (ns cumulo-util.core)
    |cumulo-util.file $ %{} 'FileEntry
      :defs $ {}
        |get-backup-path! $ %{} 'CodeEntry (:doc "|Builds the legacy month/day snapshot path under the module backups directory.")
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
        |merge-local-edn! $ %{} 'CodeEntry (:doc "|Merges a base map with Cirru EDN loaded from filepath when present; handler receives whether the file exists.")
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
        |sh! $ %{} 'CodeEntry (:doc "|Runs a shell command synchronously and prints the command and output.")
          :code $ quote
            defn sh! (command) (println command)
              println $ .toString (cp/execSync command)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'String
              :features $ #{} :js-ffi
        |write-mildly! $ %{} 'CodeEntry (:doc "|Atomically replaces a UTF-8 text file only when its content changed, creating parent directories as needed.")
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
