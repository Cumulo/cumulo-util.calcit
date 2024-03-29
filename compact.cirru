
{} (:package |cumulo-util)
  :configs $ {} (:init-fn |cumulo-util.client/main!) (:reload-fn |cumulo-util.client/reload!) (:version |0.0.7)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |cumulo-util.app/main!) (:reload-fn |cumulo-util.app/reload!)
      :modules $ []
  :files $ {}
    |cumulo-util.app $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"Started") (task!) (write-mildly! "\"a/a/a" "\"a")
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () (println "\"Reload") (task!)
        |task! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn task! () $ echo "\"Task..."
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns cumulo-util.app $ :require
            cumulo-util.file :refer $ write-mildly!
    |cumulo-util.client $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () $ on-page-touch
              fn () $ println "\"called"
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! $
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns cumulo-util.client $ :require
            cumulo-util.core :refer $ on-page-touch
    |cumulo-util.core $ %{} :FileEntry
      :defs $ {}
        |*cooling $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *cooling false)
        |on-page-touch $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn on-page-touch (listener) (reset! *cooling false)
              let
                  call-listener $ fn ()
                    when (not @*cooling) (listener) (reset! *cooling true)
                      flipped js/setTimeout 800 $ fn () (reset! *cooling false)
                js/window.addEventListener "\"focus" $ fn (event) (call-listener)
                js/window.addEventListener "\"visibilitychange" $ fn (event)
                  when
                    = "\"visible" $ .-visibilityState js/document
                    call-listener
        |visibility-heartbeat $ %{} :CodeEntry (:doc "|chrome 15s, firefox 7s, maybe, so pick a smaller time for checking")
          :code $ quote
            defn visibility-heartbeat (cb ? duration)
              flipped js/setInterval 3000 $ fn ()
                if
                  = "\"visible" $ .-visibilityState js/document
                  cb
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns cumulo-util.core)
    |cumulo-util.file $ %{} :FileEntry
      :defs $ {}
        |get-backup-path! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-backup-path! () $ let
                now $ new js/Date
              path/join js/__dirname "\"backups"
                str $ inc (.!getMonth now)
                str (.!getDate now) "\"-snapshot.edn"
        |merge-local-edn! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn merge-local-edn! (x0 filepath handler)
              merge x0 $ let
                  found? $ fs/existsSync filepath
                if (fn? handler) (handler found?)
                if found?
                  parse-cirru-edn $ fs/readFileSync filepath |utf8
                  , nil
        |sh! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn sh! (command) (println command)
              println $ .toString (cp/execSync command)
        |write-mildly! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn write-mildly! (file-path content)
              let
                  dir $ path/dirname file-path
                  filename $ path/basename file-path
                  temp-name $ str "\"/tmp/" (js/Date.now) "\"-" (js/Math.random) "\"-" filename
                  do-write! $ fn () (fs/writeFileSync temp-name content) (fs/renameSync temp-name file-path) (println "\"Write to file:" file-path)
                if (fs/existsSync file-path)
                  let
                      old-content $ fs/readFileSync file-path "\"utf8"
                    if (not= content old-content) (do-write!) (; println "\"same file, skipping:" file-path)
                  do
                    when
                      and (not= "\"." dir)
                        not $ fs/existsSync dir
                      fs/mkdirSync dir $ to-js-data
                        {} $ :recursive true
                    do-write!
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns cumulo-util.file $ :require ("\"path" :as path) ("\"fs" :as fs) ("\"child_process" :as cp) ("\"net" :as net)
