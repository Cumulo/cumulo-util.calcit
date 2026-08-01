
import { main_$x_ } from "./js-out/cumulo-util.client.mjs"

let cleanup = main_$x_()

if (import.meta.hot) {
  import.meta.hot.accept("./js-out/cumulo-util.client.mjs", (main) => {
    if (main) {
      cleanup()
      cleanup = main.main_$x_()
    }
  })

  import.meta.hot.dispose(() => cleanup())
}
