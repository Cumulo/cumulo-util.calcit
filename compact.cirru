
{} (:package |cumulo-util)
  :configs $ {} (:init-fn |cumulo-util.client/main!) (:reload-fn |cumulo-util.client/reload!) (:version |0.0.4)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |cumulo-util.app/main!) (:reload-fn |cumulo-util.app/reload!)
      :modules $ []
  :files $ {}
    |cumulo-util.app $ {}
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"Started")
            println "\"gen id" $ id!
            task!
            write-mildly! "\"a/a/a" "\"a"
        |reload! $ quote
          defn reload! () (println "\"Reload") (task!)
        |task! $ quote
          defn task! () $ echo "\"Task..."
      :ns $ quote
        ns cumulo-util.app $ :require
          cumulo-util.core :refer $ id! delay!
          cumulo-util.file :refer $ chan-pick-port write-mildly!
    |cumulo-util.client $ {}
      :defs $ {}
        |main! $ quote
          defn main! () $ on-page-touch
            fn () $ println "\"called"
        |reload! $ quote
          defn reload! $
      :ns $ quote
        ns cumulo-util.client $ :require
          cumulo-util.core :refer $ on-page-touch
    |cumulo-util.core $ {}
      :defs $ {}
        |*cooling $ quote (defatom *cooling false)
        |delay! $ quote
          defn delay! (duration task)
            js/setTimeout task $ * 1000 duration
        |id! $ quote
          defn id! () $ nanoid
        |on-page-touch $ quote
          defn on-page-touch (listener) (reset! *cooling false)
            let
                call-listener $ fn ()
                  when (not @*cooling) (listener) (reset! *cooling true)
                    delay! 0.8 $ fn () (reset! *cooling false)
              .!addEventListener js/window "\"focus" $ fn (event) (call-listener)
              .!addEventListener js/window "\"visibilitychange" $ fn (event)
                when
                  = "\"visible" $ .-visibilityState js/document
                  call-listener
        |repeat! $ quote
          defn repeat! (duration task)
            js/setInterval task $ * 1000 duration
        |unix-time! $ quote
          defn unix-time! () $ .valueOf (new js/Date)
      :ns $ quote
        ns cumulo-util.core $ :require
          "\"nanoid" :refer $ nanoid
    |cumulo-util.file $ {}
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
      :ns $ quote
        ns cumulo-util.file $ :require ("\"path" :as path) ("\"fs" :as fs) ("\"child_process" :as cp) ("\"net" :as net)
