{}
  :schema-version 1
  :feature 'unified-browser-lifecycle
  :doc "|Unify browser visibility, connectivity, focus touch, and visible-page heartbeat signals behind one explicit cleanup capability."
  :roots $ #{} 'cumulo-util.activity/watch-browser-lifecycle!
  :definitions $ {}
    'cumulo-util.activity/page-visible? $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {}
        :args $ []
        :return 'Bool
        :features $ #{} :js-ffi
    'cumulo-util.activity/page-online? $ {}
      :mode :ensure
      :kind :fn
      :doc "|Returns the browser online hint. It does not prove WebSocket or server health."
      :params $ []
      :schema $ :: 'Fn $ {}
        :args $ []
        :return 'Bool
        :features $ #{} :js-ffi
    'cumulo-util.activity/watch-browser-lifecycle! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Reports visibility, online/offline, throttled page touch, and visible-page heartbeat signals. Returns cleanup for every listener and timer."
      :params $ [] 'callback 'heartbeat-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'Fn (:: 'Option 'Number)
        :return 'Fn
  :edges $ #{}
    :: :call 'cumulo-util.activity/watch-browser-lifecycle! 'cumulo-util.activity/page-online?
    :: :call 'cumulo-util.activity/watch-browser-lifecycle! 'cumulo-util.activity/page-visible?
