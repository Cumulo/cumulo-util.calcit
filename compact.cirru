
{} (:package |cumulo-util)
  :configs $ {} (:init-fn |cumulo-util.app/main!) (:reload-fn |cumulo-util.app/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |cumulo-util.app $ {}
      :ns $ quote
        ns cumulo-util.app $ :require
          [] cumulo-util.core :refer $ [] delay!
          [] cumulo-util.file :refer $ [] chan-pick-port write-mildly!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"Started") (task!) (write-mildly! "\"a/a/a" "\"a")
        |reload! $ quote
          defn reload! () (println "\"Reload") (task!)
        |task! $ quote
          defn task! () $ echo "\"Task..."
      :proc $ quote ()
    |cumulo-util.client $ {}
      :ns $ quote
        ns cumulo-util.client $ :require
          [] cumulo-util.core :refer $ [] on-page-touch
      :defs $ {}
        |main! $ quote
          defn main! () $ on-page-touch
            fn () $ println "\"called"
        |reload! $ quote
          defn reload! $
      :proc $ quote ()
    |cumulo-util.core $ {}
      :ns $ quote
        ns cumulo-util.core $ :require ([] "\"shortid" :as shortid)
      :defs $ {}
        |delay! $ quote
          defn delay! (duration task)
            js/setTimeout task $ * 1000 duration
        |id! $ quote
          defn id! () $ shortid/generate
        |on-page-touch $ quote
          defn on-page-touch (listener) (reset! *cooling false)
            let
                call-listener $ fn ()
                  when (not @*cooling) (listener) (reset! *cooling true)
                    delay! 0.8 $ fn () (reset! *cooling false)
              .addEventListener js/window "\"focus" $ fn (event) (call-listener)
              .addEventListener js/window "\"visibilitychange" $ fn (event)
                when
                  = "\"visible" $ .-visibilityState js/document
                  call-listener
        |repeat! $ quote
          defn repeat! (duration task)
            js/setInterval task $ * 1000 duration
        |unix-time! $ quote
          defn unix-time! () $ .valueOf (new js/Date)
        |*cooling $ quote (defatom *cooling false)
      :proc $ quote ()
    |cumulo-util.file $ {}
      :ns $ quote
        ns cumulo-util.file $ :require ([] "\"path" :as path) ([] "\"fs" :as fs) ([] "\"child_process" :as cp) ([] "\"net" :as net)
      :defs $ {}
        |get-backup-path! $ quote
          defn get-backup-path! () $ let
              now $ new js/Date
            path/join js/__dirname "\"backups"
              str $ inc (.getMonth now)
              str (.getDate now) "\"-snapshot.edn"
        |merge-local-edn! $ quote
          defn merge-local-edn! (x0 filepath handler)
            merge x0 $ let
                found? $ fs/existsSync filepath
              if (fn? handler) (handler found?)
              if found?
                parse-cirru-edn $ fs/readFileSync filepath |utf8
                , nil
        |sh! $ quote
          defn sh! (command) (println command)
            println $ .toString (cp/execSync command)
        |write-mildly! $ quote
          defn write-mildly! (file-path content)
            let
                dir $ path/dirname file-path
                filename $ path/basename file-path
                temp-name $ str "\"/tmp/" (.now js/Date) "\"-" (.random js/Math) "\"-" filename
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
      :proc $ quote ()
