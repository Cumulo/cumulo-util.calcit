
import { main_BANG_ } from "./out-page/cumulo-util.client.js"

main_BANG_()

if (import.meta.hot) {
  import.meta.hot.accept('./out-page/cumulo-util.client.js', (main) => {
    main.reload_BANG_()
  })
}
