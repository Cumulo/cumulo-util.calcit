
{}
  :configs $ {} (:init-fn |cumulo-util.client/main!) (:port 6001) (:reload-fn |cumulo-util.client/reload!) (:storage-key |calcit.cirru) (:version |0.0.4)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |cumulo-util.app/main!) (:reload-fn |cumulo-util.app/reload!)
      :modules $ []
  :ir $ {} (:package |cumulo-util)
    :files $ {}
      |cumulo-util.app $ {}
        :defs $ {}
          |main! $ {} (:at 1544376077887) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |main!) (:type :leaf)
              |r $ {} (:at 1544376077887) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544376080766) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544376082800) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544376104360) (:by |B1y7Rc-Zz) (:text "|\"Started") (:type :leaf)
              |w $ {} (:at 1643533303775) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1643533304669) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1643533307264) (:by |B1y7Rc-Zz) (:text "|\"gen id") (:type :leaf)
                  |r $ {} (:at 1643533307634) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1643533309970) (:by |B1y7Rc-Zz) (:text |id!) (:type :leaf)
              |x $ {} (:at 1554570668197) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1554570669112) (:by |B1y7Rc-Zz) (:text |task!) (:type :leaf)
              |yT $ {} (:at 1557825830116) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1557825858715) (:by |B1y7Rc-Zz) (:text |write-mildly!) (:type :leaf)
                  |j $ {} (:at 1557854541314) (:by |B1y7Rc-Zz) (:text "|\"a/a/a") (:type :leaf)
                  |r $ {} (:at 1557854517454) (:by |B1y7Rc-Zz) (:text "|\"a") (:type :leaf)
          |reload! $ {} (:at 1544376090697) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1544376090697) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544376094205) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544376096579) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544376098486) (:by |B1y7Rc-Zz) (:text "|\"Reload") (:type :leaf)
              |x $ {} (:at 1554570674496) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1554570676010) (:by |B1y7Rc-Zz) (:text |task!) (:type :leaf)
          |task! $ {} (:at 1554570669607) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |task!) (:type :leaf)
              |r $ {} (:at 1554570669607) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1555827761744) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1614237177487) (:by |B1y7Rc-Zz) (:text |echo) (:type :leaf)
                  |j $ {} (:at 1614237180367) (:by |B1y7Rc-Zz) (:text "|\"Task...") (:type :leaf)
        :ns $ {} (:at 1544376075473) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |cumulo-util.app) (:type :leaf)
            |r $ {} (:at 1554570730877) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1590254948027) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1554570733161) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |cumulo-util.core) (:type :leaf)
                    |r $ {} (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1554570733161) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1643533300037) (:by |B1y7Rc-Zz) (:text |id!) (:type :leaf)
                        |j $ {} (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |delay!) (:type :leaf)
                |x $ {} (:at 1555827829007) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |cumulo-util.file) (:type :leaf)
                    |r $ {} (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1555827829007) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |chan-pick-port) (:type :leaf)
                        |r $ {} (:at 1557825853297) (:by |B1y7Rc-Zz) (:text |write-mildly!) (:type :leaf)
        :proc $ {} (:at 1544376075473) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
      |cumulo-util.client $ {}
        :defs $ {}
          |main! $ {} (:at 1545238886003) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |main!) (:type :leaf)
              |r $ {} (:at 1545238886003) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1545238900356) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545239558668) (:by |B1y7Rc-Zz) (:text |on-page-touch) (:type :leaf)
                  |j $ {} (:at 1545238913696) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1545238913954) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1545238914177) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1545238915117) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1545238916831) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                          |j $ {} (:at 1545238918535) (:by |B1y7Rc-Zz) (:text "|\"called") (:type :leaf)
          |reload! $ {} (:at 1545238887716) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1545238887716) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
        :ns $ {} (:at 1545238882929) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |cumulo-util.client) (:type :leaf)
            |r $ {} (:at 1545238920306) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1545238920985) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1545238921268) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1545238926811) (:by |B1y7Rc-Zz) (:text |cumulo-util.core) (:type :leaf)
                    |r $ {} (:at 1545238927503) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1545238927682) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1545239551233) (:by |B1y7Rc-Zz) (:text |on-page-touch) (:type :leaf)
        :proc $ {} (:at 1545238882929) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
      |cumulo-util.core $ {}
        :defs $ {}
          |*cooling $ {} (:at 1614236562549) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1614236567528) (:by |B1y7Rc-Zz) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1614236562549) (:by |B1y7Rc-Zz) (:text |*cooling) (:type :leaf)
              |r $ {} (:at 1614236565640) (:by |B1y7Rc-Zz) (:text |false) (:type :leaf)
          |delay! $ {} (:at 1544809351812) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |delay!) (:type :leaf)
              |r $ {} (:at 1544809351812) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544809358336) (:by |B1y7Rc-Zz) (:text |duration) (:type :leaf)
                  |j $ {} (:at 1544809952523) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
              |v $ {} (:at 1544809363226) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544809381057) (:by |B1y7Rc-Zz) (:text |js/setTimeout) (:type :leaf)
                  |j $ {} (:at 1544809954481) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                  |r $ {} (:at 1544810367577) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1544810371268) (:by |B1y7Rc-Zz) (:text |*) (:type :leaf)
                      |L $ {} (:at 1544810372387) (:by |B1y7Rc-Zz) (:text |1000) (:type :leaf)
                      |T $ {} (:at 1544809385199) (:by |B1y7Rc-Zz) (:text |duration) (:type :leaf)
          |id! $ {} (:at 1544810007428) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |id!) (:type :leaf)
              |r $ {} (:at 1544810007428) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544810024783) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |j $ {} (:at 1643533282182) (:by |B1y7Rc-Zz) (:text |nanoid) (:type :leaf)
          |on-page-touch $ {} (:at 1545238141975) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |on-page-touch) (:type :leaf)
              |r $ {} (:at 1545238141975) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545238151721) (:by |B1y7Rc-Zz) (:text |listener) (:type :leaf)
              |t $ {} (:at 1614236580084) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1614236582387) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                  |j $ {} (:at 1614236584194) (:by |B1y7Rc-Zz) (:text |*cooling) (:type :leaf)
                  |r $ {} (:at 1614236585524) (:by |B1y7Rc-Zz) (:text |false) (:type :leaf)
              |v $ {} (:at 1545238152794) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545238204448) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1545238205412) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |j $ {} (:at 1545238321763) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1545238326671) (:by |B1y7Rc-Zz) (:text |call-listener) (:type :leaf)
                          |j $ {} (:at 1545238328247) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545238328544) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1545238328784) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                              |r $ {} (:at 1545238441595) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1545238458968) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                                  |L $ {} (:at 1545238460105) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1545238460870) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                                      |T $ {} (:at 1545238451088) (:by |B1y7Rc-Zz) (:text |@*cooling) (:type :leaf)
                                  |T $ {} (:at 1545238329678) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1545238333030) (:by |B1y7Rc-Zz) (:text |listener) (:type :leaf)
                                  |j $ {} (:at 1545238465418) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                                      |j $ {} (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |*cooling) (:type :leaf)
                                      |r $ {} (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |true) (:type :leaf)
                                  |r $ {} (:at 1545238467946) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1545238728280) (:by |B1y7Rc-Zz) (:text |delay!) (:type :leaf)
                                      |j $ {} (:at 1545239116884) (:by |B1y7Rc-Zz) (:text |0.8) (:type :leaf)
                                      |r $ {} (:at 1614236527130) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1614236527687) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                                          |L $ {} (:at 1614236527927) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                          |T $ {} (:at 1545238467946) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |j $ {} (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |reset!) (:type :leaf)
                                              |r $ {} (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |*cooling) (:type :leaf)
                                              |v $ {} (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |false) (:type :leaf)
                  |r $ {} (:at 1545238227639) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657816901831) (:by |B1y7Rc-Zz) (:text |.!addEventListener) (:type :leaf)
                      |b $ {} (:at 1545238254747) (:by |B1y7Rc-Zz) (:text |js/window) (:type :leaf)
                      |j $ {} (:at 1545238237555) (:by |B1y7Rc-Zz) (:text "|\"focus") (:type :leaf)
                      |r $ {} (:at 1545238239284) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1545238239574) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1545238239834) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545238241326) (:by |B1y7Rc-Zz) (:text |event) (:type :leaf)
                          |r $ {} (:at 1545238320474) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545238320474) (:by |B1y7Rc-Zz) (:text |call-listener) (:type :leaf)
                  |v $ {} (:at 1545238242831) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1657816903241) (:by |B1y7Rc-Zz) (:text |.!addEventListener) (:type :leaf)
                      |j $ {} (:at 1545238252346) (:by |B1y7Rc-Zz) (:text |js/window) (:type :leaf)
                      |r $ {} (:at 1545238260227) (:by |B1y7Rc-Zz) (:text "|\"visibilitychange") (:type :leaf)
                      |x $ {} (:at 1545238615920) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1545238616788) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                          |L $ {} (:at 1545238617347) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545238617347) (:by |B1y7Rc-Zz) (:text |event) (:type :leaf)
                          |T $ {} (:at 1545238272582) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1545238275224) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                              |j $ {} (:at 1545238301585) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1545238302064) (:by |B1y7Rc-Zz) (:text |=) (:type :leaf)
                                  |L $ {} (:at 1545238307821) (:by |B1y7Rc-Zz) (:text "|\"visible") (:type :leaf)
                                  |T $ {} (:at 1545238280504) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1545238277762) (:by |B1y7Rc-Zz) (:text |.-visibilityState) (:type :leaf)
                                      |j $ {} (:at 1545238283775) (:by |B1y7Rc-Zz) (:text |js/document) (:type :leaf)
                              |r $ {} (:at 1545238310686) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1545238317804) (:by |B1y7Rc-Zz) (:text |call-listener) (:type :leaf)
          |repeat! $ {} (:at 1544809391704) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |repeat!) (:type :leaf)
              |r $ {} (:at 1544809391704) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544809396435) (:by |B1y7Rc-Zz) (:text |duration) (:type :leaf)
                  |j $ {} (:at 1544809512997) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
              |v $ {} (:at 1544809514124) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544809517696) (:by |B1y7Rc-Zz) (:text |js/setInterval) (:type :leaf)
                  |j $ {} (:at 1544809520848) (:by |B1y7Rc-Zz) (:text |task) (:type :leaf)
                  |r $ {} (:at 1544810355918) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1544810356885) (:by |B1y7Rc-Zz) (:text |*) (:type :leaf)
                      |L $ {} (:at 1544810357950) (:by |B1y7Rc-Zz) (:text |1000) (:type :leaf)
                      |T $ {} (:at 1544809523099) (:by |B1y7Rc-Zz) (:text |duration) (:type :leaf)
          |unix-time! $ {} (:at 1544809584916) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |unix-time!) (:type :leaf)
              |r $ {} (:at 1544809584916) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544809589762) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544809591694) (:by |B1y7Rc-Zz) (:text |.valueOf) (:type :leaf)
                  |j $ {} (:at 1544809592321) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1614234983316) (:by |B1y7Rc-Zz) (:text |new) (:type :leaf)
                      |T $ {} (:at 1614234982312) (:by |B1y7Rc-Zz) (:text |js/Date) (:type :leaf)
        :ns $ {} (:at 1544325947193) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |cumulo-util.core) (:type :leaf)
            |r $ {} (:at 1544810010536) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544810012136) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1544810012337) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1643533271296) (:by |B1y7Rc-Zz) (:text "|\"nanoid") (:type :leaf)
                    |r $ {} (:at 1643533276692) (:by |B1y7Rc-Zz) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1643533277102) (:by |B1y7Rc-Zz) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1643533277549) (:by |B1y7Rc-Zz) (:text |nanoid) (:type :leaf)
        :proc $ {} (:at 1544325947193) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
      |cumulo-util.file $ {}
        :defs $ {}
          |get-backup-path! $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |get-backup-path!) (:type :leaf)
              |r $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                          |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1614237302818) (:by |B1y7Rc-Zz) (:text |new) (:type :leaf)
                              |T $ {} (:at 1614237304059) (:by |B1y7Rc-Zz) (:text |js/Date) (:type :leaf)
                  |r $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |path/join) (:type :leaf)
                      |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |js/__dirname) (:type :leaf)
                      |r $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"backups") (:type :leaf)
                      |v $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |inc) (:type :leaf)
                              |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getMonth) (:type :leaf)
                                  |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                      |x $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                          |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getDate) (:type :leaf)
                              |j $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now) (:type :leaf)
                          |r $ {} (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"-snapshot.edn") (:type :leaf)
          |merge-local-edn! $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge-local-edn!) (:type :leaf)
              |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |x0) (:type :leaf)
                  |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath) (:type :leaf)
                  |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler) (:type :leaf)
              |v $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge) (:type :leaf)
                  |j $ {} (:at 1544726522051) (:by |B1y7Rc-Zz) (:text |x0) (:type :leaf)
                  |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                      |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?) (:type :leaf)
                              |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/existsSync) (:type :leaf)
                                  |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath) (:type :leaf)
                      |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                          |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fn?) (:type :leaf)
                              |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler) (:type :leaf)
                          |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler) (:type :leaf)
                              |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?) (:type :leaf)
                      |v $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                          |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?) (:type :leaf)
                          |r $ {} (:at 1614237273771) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1614440226810) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn) (:type :leaf)
                              |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/readFileSync) (:type :leaf)
                                  |j $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath) (:type :leaf)
                                  |r $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text ||utf8) (:type :leaf)
                          |v $ {} (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |nil) (:type :leaf)
          |sh! $ {} (:at 1545669620238) (:by |root) (:type :expr)
            :data $ {}
              |T $ {} (:at 1545669620238) (:by |root) (:text |defn) (:type :leaf)
              |j $ {} (:at 1545669620238) (:by |root) (:text |sh!) (:type :leaf)
              |r $ {} (:at 1545669620238) (:by |root) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545669620238) (:by |root) (:text |command) (:type :leaf)
              |v $ {} (:at 1545669620238) (:by |root) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545669620238) (:by |root) (:text |println) (:type :leaf)
                  |j $ {} (:at 1545669620238) (:by |root) (:text |command) (:type :leaf)
              |x $ {} (:at 1545669620238) (:by |root) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1545669620238) (:by |root) (:text |println) (:type :leaf)
                  |j $ {} (:at 1545669620238) (:by |root) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1545669620238) (:by |root) (:text |.toString) (:type :leaf)
                      |j $ {} (:at 1545669620238) (:by |root) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1545669620238) (:by |root) (:text |cp/execSync) (:type :leaf)
                          |j $ {} (:at 1545669620238) (:by |root) (:text |command) (:type :leaf)
          |write-mildly! $ {} (:at 1543163834194) (:by |B1y7Rc-Zz) (:type :expr)
            :data $ {}
              |T $ {} (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |defn) (:type :leaf)
              |j $ {} (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |write-mildly!) (:type :leaf)
              |r $ {} (:at 1543163834194) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1543163842033) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                  |j $ {} (:at 1543163845141) (:by |B1y7Rc-Zz) (:text |content) (:type :leaf)
              |t $ {} (:at 1543165226171) (:by |B1y7Rc-Zz) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1543165226834) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                  |L $ {} (:at 1543165227042) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1557825659473) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557825661402) (:by |B1y7Rc-Zz) (:text |dir) (:type :leaf)
                          |j $ {} (:at 1557825662112) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |path/dirname) (:type :leaf)
                              |j $ {} (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                      |L $ {} (:at 1557854284087) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557854289025) (:by |B1y7Rc-Zz) (:text |filename) (:type :leaf)
                          |j $ {} (:at 1557854289876) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557854293986) (:by |B1y7Rc-Zz) (:text |path/basename) (:type :leaf)
                              |j $ {} (:at 1557854300613) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                      |P $ {} (:at 1557854338428) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557854346642) (:by |B1y7Rc-Zz) (:text |temp-name) (:type :leaf)
                          |j $ {} (:at 1557854352074) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557854352532) (:by |B1y7Rc-Zz) (:text |str) (:type :leaf)
                              |b $ {} (:at 1557854468595) (:by |B1y7Rc-Zz) (:text "|\"/tmp/") (:type :leaf)
                              |j $ {} (:at 1557854354575) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |j $ {} (:at 1629483312976) (:by |B1y7Rc-Zz) (:text |js/Date.now) (:type :leaf)
                              |l $ {} (:at 1557854450555) (:by |B1y7Rc-Zz) (:text "|\"-") (:type :leaf)
                              |n $ {} (:at 1557854443501) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |j $ {} (:at 1629483315808) (:by |B1y7Rc-Zz) (:text |js/Math.random) (:type :leaf)
                              |p $ {} (:at 1557854454357) (:by |B1y7Rc-Zz) (:text "|\"-") (:type :leaf)
                              |r $ {} (:at 1557854364419) (:by |B1y7Rc-Zz) (:text |filename) (:type :leaf)
                      |T $ {} (:at 1543165227185) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1543165358367) (:by |B1y7Rc-Zz) (:text |do-write!) (:type :leaf)
                          |j $ {} (:at 1543165231092) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1543165231381) (:by |B1y7Rc-Zz) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1543165232171) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                              |r $ {} (:at 1543165236077) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |fs/writeFileSync) (:type :leaf)
                                  |j $ {} (:at 1557854368692) (:by |B1y7Rc-Zz) (:text |temp-name) (:type :leaf)
                                  |r $ {} (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |content) (:type :leaf)
                              |t $ {} (:at 1543165236077) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557854334522) (:by |B1y7Rc-Zz) (:text |fs/renameSync) (:type :leaf)
                                  |b $ {} (:at 1557854375319) (:by |B1y7Rc-Zz) (:text |temp-name) (:type :leaf)
                                  |j $ {} (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                              |v $ {} (:at 1543165249658) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1543165252627) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1543165256271) (:by |B1y7Rc-Zz) (:text "|\"Write to file:") (:type :leaf)
                                  |r $ {} (:at 1543165258888) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                  |P $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                      |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/existsSync) (:type :leaf)
                          |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                      |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |let) (:type :leaf)
                          |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content) (:type :leaf)
                                  |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/readFileSync) (:type :leaf)
                                      |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                                      |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"utf8") (:type :leaf)
                          |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if) (:type :leaf)
                              |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |not=) (:type :leaf)
                                  |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |content) (:type :leaf)
                                  |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content) (:type :leaf)
                              |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |do-write!) (:type :leaf)
                              |v $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1543165547456) (:by |B1y7Rc-Zz) (:text |;) (:type :leaf)
                                  |T $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"same file, skipping:") (:type :leaf)
                                  |r $ {} (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path) (:type :leaf)
                      |v $ {} (:at 1543165488856) (:by |B1y7Rc-Zz) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1557825755884) (:by |B1y7Rc-Zz) (:text |do) (:type :leaf)
                          |j $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |when) (:type :leaf)
                              |j $ {} (:at 1557827150820) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1557827154024) (:by |B1y7Rc-Zz) (:text |and) (:type :leaf)
                                  |T $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |not=) (:type :leaf)
                                      |j $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:text "|\".") (:type :leaf)
                                      |r $ {} (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |dir) (:type :leaf)
                                  |j $ {} (:at 1557827154746) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1557827155199) (:by |B1y7Rc-Zz) (:text |not) (:type :leaf)
                                      |j $ {} (:at 1557827155625) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557827161278) (:by |B1y7Rc-Zz) (:text |fs/existsSync) (:type :leaf)
                                          |j $ {} (:at 1557827163127) (:by |B1y7Rc-Zz) (:text |dir) (:type :leaf)
                              |v $ {} (:at 1557826941108) (:by |B1y7Rc-Zz) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1557826943900) (:by |B1y7Rc-Zz) (:text |fs/mkdirSync) (:type :leaf)
                                  |j $ {} (:at 1557826947546) (:by |B1y7Rc-Zz) (:text |dir) (:type :leaf)
                                  |r $ {} (:at 1557826947939) (:by |B1y7Rc-Zz) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1614237324720) (:by |B1y7Rc-Zz) (:text |to-js-data) (:type :leaf)
                                      |j $ {} (:at 1557826950189) (:by |B1y7Rc-Zz) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1557826950505) (:by |B1y7Rc-Zz) (:text |{}) (:type :leaf)
                                          |j $ {} (:at 1557826951014) (:by |B1y7Rc-Zz) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1557826956646) (:by |B1y7Rc-Zz) (:text |:recursive) (:type :leaf)
                                              |j $ {} (:at 1557826954274) (:by |B1y7Rc-Zz) (:text |true) (:type :leaf)
                          |r $ {} (:at 1557827118434) (:by |B1y7Rc-Zz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1543165491406) (:by |B1y7Rc-Zz) (:text |do-write!) (:type :leaf)
        :ns $ {} (:at 1544376144865) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |cumulo-util.file) (:type :leaf)
            |r $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:require) (:type :leaf)
                |j $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"path") (:type :leaf)
                    |r $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |path) (:type :leaf)
                |r $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"fs") (:type :leaf)
                    |r $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |fs) (:type :leaf)
                |t $ {} (:at 1557827183581) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1557827195242) (:by |B1y7Rc-Zz) (:text "|\"child_process") (:type :leaf)
                    |r $ {} (:at 1557827186528) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1557827193288) (:by |B1y7Rc-Zz) (:text |cp) (:type :leaf)
                |w $ {} (:at 1555827188060) (:by |B1y7Rc-Zz) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1555827189501) (:by |B1y7Rc-Zz) (:text "|\"net") (:type :leaf)
                    |r $ {} (:at 1555827190270) (:by |B1y7Rc-Zz) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1555827191053) (:by |B1y7Rc-Zz) (:text |net) (:type :leaf)
        :proc $ {} (:at 1544376144865) (:by |B1y7Rc-Zz) (:type :expr)
          :data $ {}
    :root $ {} (:def |main!) (:ns |main)
  :users $ {}
    |B1y7Rc-Zz $ {} (:avatar nil) (:id |B1y7Rc-Zz) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
