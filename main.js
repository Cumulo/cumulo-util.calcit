
import { main_$x_ } from "./out-page/cumulo-util.client.js"

main_$x_()

if (import.meta.hot) {
  import.meta.hot.accept('./out-page/cumulo-util.client.js', (main) => {
    main.reload_$x_()
  })
}
