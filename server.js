
import { main_BANG_ } from "./js-out/cumulo-util.app.js"

main_BANG_()

if (import.meta.hot) {
  import.meta.hot.accept('./js-out/cumulo-util.app.js', (main) => {
    main.reload_BANG_()
  })
}
