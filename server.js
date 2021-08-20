
import { main_$x_ } from "./js-out/cumulo-util.app.js"

main_$x_()

if (import.meta.hot) {
  import.meta.hot.accept('./js-out/cumulo-util.app.js', (main) => {
    main.reload_$x_()
  })
}
