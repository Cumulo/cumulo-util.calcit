
{} (:package |cumulo-util)
  :configs $ {} (:init-fn |cumulo-util.client/main!) (:port 6001) (:reload-fn |cumulo-util.client/reload!) (:storage-key |calcit.cirru) (:version |0.0.6)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |cumulo-util.app/main!) (:reload-fn |cumulo-util.app/reload!)
      :modules $ []
  :files $ {}
    |cumulo-util.app $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544376077887) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |main!)
              |r $ %{} :Expr (:at 1544376077887) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1544376080766) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544376082800) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1544376104360) (:by |B1y7Rc-Zz) (:text "|\"Started")
              |w $ %{} :Expr (:at 1643533303775) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1643533304669) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1643533307264) (:by |B1y7Rc-Zz) (:text "|\"gen id")
                  |r $ %{} :Expr (:at 1643533307634) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1643533309970) (:by |B1y7Rc-Zz) (:text |id!)
              |x $ %{} :Expr (:at 1554570668197) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1554570669112) (:by |B1y7Rc-Zz) (:text |task!)
              |yT $ %{} :Expr (:at 1557825830116) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1557825858715) (:by |B1y7Rc-Zz) (:text |write-mildly!)
                  |j $ %{} :Leaf (:at 1557854541314) (:by |B1y7Rc-Zz) (:text "|\"a/a/a")
                  |r $ %{} :Leaf (:at 1557854517454) (:by |B1y7Rc-Zz) (:text "|\"a")
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544376090697) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |reload!)
              |r $ %{} :Expr (:at 1544376090697) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1544376094205) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544376096579) (:by |B1y7Rc-Zz) (:text |println)
                  |j $ %{} :Leaf (:at 1544376098486) (:by |B1y7Rc-Zz) (:text "|\"Reload")
              |x $ %{} :Expr (:at 1554570674496) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1554570676010) (:by |B1y7Rc-Zz) (:text |task!)
        |task! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1554570669607) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |task!)
              |r $ %{} :Expr (:at 1554570669607) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1555827761744) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1614237177487) (:by |B1y7Rc-Zz) (:text |echo)
                  |j $ %{} :Leaf (:at 1614237180367) (:by |B1y7Rc-Zz) (:text "|\"Task...")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544376075473) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |cumulo-util.app)
            |r $ %{} :Expr (:at 1554570730877) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1590254948027) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1554570733161) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                    |r $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1554570733161) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1643533300037) (:by |B1y7Rc-Zz) (:text |id!)
                        |j $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |delay!)
                |x $ %{} :Expr (:at 1555827829007) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |cumulo-util.file)
                    |r $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1555827829007) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |chan-pick-port)
                        |r $ %{} :Leaf (:at 1557825853297) (:by |B1y7Rc-Zz) (:text |write-mildly!)
    |cumulo-util.client $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545238886003) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |main!)
              |r $ %{} :Expr (:at 1545238886003) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1545238900356) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545239558668) (:by |B1y7Rc-Zz) (:text |on-page-touch)
                  |j $ %{} :Expr (:at 1545238913696) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1545238913954) (:by |B1y7Rc-Zz) (:text |fn)
                      |j $ %{} :Expr (:at 1545238914177) (:by |B1y7Rc-Zz)
                        :data $ {}
                      |r $ %{} :Expr (:at 1545238915117) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1545238916831) (:by |B1y7Rc-Zz) (:text |println)
                          |j $ %{} :Leaf (:at 1545238918535) (:by |B1y7Rc-Zz) (:text "|\"called")
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545238887716) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |reload!)
              |r $ %{} :Expr (:at 1545238887716) (:by |B1y7Rc-Zz)
                :data $ {}
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1545238882929) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |cumulo-util.client)
            |r $ %{} :Expr (:at 1545238920306) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1545238920985) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1545238921268) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1545238926811) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                    |r $ %{} :Leaf (:at 1545238927503) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1545238927682) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1545239551233) (:by |B1y7Rc-Zz) (:text |on-page-touch)
    |cumulo-util.core $ %{} :FileEntry
      :defs $ {}
        |*cooling $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1614236562549) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1614236567528) (:by |B1y7Rc-Zz) (:text |defatom)
              |j $ %{} :Leaf (:at 1614236562549) (:by |B1y7Rc-Zz) (:text |*cooling)
              |r $ %{} :Leaf (:at 1614236565640) (:by |B1y7Rc-Zz) (:text |false)
        |delay! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544809351812) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |delay!)
              |r $ %{} :Expr (:at 1544809351812) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544809358336) (:by |B1y7Rc-Zz) (:text |duration)
                  |j $ %{} :Leaf (:at 1544809952523) (:by |B1y7Rc-Zz) (:text |task)
              |v $ %{} :Expr (:at 1544809363226) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544809381057) (:by |B1y7Rc-Zz) (:text |js/setTimeout)
                  |j $ %{} :Leaf (:at 1544809954481) (:by |B1y7Rc-Zz) (:text |task)
                  |r $ %{} :Expr (:at 1544810367577) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1544810371268) (:by |B1y7Rc-Zz) (:text |*)
                      |L $ %{} :Leaf (:at 1544810372387) (:by |B1y7Rc-Zz) (:text |1000)
                      |T $ %{} :Leaf (:at 1544809385199) (:by |B1y7Rc-Zz) (:text |duration)
        |id! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544810007428) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |id!)
              |r $ %{} :Expr (:at 1544810007428) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1544810024783) (:by |B1y7Rc-Zz)
                :data $ {}
                  |j $ %{} :Leaf (:at 1643533282182) (:by |B1y7Rc-Zz) (:text |nanoid)
        |on-page-touch $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545238141975) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |on-page-touch)
              |r $ %{} :Expr (:at 1545238141975) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545238151721) (:by |B1y7Rc-Zz) (:text |listener)
              |t $ %{} :Expr (:at 1614236580084) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1614236582387) (:by |B1y7Rc-Zz) (:text |reset!)
                  |j $ %{} :Leaf (:at 1614236584194) (:by |B1y7Rc-Zz) (:text |*cooling)
                  |r $ %{} :Leaf (:at 1614236585524) (:by |B1y7Rc-Zz) (:text |false)
              |v $ %{} :Expr (:at 1545238152794) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545238204448) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1545238205412) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Expr (:at 1545238321763) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1545238326671) (:by |B1y7Rc-Zz) (:text |call-listener)
                          |j $ %{} :Expr (:at 1545238328247) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545238328544) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1545238328784) (:by |B1y7Rc-Zz)
                                :data $ {}
                              |r $ %{} :Expr (:at 1545238441595) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1545238458968) (:by |B1y7Rc-Zz) (:text |when)
                                  |L $ %{} :Expr (:at 1545238460105) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1545238460870) (:by |B1y7Rc-Zz) (:text |not)
                                      |T $ %{} :Leaf (:at 1545238451088) (:by |B1y7Rc-Zz) (:text |@*cooling)
                                  |T $ %{} :Expr (:at 1545238329678) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1545238333030) (:by |B1y7Rc-Zz) (:text |listener)
                                  |j $ %{} :Expr (:at 1545238465418) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |reset!)
                                      |j $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |*cooling)
                                      |r $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |true)
                                  |r $ %{} :Expr (:at 1545238467946) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1545238728280) (:by |B1y7Rc-Zz) (:text |delay!)
                                      |j $ %{} :Leaf (:at 1545239116884) (:by |B1y7Rc-Zz) (:text |0.8)
                                      |r $ %{} :Expr (:at 1614236527130) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1614236527687) (:by |B1y7Rc-Zz) (:text |fn)
                                          |L $ %{} :Expr (:at 1614236527927) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                          |T $ %{} :Expr (:at 1545238467946) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |j $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |reset!)
                                              |r $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |*cooling)
                                              |v $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |false)
                  |r $ %{} :Expr (:at 1545238227639) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657816901831) (:by |B1y7Rc-Zz) (:text |.!addEventListener)
                      |b $ %{} :Leaf (:at 1545238254747) (:by |B1y7Rc-Zz) (:text |js/window)
                      |j $ %{} :Leaf (:at 1545238237555) (:by |B1y7Rc-Zz) (:text "|\"focus")
                      |r $ %{} :Expr (:at 1545238239284) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1545238239574) (:by |B1y7Rc-Zz) (:text |fn)
                          |j $ %{} :Expr (:at 1545238239834) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545238241326) (:by |B1y7Rc-Zz) (:text |event)
                          |r $ %{} :Expr (:at 1545238320474) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545238320474) (:by |B1y7Rc-Zz) (:text |call-listener)
                  |v $ %{} :Expr (:at 1545238242831) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1657816903241) (:by |B1y7Rc-Zz) (:text |.!addEventListener)
                      |j $ %{} :Leaf (:at 1545238252346) (:by |B1y7Rc-Zz) (:text |js/window)
                      |r $ %{} :Leaf (:at 1545238260227) (:by |B1y7Rc-Zz) (:text "|\"visibilitychange")
                      |x $ %{} :Expr (:at 1545238615920) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1545238616788) (:by |B1y7Rc-Zz) (:text |fn)
                          |L $ %{} :Expr (:at 1545238617347) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545238617347) (:by |B1y7Rc-Zz) (:text |event)
                          |T $ %{} :Expr (:at 1545238272582) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1545238275224) (:by |B1y7Rc-Zz) (:text |when)
                              |j $ %{} :Expr (:at 1545238301585) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1545238302064) (:by |B1y7Rc-Zz) (:text |=)
                                  |L $ %{} :Leaf (:at 1545238307821) (:by |B1y7Rc-Zz) (:text "|\"visible")
                                  |T $ %{} :Expr (:at 1545238280504) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1545238277762) (:by |B1y7Rc-Zz) (:text |.-visibilityState)
                                      |j $ %{} :Leaf (:at 1545238283775) (:by |B1y7Rc-Zz) (:text |js/document)
                              |r $ %{} :Expr (:at 1545238310686) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1545238317804) (:by |B1y7Rc-Zz) (:text |call-listener)
        |repeat! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544809391704) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |repeat!)
              |r $ %{} :Expr (:at 1544809391704) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544809396435) (:by |B1y7Rc-Zz) (:text |duration)
                  |j $ %{} :Leaf (:at 1544809512997) (:by |B1y7Rc-Zz) (:text |task)
              |v $ %{} :Expr (:at 1544809514124) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544809517696) (:by |B1y7Rc-Zz) (:text |js/setInterval)
                  |j $ %{} :Leaf (:at 1544809520848) (:by |B1y7Rc-Zz) (:text |task)
                  |r $ %{} :Expr (:at 1544810355918) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1544810356885) (:by |B1y7Rc-Zz) (:text |*)
                      |L $ %{} :Leaf (:at 1544810357950) (:by |B1y7Rc-Zz) (:text |1000)
                      |T $ %{} :Leaf (:at 1544809523099) (:by |B1y7Rc-Zz) (:text |duration)
        |unix-time! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544809584916) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |unix-time!)
              |r $ %{} :Expr (:at 1544809584916) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1544809589762) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544809591694) (:by |B1y7Rc-Zz) (:text |.valueOf)
                  |j $ %{} :Expr (:at 1544809592321) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1614234983316) (:by |B1y7Rc-Zz) (:text |new)
                      |T $ %{} :Leaf (:at 1614234982312) (:by |B1y7Rc-Zz) (:text |js/Date)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544325947193) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
            |r $ %{} :Expr (:at 1544810010536) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544810012136) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1544810012337) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1643533271296) (:by |B1y7Rc-Zz) (:text "|\"nanoid")
                    |r $ %{} :Leaf (:at 1643533276692) (:by |B1y7Rc-Zz) (:text |:refer)
                    |v $ %{} :Expr (:at 1643533277102) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1643533277549) (:by |B1y7Rc-Zz) (:text |nanoid)
    |cumulo-util.file $ %{} :FileEntry
      :defs $ {}
        |get-backup-path! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |get-backup-path!)
              |r $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                :data $ {}
              |v $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |let)
                  |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                          |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1614237302818) (:by |B1y7Rc-Zz) (:text |new)
                              |T $ %{} :Leaf (:at 1614237304059) (:by |B1y7Rc-Zz) (:text |js/Date)
                  |r $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |path/join)
                      |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |js/__dirname)
                      |r $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"backups")
                      |v $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |inc)
                              |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getMonth)
                                  |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                      |x $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str)
                          |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getDate)
                              |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                          |r $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"-snapshot.edn")
        |merge-local-edn! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge-local-edn!)
              |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |x0)
                  |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                  |r $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
              |v $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge)
                  |j $ %{} :Leaf (:at 1544726522051) (:by |B1y7Rc-Zz) (:text |x0)
                  |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |let)
                      |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                              |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                                  |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                      |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if)
                          |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fn?)
                              |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
                          |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
                              |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                      |v $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if)
                          |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                          |r $ %{} :Expr (:at 1614237273771) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1614440226810) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn)
                              |T $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/readFileSync)
                                  |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                                  |r $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text ||utf8)
                          |v $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |nil)
        |sh! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545669620238) (:by |root)
            :data $ {}
              |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |defn)
              |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |sh!)
              |r $ %{} :Expr (:at 1545669620238) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
              |v $ %{} :Expr (:at 1545669620238) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |println)
                  |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
              |x $ %{} :Expr (:at 1545669620238) (:by |root)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |println)
                  |j $ %{} :Expr (:at 1545669620238) (:by |root)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |.toString)
                      |j $ %{} :Expr (:at 1545669620238) (:by |root)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |cp/execSync)
                          |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
        |write-mildly! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1543163834194) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |defn)
              |j $ %{} :Leaf (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |write-mildly!)
              |r $ %{} :Expr (:at 1543163834194) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1543163842033) (:by |B1y7Rc-Zz) (:text |file-path)
                  |j $ %{} :Leaf (:at 1543163845141) (:by |B1y7Rc-Zz) (:text |content)
              |t $ %{} :Expr (:at 1543165226171) (:by |B1y7Rc-Zz)
                :data $ {}
                  |D $ %{} :Leaf (:at 1543165226834) (:by |B1y7Rc-Zz) (:text |let)
                  |L $ %{} :Expr (:at 1543165227042) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |D $ %{} :Expr (:at 1557825659473) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557825661402) (:by |B1y7Rc-Zz) (:text |dir)
                          |j $ %{} :Expr (:at 1557825662112) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |path/dirname)
                              |j $ %{} :Leaf (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |file-path)
                      |L $ %{} :Expr (:at 1557854284087) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557854289025) (:by |B1y7Rc-Zz) (:text |filename)
                          |j $ %{} :Expr (:at 1557854289876) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557854293986) (:by |B1y7Rc-Zz) (:text |path/basename)
                              |j $ %{} :Leaf (:at 1557854300613) (:by |B1y7Rc-Zz) (:text |file-path)
                      |P $ %{} :Expr (:at 1557854338428) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557854346642) (:by |B1y7Rc-Zz) (:text |temp-name)
                          |j $ %{} :Expr (:at 1557854352074) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557854352532) (:by |B1y7Rc-Zz) (:text |str)
                              |b $ %{} :Leaf (:at 1557854468595) (:by |B1y7Rc-Zz) (:text "|\"/tmp/")
                              |j $ %{} :Expr (:at 1557854354575) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |j $ %{} :Leaf (:at 1629483312976) (:by |B1y7Rc-Zz) (:text |js/Date.now)
                              |l $ %{} :Leaf (:at 1557854450555) (:by |B1y7Rc-Zz) (:text "|\"-")
                              |n $ %{} :Expr (:at 1557854443501) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |j $ %{} :Leaf (:at 1629483315808) (:by |B1y7Rc-Zz) (:text |js/Math.random)
                              |p $ %{} :Leaf (:at 1557854454357) (:by |B1y7Rc-Zz) (:text "|\"-")
                              |r $ %{} :Leaf (:at 1557854364419) (:by |B1y7Rc-Zz) (:text |filename)
                      |T $ %{} :Expr (:at 1543165227185) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1543165358367) (:by |B1y7Rc-Zz) (:text |do-write!)
                          |j $ %{} :Expr (:at 1543165231092) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1543165231381) (:by |B1y7Rc-Zz) (:text |fn)
                              |j $ %{} :Expr (:at 1543165232171) (:by |B1y7Rc-Zz)
                                :data $ {}
                              |r $ %{} :Expr (:at 1543165236077) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |fs/writeFileSync)
                                  |j $ %{} :Leaf (:at 1557854368692) (:by |B1y7Rc-Zz) (:text |temp-name)
                                  |r $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |content)
                              |t $ %{} :Expr (:at 1543165236077) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557854334522) (:by |B1y7Rc-Zz) (:text |fs/renameSync)
                                  |b $ %{} :Leaf (:at 1557854375319) (:by |B1y7Rc-Zz) (:text |temp-name)
                                  |j $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |file-path)
                              |v $ %{} :Expr (:at 1543165249658) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1543165252627) (:by |B1y7Rc-Zz) (:text |println)
                                  |j $ %{} :Leaf (:at 1543165256271) (:by |B1y7Rc-Zz) (:text "|\"Write to file:")
                                  |r $ %{} :Leaf (:at 1543165258888) (:by |B1y7Rc-Zz) (:text |file-path)
                  |P $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if)
                      |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                          |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                      |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |let)
                          |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content)
                                  |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/readFileSync)
                                      |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                                      |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"utf8")
                          |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if)
                              |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |not=)
                                  |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |content)
                                  |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content)
                              |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |do-write!)
                              |v $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1543165547456) (:by |B1y7Rc-Zz) (:text |;)
                                  |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |println)
                                  |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"same file, skipping:")
                                  |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                      |v $ %{} :Expr (:at 1543165488856) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1557825755884) (:by |B1y7Rc-Zz) (:text |do)
                          |j $ %{} :Expr (:at 1557825761997) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |when)
                              |j $ %{} :Expr (:at 1557827150820) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |D $ %{} :Leaf (:at 1557827154024) (:by |B1y7Rc-Zz) (:text |and)
                                  |T $ %{} :Expr (:at 1557825761997) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |not=)
                                      |j $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text "|\".")
                                      |r $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |dir)
                                  |j $ %{} :Expr (:at 1557827154746) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1557827155199) (:by |B1y7Rc-Zz) (:text |not)
                                      |j $ %{} :Expr (:at 1557827155625) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557827161278) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                                          |j $ %{} :Leaf (:at 1557827163127) (:by |B1y7Rc-Zz) (:text |dir)
                              |v $ %{} :Expr (:at 1557826941108) (:by |B1y7Rc-Zz)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1557826943900) (:by |B1y7Rc-Zz) (:text |fs/mkdirSync)
                                  |j $ %{} :Leaf (:at 1557826947546) (:by |B1y7Rc-Zz) (:text |dir)
                                  |r $ %{} :Expr (:at 1557826947939) (:by |B1y7Rc-Zz)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1614237324720) (:by |B1y7Rc-Zz) (:text |to-js-data)
                                      |j $ %{} :Expr (:at 1557826950189) (:by |B1y7Rc-Zz)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1557826950505) (:by |B1y7Rc-Zz) (:text |{})
                                          |j $ %{} :Expr (:at 1557826951014) (:by |B1y7Rc-Zz)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1557826956646) (:by |B1y7Rc-Zz) (:text |:recursive)
                                              |j $ %{} :Leaf (:at 1557826954274) (:by |B1y7Rc-Zz) (:text |true)
                          |r $ %{} :Expr (:at 1557827118434) (:by |B1y7Rc-Zz)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1543165491406) (:by |B1y7Rc-Zz) (:text |do-write!)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544376144865) (:by |B1y7Rc-Zz)
          :data $ {}
            |T $ %{} :Leaf (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |ns)
            |j $ %{} :Leaf (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |cumulo-util.file)
            |r $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:require)
                |j $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"path")
                    |r $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |path)
                |r $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"fs")
                    |r $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |fs)
                |t $ %{} :Expr (:at 1557827183581) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1557827195242) (:by |B1y7Rc-Zz) (:text "|\"child_process")
                    |r $ %{} :Leaf (:at 1557827186528) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1557827193288) (:by |B1y7Rc-Zz) (:text |cp)
                |w $ %{} :Expr (:at 1555827188060) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1555827189501) (:by |B1y7Rc-Zz) (:text "|\"net")
                    |r $ %{} :Leaf (:at 1555827190270) (:by |B1y7Rc-Zz) (:text |:as)
                    |v $ %{} :Leaf (:at 1555827191053) (:by |B1y7Rc-Zz) (:text |net)
  :ir $ {} (:package |cumulo-util)
    :files $ {}
      |cumulo-util.app $ {}
        :defs $ {}
          |main! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544376077887) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544376077887) (:by |B1y7Rc-Zz) (:text |main!)
                |r $ %{} :Expr (:at 1544376077887) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1544376080766) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544376082800) (:by |B1y7Rc-Zz) (:text |println)
                    |j $ %{} :Leaf (:at 1544376104360) (:by |B1y7Rc-Zz) (:text "|\"Started")
                |w $ %{} :Expr (:at 1643533303775) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1643533304669) (:by |B1y7Rc-Zz) (:text |println)
                    |j $ %{} :Leaf (:at 1643533307264) (:by |B1y7Rc-Zz) (:text "|\"gen id")
                    |r $ %{} :Expr (:at 1643533307634) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1643533309970) (:by |B1y7Rc-Zz) (:text |id!)
                |x $ %{} :Expr (:at 1554570668197) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1554570669112) (:by |B1y7Rc-Zz) (:text |task!)
                |yT $ %{} :Expr (:at 1557825830116) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1557825858715) (:by |B1y7Rc-Zz) (:text |write-mildly!)
                    |j $ %{} :Leaf (:at 1557854541314) (:by |B1y7Rc-Zz) (:text "|\"a/a/a")
                    |r $ %{} :Leaf (:at 1557854517454) (:by |B1y7Rc-Zz) (:text "|\"a")
          |reload! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544376090697) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544376090697) (:by |B1y7Rc-Zz) (:text |reload!)
                |r $ %{} :Expr (:at 1544376090697) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1544376094205) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544376096579) (:by |B1y7Rc-Zz) (:text |println)
                    |j $ %{} :Leaf (:at 1544376098486) (:by |B1y7Rc-Zz) (:text "|\"Reload")
                |x $ %{} :Expr (:at 1554570674496) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1554570676010) (:by |B1y7Rc-Zz) (:text |task!)
          |task! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1554570669607) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1554570669607) (:by |B1y7Rc-Zz) (:text |task!)
                |r $ %{} :Expr (:at 1554570669607) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1555827761744) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1614237177487) (:by |B1y7Rc-Zz) (:text |echo)
                    |j $ %{} :Leaf (:at 1614237180367) (:by |B1y7Rc-Zz) (:text "|\"Task...")
        :ns $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544376075473) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |ns)
              |j $ %{} :Leaf (:at 1544376075473) (:by |B1y7Rc-Zz) (:text |cumulo-util.app)
              |r $ %{} :Expr (:at 1554570730877) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1590254948027) (:by |B1y7Rc-Zz) (:text |:require)
                  |j $ %{} :Expr (:at 1554570733161) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                      |r $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |:refer)
                      |v $ %{} :Expr (:at 1554570733161) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1643533300037) (:by |B1y7Rc-Zz) (:text |id!)
                          |j $ %{} :Leaf (:at 1554570733161) (:by |B1y7Rc-Zz) (:text |delay!)
                  |x $ %{} :Expr (:at 1555827829007) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |cumulo-util.file)
                      |r $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |:refer)
                      |v $ %{} :Expr (:at 1555827829007) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |j $ %{} :Leaf (:at 1555827829007) (:by |B1y7Rc-Zz) (:text |chan-pick-port)
                          |r $ %{} :Leaf (:at 1557825853297) (:by |B1y7Rc-Zz) (:text |write-mildly!)
      |cumulo-util.client $ {}
        :defs $ {}
          |main! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1545238886003) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1545238886003) (:by |B1y7Rc-Zz) (:text |main!)
                |r $ %{} :Expr (:at 1545238886003) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1545238900356) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545239558668) (:by |B1y7Rc-Zz) (:text |on-page-touch)
                    |j $ %{} :Expr (:at 1545238913696) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1545238913954) (:by |B1y7Rc-Zz) (:text |fn)
                        |j $ %{} :Expr (:at 1545238914177) (:by |B1y7Rc-Zz)
                          :data $ {}
                        |r $ %{} :Expr (:at 1545238915117) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1545238916831) (:by |B1y7Rc-Zz) (:text |println)
                            |j $ %{} :Leaf (:at 1545238918535) (:by |B1y7Rc-Zz) (:text "|\"called")
          |reload! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1545238887716) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1545238887716) (:by |B1y7Rc-Zz) (:text |reload!)
                |r $ %{} :Expr (:at 1545238887716) (:by |B1y7Rc-Zz)
                  :data $ {}
        :ns $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1545238882929) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |ns)
              |j $ %{} :Leaf (:at 1545238882929) (:by |B1y7Rc-Zz) (:text |cumulo-util.client)
              |r $ %{} :Expr (:at 1545238920306) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1545238920985) (:by |B1y7Rc-Zz) (:text |:require)
                  |j $ %{} :Expr (:at 1545238921268) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1545238926811) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
                      |r $ %{} :Leaf (:at 1545238927503) (:by |B1y7Rc-Zz) (:text |:refer)
                      |v $ %{} :Expr (:at 1545238927682) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |j $ %{} :Leaf (:at 1545239551233) (:by |B1y7Rc-Zz) (:text |on-page-touch)
      |cumulo-util.core $ {}
        :defs $ {}
          |*cooling $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1614236562549) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1614236567528) (:by |B1y7Rc-Zz) (:text |defatom)
                |j $ %{} :Leaf (:at 1614236562549) (:by |B1y7Rc-Zz) (:text |*cooling)
                |r $ %{} :Leaf (:at 1614236565640) (:by |B1y7Rc-Zz) (:text |false)
          |delay! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544809351812) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544809351812) (:by |B1y7Rc-Zz) (:text |delay!)
                |r $ %{} :Expr (:at 1544809351812) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544809358336) (:by |B1y7Rc-Zz) (:text |duration)
                    |j $ %{} :Leaf (:at 1544809952523) (:by |B1y7Rc-Zz) (:text |task)
                |v $ %{} :Expr (:at 1544809363226) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544809381057) (:by |B1y7Rc-Zz) (:text |js/setTimeout)
                    |j $ %{} :Leaf (:at 1544809954481) (:by |B1y7Rc-Zz) (:text |task)
                    |r $ %{} :Expr (:at 1544810367577) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |D $ %{} :Leaf (:at 1544810371268) (:by |B1y7Rc-Zz) (:text |*)
                        |L $ %{} :Leaf (:at 1544810372387) (:by |B1y7Rc-Zz) (:text |1000)
                        |T $ %{} :Leaf (:at 1544809385199) (:by |B1y7Rc-Zz) (:text |duration)
          |id! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544810007428) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544810007428) (:by |B1y7Rc-Zz) (:text |id!)
                |r $ %{} :Expr (:at 1544810007428) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1544810024783) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1643533282182) (:by |B1y7Rc-Zz) (:text |nanoid)
          |on-page-touch $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1545238141975) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1545238141975) (:by |B1y7Rc-Zz) (:text |on-page-touch)
                |r $ %{} :Expr (:at 1545238141975) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545238151721) (:by |B1y7Rc-Zz) (:text |listener)
                |t $ %{} :Expr (:at 1614236580084) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1614236582387) (:by |B1y7Rc-Zz) (:text |reset!)
                    |j $ %{} :Leaf (:at 1614236584194) (:by |B1y7Rc-Zz) (:text |*cooling)
                    |r $ %{} :Leaf (:at 1614236585524) (:by |B1y7Rc-Zz) (:text |false)
                |v $ %{} :Expr (:at 1545238152794) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545238204448) (:by |B1y7Rc-Zz) (:text |let)
                    |j $ %{} :Expr (:at 1545238205412) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |j $ %{} :Expr (:at 1545238321763) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1545238326671) (:by |B1y7Rc-Zz) (:text |call-listener)
                            |j $ %{} :Expr (:at 1545238328247) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1545238328544) (:by |B1y7Rc-Zz) (:text |fn)
                                |j $ %{} :Expr (:at 1545238328784) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                |r $ %{} :Expr (:at 1545238441595) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |D $ %{} :Leaf (:at 1545238458968) (:by |B1y7Rc-Zz) (:text |when)
                                    |L $ %{} :Expr (:at 1545238460105) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |D $ %{} :Leaf (:at 1545238460870) (:by |B1y7Rc-Zz) (:text |not)
                                        |T $ %{} :Leaf (:at 1545238451088) (:by |B1y7Rc-Zz) (:text |@*cooling)
                                    |T $ %{} :Expr (:at 1545238329678) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1545238333030) (:by |B1y7Rc-Zz) (:text |listener)
                                    |j $ %{} :Expr (:at 1545238465418) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |reset!)
                                        |j $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |*cooling)
                                        |r $ %{} :Leaf (:at 1545238465418) (:by |B1y7Rc-Zz) (:text |true)
                                    |r $ %{} :Expr (:at 1545238467946) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1545238728280) (:by |B1y7Rc-Zz) (:text |delay!)
                                        |j $ %{} :Leaf (:at 1545239116884) (:by |B1y7Rc-Zz) (:text |0.8)
                                        |r $ %{} :Expr (:at 1614236527130) (:by |B1y7Rc-Zz)
                                          :data $ {}
                                            |D $ %{} :Leaf (:at 1614236527687) (:by |B1y7Rc-Zz) (:text |fn)
                                            |L $ %{} :Expr (:at 1614236527927) (:by |B1y7Rc-Zz)
                                              :data $ {}
                                            |T $ %{} :Expr (:at 1545238467946) (:by |B1y7Rc-Zz)
                                              :data $ {}
                                                |j $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |reset!)
                                                |r $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |*cooling)
                                                |v $ %{} :Leaf (:at 1545238467946) (:by |B1y7Rc-Zz) (:text |false)
                    |r $ %{} :Expr (:at 1545238227639) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657816901831) (:by |B1y7Rc-Zz) (:text |.!addEventListener)
                        |b $ %{} :Leaf (:at 1545238254747) (:by |B1y7Rc-Zz) (:text |js/window)
                        |j $ %{} :Leaf (:at 1545238237555) (:by |B1y7Rc-Zz) (:text "|\"focus")
                        |r $ %{} :Expr (:at 1545238239284) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1545238239574) (:by |B1y7Rc-Zz) (:text |fn)
                            |j $ %{} :Expr (:at 1545238239834) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1545238241326) (:by |B1y7Rc-Zz) (:text |event)
                            |r $ %{} :Expr (:at 1545238320474) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1545238320474) (:by |B1y7Rc-Zz) (:text |call-listener)
                    |v $ %{} :Expr (:at 1545238242831) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1657816903241) (:by |B1y7Rc-Zz) (:text |.!addEventListener)
                        |j $ %{} :Leaf (:at 1545238252346) (:by |B1y7Rc-Zz) (:text |js/window)
                        |r $ %{} :Leaf (:at 1545238260227) (:by |B1y7Rc-Zz) (:text "|\"visibilitychange")
                        |x $ %{} :Expr (:at 1545238615920) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |D $ %{} :Leaf (:at 1545238616788) (:by |B1y7Rc-Zz) (:text |fn)
                            |L $ %{} :Expr (:at 1545238617347) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1545238617347) (:by |B1y7Rc-Zz) (:text |event)
                            |T $ %{} :Expr (:at 1545238272582) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1545238275224) (:by |B1y7Rc-Zz) (:text |when)
                                |j $ %{} :Expr (:at 1545238301585) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |D $ %{} :Leaf (:at 1545238302064) (:by |B1y7Rc-Zz) (:text |=)
                                    |L $ %{} :Leaf (:at 1545238307821) (:by |B1y7Rc-Zz) (:text "|\"visible")
                                    |T $ %{} :Expr (:at 1545238280504) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1545238277762) (:by |B1y7Rc-Zz) (:text |.-visibilityState)
                                        |j $ %{} :Leaf (:at 1545238283775) (:by |B1y7Rc-Zz) (:text |js/document)
                                |r $ %{} :Expr (:at 1545238310686) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1545238317804) (:by |B1y7Rc-Zz) (:text |call-listener)
          |repeat! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544809391704) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544809391704) (:by |B1y7Rc-Zz) (:text |repeat!)
                |r $ %{} :Expr (:at 1544809391704) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544809396435) (:by |B1y7Rc-Zz) (:text |duration)
                    |j $ %{} :Leaf (:at 1544809512997) (:by |B1y7Rc-Zz) (:text |task)
                |v $ %{} :Expr (:at 1544809514124) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544809517696) (:by |B1y7Rc-Zz) (:text |js/setInterval)
                    |j $ %{} :Leaf (:at 1544809520848) (:by |B1y7Rc-Zz) (:text |task)
                    |r $ %{} :Expr (:at 1544810355918) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |D $ %{} :Leaf (:at 1544810356885) (:by |B1y7Rc-Zz) (:text |*)
                        |L $ %{} :Leaf (:at 1544810357950) (:by |B1y7Rc-Zz) (:text |1000)
                        |T $ %{} :Leaf (:at 1544809523099) (:by |B1y7Rc-Zz) (:text |duration)
          |unix-time! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544809584916) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544809584916) (:by |B1y7Rc-Zz) (:text |unix-time!)
                |r $ %{} :Expr (:at 1544809584916) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1544809589762) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544809591694) (:by |B1y7Rc-Zz) (:text |.valueOf)
                    |j $ %{} :Expr (:at 1544809592321) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |D $ %{} :Leaf (:at 1614234983316) (:by |B1y7Rc-Zz) (:text |new)
                        |T $ %{} :Leaf (:at 1614234982312) (:by |B1y7Rc-Zz) (:text |js/Date)
        :ns $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544325947193) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |ns)
              |j $ %{} :Leaf (:at 1544325947193) (:by |B1y7Rc-Zz) (:text |cumulo-util.core)
              |r $ %{} :Expr (:at 1544810010536) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544810012136) (:by |B1y7Rc-Zz) (:text |:require)
                  |j $ %{} :Expr (:at 1544810012337) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1643533271296) (:by |B1y7Rc-Zz) (:text "|\"nanoid")
                      |r $ %{} :Leaf (:at 1643533276692) (:by |B1y7Rc-Zz) (:text |:refer)
                      |v $ %{} :Expr (:at 1643533277102) (:by |B1y7Rc-Zz)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1643533277549) (:by |B1y7Rc-Zz) (:text |nanoid)
      |cumulo-util.file $ {}
        :defs $ {}
          |get-backup-path! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |get-backup-path!)
                |r $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                  :data $ {}
                |v $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |let)
                    |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                            |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |D $ %{} :Leaf (:at 1614237302818) (:by |B1y7Rc-Zz) (:text |new)
                                |T $ %{} :Leaf (:at 1614237304059) (:by |B1y7Rc-Zz) (:text |js/Date)
                    |r $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |path/join)
                        |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |js/__dirname)
                        |r $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"backups")
                        |v $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str)
                            |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |inc)
                                |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getMonth)
                                    |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                        |x $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |str)
                            |j $ %{} :Expr (:at 1544726235898) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |.getDate)
                                |j $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text |now)
                            |r $ %{} :Leaf (:at 1544726235898) (:by |B1y7Rc-Zz) (:text "|\"-snapshot.edn")
          |merge-local-edn! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge-local-edn!)
                |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |x0)
                    |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                    |r $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
                |v $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |merge)
                    |j $ %{} :Leaf (:at 1544726522051) (:by |B1y7Rc-Zz) (:text |x0)
                    |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |let)
                        |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                                |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                                    |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                        |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if)
                            |j $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fn?)
                                |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
                            |r $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |handler)
                                |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                        |v $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |if)
                            |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |found?)
                            |r $ %{} :Expr (:at 1614237273771) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |D $ %{} :Leaf (:at 1614440226810) (:by |B1y7Rc-Zz) (:text |parse-cirru-edn)
                                |T $ %{} :Expr (:at 1544726255682) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |fs/readFileSync)
                                    |j $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |filepath)
                                    |r $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text ||utf8)
                            |v $ %{} :Leaf (:at 1544726255682) (:by |B1y7Rc-Zz) (:text |nil)
          |sh! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1545669620238) (:by |root)
              :data $ {}
                |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |defn)
                |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |sh!)
                |r $ %{} :Expr (:at 1545669620238) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
                |v $ %{} :Expr (:at 1545669620238) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |println)
                    |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
                |x $ %{} :Expr (:at 1545669620238) (:by |root)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |println)
                    |j $ %{} :Expr (:at 1545669620238) (:by |root)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |.toString)
                        |j $ %{} :Expr (:at 1545669620238) (:by |root)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |cp/execSync)
                            |j $ %{} :Leaf (:at 1545669620238) (:by |root) (:text |command)
          |write-mildly! $ %{} :CodeEntry (:doc |)
            :code $ %{} :Expr (:at 1543163834194) (:by |B1y7Rc-Zz)
              :data $ {}
                |T $ %{} :Leaf (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |defn)
                |j $ %{} :Leaf (:at 1543163834194) (:by |B1y7Rc-Zz) (:text |write-mildly!)
                |r $ %{} :Expr (:at 1543163834194) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1543163842033) (:by |B1y7Rc-Zz) (:text |file-path)
                    |j $ %{} :Leaf (:at 1543163845141) (:by |B1y7Rc-Zz) (:text |content)
                |t $ %{} :Expr (:at 1543165226171) (:by |B1y7Rc-Zz)
                  :data $ {}
                    |D $ %{} :Leaf (:at 1543165226834) (:by |B1y7Rc-Zz) (:text |let)
                    |L $ %{} :Expr (:at 1543165227042) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |D $ %{} :Expr (:at 1557825659473) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1557825661402) (:by |B1y7Rc-Zz) (:text |dir)
                            |j $ %{} :Expr (:at 1557825662112) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |path/dirname)
                                |j $ %{} :Leaf (:at 1557825662112) (:by |B1y7Rc-Zz) (:text |file-path)
                        |L $ %{} :Expr (:at 1557854284087) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1557854289025) (:by |B1y7Rc-Zz) (:text |filename)
                            |j $ %{} :Expr (:at 1557854289876) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1557854293986) (:by |B1y7Rc-Zz) (:text |path/basename)
                                |j $ %{} :Leaf (:at 1557854300613) (:by |B1y7Rc-Zz) (:text |file-path)
                        |P $ %{} :Expr (:at 1557854338428) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1557854346642) (:by |B1y7Rc-Zz) (:text |temp-name)
                            |j $ %{} :Expr (:at 1557854352074) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1557854352532) (:by |B1y7Rc-Zz) (:text |str)
                                |b $ %{} :Leaf (:at 1557854468595) (:by |B1y7Rc-Zz) (:text "|\"/tmp/")
                                |j $ %{} :Expr (:at 1557854354575) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |j $ %{} :Leaf (:at 1629483312976) (:by |B1y7Rc-Zz) (:text |js/Date.now)
                                |l $ %{} :Leaf (:at 1557854450555) (:by |B1y7Rc-Zz) (:text "|\"-")
                                |n $ %{} :Expr (:at 1557854443501) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |j $ %{} :Leaf (:at 1629483315808) (:by |B1y7Rc-Zz) (:text |js/Math.random)
                                |p $ %{} :Leaf (:at 1557854454357) (:by |B1y7Rc-Zz) (:text "|\"-")
                                |r $ %{} :Leaf (:at 1557854364419) (:by |B1y7Rc-Zz) (:text |filename)
                        |T $ %{} :Expr (:at 1543165227185) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1543165358367) (:by |B1y7Rc-Zz) (:text |do-write!)
                            |j $ %{} :Expr (:at 1543165231092) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1543165231381) (:by |B1y7Rc-Zz) (:text |fn)
                                |j $ %{} :Expr (:at 1543165232171) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                |r $ %{} :Expr (:at 1543165236077) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |fs/writeFileSync)
                                    |j $ %{} :Leaf (:at 1557854368692) (:by |B1y7Rc-Zz) (:text |temp-name)
                                    |r $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |content)
                                |t $ %{} :Expr (:at 1543165236077) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1557854334522) (:by |B1y7Rc-Zz) (:text |fs/renameSync)
                                    |b $ %{} :Leaf (:at 1557854375319) (:by |B1y7Rc-Zz) (:text |temp-name)
                                    |j $ %{} :Leaf (:at 1543165236077) (:by |B1y7Rc-Zz) (:text |file-path)
                                |v $ %{} :Expr (:at 1543165249658) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1543165252627) (:by |B1y7Rc-Zz) (:text |println)
                                    |j $ %{} :Leaf (:at 1543165256271) (:by |B1y7Rc-Zz) (:text "|\"Write to file:")
                                    |r $ %{} :Leaf (:at 1543165258888) (:by |B1y7Rc-Zz) (:text |file-path)
                    |P $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if)
                        |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                            |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                        |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |let)
                            |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content)
                                    |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |fs/readFileSync)
                                        |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                                        |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"utf8")
                            |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |if)
                                |j $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |not=)
                                    |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |content)
                                    |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |old-content)
                                |r $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |do-write!)
                                |v $ %{} :Expr (:at 1543165482814) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |D $ %{} :Leaf (:at 1543165547456) (:by |B1y7Rc-Zz) (:text |;)
                                    |T $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |println)
                                    |j $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text "|\"same file, skipping:")
                                    |r $ %{} :Leaf (:at 1543165482814) (:by |B1y7Rc-Zz) (:text |file-path)
                        |v $ %{} :Expr (:at 1543165488856) (:by |B1y7Rc-Zz)
                          :data $ {}
                            |T $ %{} :Leaf (:at 1557825755884) (:by |B1y7Rc-Zz) (:text |do)
                            |j $ %{} :Expr (:at 1557825761997) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |when)
                                |j $ %{} :Expr (:at 1557827150820) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |D $ %{} :Leaf (:at 1557827154024) (:by |B1y7Rc-Zz) (:text |and)
                                    |T $ %{} :Expr (:at 1557825761997) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |not=)
                                        |j $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text "|\".")
                                        |r $ %{} :Leaf (:at 1557825761997) (:by |B1y7Rc-Zz) (:text |dir)
                                    |j $ %{} :Expr (:at 1557827154746) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1557827155199) (:by |B1y7Rc-Zz) (:text |not)
                                        |j $ %{} :Expr (:at 1557827155625) (:by |B1y7Rc-Zz)
                                          :data $ {}
                                            |T $ %{} :Leaf (:at 1557827161278) (:by |B1y7Rc-Zz) (:text |fs/existsSync)
                                            |j $ %{} :Leaf (:at 1557827163127) (:by |B1y7Rc-Zz) (:text |dir)
                                |v $ %{} :Expr (:at 1557826941108) (:by |B1y7Rc-Zz)
                                  :data $ {}
                                    |T $ %{} :Leaf (:at 1557826943900) (:by |B1y7Rc-Zz) (:text |fs/mkdirSync)
                                    |j $ %{} :Leaf (:at 1557826947546) (:by |B1y7Rc-Zz) (:text |dir)
                                    |r $ %{} :Expr (:at 1557826947939) (:by |B1y7Rc-Zz)
                                      :data $ {}
                                        |T $ %{} :Leaf (:at 1614237324720) (:by |B1y7Rc-Zz) (:text |to-js-data)
                                        |j $ %{} :Expr (:at 1557826950189) (:by |B1y7Rc-Zz)
                                          :data $ {}
                                            |T $ %{} :Leaf (:at 1557826950505) (:by |B1y7Rc-Zz) (:text |{})
                                            |j $ %{} :Expr (:at 1557826951014) (:by |B1y7Rc-Zz)
                                              :data $ {}
                                                |T $ %{} :Leaf (:at 1557826956646) (:by |B1y7Rc-Zz) (:text |:recursive)
                                                |j $ %{} :Leaf (:at 1557826954274) (:by |B1y7Rc-Zz) (:text |true)
                            |r $ %{} :Expr (:at 1557827118434) (:by |B1y7Rc-Zz)
                              :data $ {}
                                |T $ %{} :Leaf (:at 1543165491406) (:by |B1y7Rc-Zz) (:text |do-write!)
        :ns $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544376144865) (:by |B1y7Rc-Zz)
            :data $ {}
              |T $ %{} :Leaf (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |ns)
              |j $ %{} :Leaf (:at 1544376144865) (:by |B1y7Rc-Zz) (:text |cumulo-util.file)
              |r $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:require)
                  |j $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"path")
                      |r $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as)
                      |v $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |path)
                  |r $ %{} :Expr (:at 1544376175494) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text "|\"fs")
                      |r $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |:as)
                      |v $ %{} :Leaf (:at 1544376175494) (:by |B1y7Rc-Zz) (:text |fs)
                  |t $ %{} :Expr (:at 1557827183581) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1557827195242) (:by |B1y7Rc-Zz) (:text "|\"child_process")
                      |r $ %{} :Leaf (:at 1557827186528) (:by |B1y7Rc-Zz) (:text |:as)
                      |v $ %{} :Leaf (:at 1557827193288) (:by |B1y7Rc-Zz) (:text |cp)
                  |w $ %{} :Expr (:at 1555827188060) (:by |B1y7Rc-Zz)
                    :data $ {}
                      |j $ %{} :Leaf (:at 1555827189501) (:by |B1y7Rc-Zz) (:text "|\"net")
                      |r $ %{} :Leaf (:at 1555827190270) (:by |B1y7Rc-Zz) (:text |:as)
                      |v $ %{} :Leaf (:at 1555827191053) (:by |B1y7Rc-Zz) (:text |net)
    :root $ {} (:def |main!) (:ns |main)
  :users $ {}
    |B1y7Rc-Zz $ {} (:avatar nil) (:id |B1y7Rc-Zz) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
