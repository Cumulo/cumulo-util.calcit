{}
  :schema-version 1
  :feature 'realtime-scheduling-primitives
  :doc "|Provide deterministic, transport-independent retry, heartbeat lease, and dispatch coalescing state for realtime Calcit applications."
  :roots $ #{} 'cumulo-util.realtime/retry-backoff 'cumulo-util.realtime/heartbeat-lease 'cumulo-util.realtime/coalescer
  :definitions $ {}
    'cumulo-util.realtime/RetryBackoffOps $ {}
      :mode :ensure
      :kind :data
      :doc "|Method contract for advancing or resetting immutable retry backoff state."
      :schema $ :: 'Trait
      :code $ quote
        deftrait RetryBackoffOps
          .next $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
            :return 'cumulo-util.realtime/RetryStep
          .reset $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/RetryBackoff
            :return 'cumulo-util.realtime/RetryBackoff
    'cumulo-util.realtime/RetryBackoffOpsImpl $ {}
      :mode :ensure
      :kind :data
      :doc "|RetryBackoff method implementation."
      :schema $ :: 'Impl
      :code $ quote
        defimpl RetryBackoffOpsImpl RetryBackoffOps
          .next retry-backoff:next
          .reset retry-backoff:reset
    'cumulo-util.realtime/RetryBackoff $ {}
      :mode :ensure
      :kind :data
      :doc "|Immutable exponential-backoff configuration and current attempt count."
      :schema $ :: 'StructDef
      :code $ quote
        def RetryBackoff $ impl-traits
          defstruct RetryBackoff
            :base-delay-ms 'Number
            :max-delay-ms 'Number
            :jitter-ratio 'Number
            :attempt 'Number
          , RetryBackoffOpsImpl
    'cumulo-util.realtime/RetryStep $ {}
      :mode :ensure
      :kind :data
      :doc "|One retry delay and the immutable state to use for the next retry."
      :schema $ :: 'StructDef
      :code $ quote
        defstruct RetryStep
          :delay-ms 'Number
          :next 'cumulo-util.realtime/RetryBackoff
    'cumulo-util.realtime/retry-backoff $ {}
      :mode :ensure
      :kind :fn
      :doc "|Create retry state with attempt zero. random-unit is supplied later to next, keeping tests deterministic."
      :params $ [] 'base-delay-ms 'max-delay-ms 'jitter-ratio
      :schema $ :: 'Fn $ {}
        :args $ [] 'Number 'Number 'Number
        :return 'cumulo-util.realtime/RetryBackoff
    'cumulo-util.realtime/retry-backoff:next $ {}
      :mode :ensure
      :kind :fn
      :doc "|Calculate one clamped exponential retry delay from a caller-supplied random unit and advance state."
      :params $ [] 'self 'random-unit
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/RetryBackoff 'Number
        :return 'cumulo-util.realtime/RetryStep
    'cumulo-util.realtime/retry-backoff:reset $ {}
      :mode :ensure
      :kind :fn
      :doc "|Return the same retry configuration at attempt zero."
      :params $ [] 'self
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/RetryBackoff
        :return 'cumulo-util.realtime/RetryBackoff
    'cumulo-util.realtime/HeartbeatLeaseOps $ {}
      :mode :ensure
      :kind :data
      :doc "|Method contract for renewing and inspecting a transport-independent heartbeat lease."
      :schema $ :: 'Trait
      :code $ quote
        deftrait HeartbeatLeaseOps
          .renew $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
            :return 'cumulo-util.realtime/HeartbeatLease
          .expired? $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
            :return 'Bool
    'cumulo-util.realtime/HeartbeatLeaseOpsImpl $ {}
      :mode :ensure
      :kind :data
      :doc "|HeartbeatLease method implementation."
      :schema $ :: 'Impl
      :code $ quote
        defimpl HeartbeatLeaseOpsImpl HeartbeatLeaseOps
          .renew heartbeat-lease:renew
          .expired? heartbeat-lease:expired?
    'cumulo-util.realtime/HeartbeatLease $ {}
      :mode :ensure
      :kind :data
      :doc "|Last-seen timestamp and absolute expiry deadline for a heartbeat lease."
      :schema $ :: 'StructDef
      :code $ quote
        def HeartbeatLease $ impl-traits
          defstruct HeartbeatLease
            :last-seen-ms 'Number
            :deadline-ms 'Number
          , HeartbeatLeaseOpsImpl
    'cumulo-util.realtime/heartbeat-lease $ {}
      :mode :ensure
      :kind :fn
      :doc "|Create or renew a heartbeat lease at now-ms for timeout-ms."
      :params $ [] 'now-ms 'timeout-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'Number 'Number
        :return 'cumulo-util.realtime/HeartbeatLease
    'cumulo-util.realtime/heartbeat-lease:renew $ {}
      :mode :ensure
      :kind :fn
      :doc "|Renew a heartbeat lease at now-ms for timeout-ms."
      :params $ [] 'self 'now-ms 'timeout-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number 'Number
        :return 'cumulo-util.realtime/HeartbeatLease
    'cumulo-util.realtime/heartbeat-lease:expired? $ {}
      :mode :ensure
      :kind :fn
      :doc "|Whether now-ms is at or beyond the heartbeat deadline."
      :params $ [] 'self 'now-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/HeartbeatLease 'Number
        :return 'Bool
    'cumulo-util.realtime/CoalescerOps $ {}
      :mode :ensure
      :kind :data
      :doc "|Method contract for deterministic single-flight dispatch coalescing state."
      :schema $ :: 'Trait
      :code $ quote
        deftrait CoalescerOps
          .request $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/Coalescer 'Number
            :return 'cumulo-util.realtime/CoalescedPlan
          .flush $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/Coalescer
            :return 'cumulo-util.realtime/Coalescer
          .cancel $ :: 'Fn $ {}
            :args $ [] 'cumulo-util.realtime/Coalescer
            :return 'cumulo-util.realtime/Coalescer
    'cumulo-util.realtime/CoalescerOpsImpl $ {}
      :mode :ensure
      :kind :data
      :doc "|Coalescer method implementation."
      :schema $ :: 'Impl
      :code $ quote
        defimpl CoalescerOpsImpl CoalescerOps
          .request coalescer:request
          .flush coalescer:flush
          .cancel coalescer:cancel
    'cumulo-util.realtime/Coalescer $ {}
      :mode :ensure
      :kind :data
      :doc "|Immutable coalescing configuration and explicit pending-window state."
      :schema $ :: 'StructDef
      :code $ quote
        def Coalescer $ impl-traits
          defstruct Coalescer
            :delay-ms 'Number
            :max-wait-ms 'Number
            :pending? 'Bool
            :first-request-ms 'Number
          , CoalescerOpsImpl
    'cumulo-util.realtime/CoalescedPlan $ {}
      :mode :ensure
      :kind :data
      :doc "|The next coalesced state and delay for one externally-owned timer."
      :schema $ :: 'StructDef
      :code $ quote
        defstruct CoalescedPlan
          :state 'cumulo-util.realtime/Coalescer
          :delay-ms 'Number
    'cumulo-util.realtime/coalescer $ {}
      :mode :ensure
      :kind :fn
      :doc "|Create an idle coalescer. The caller owns actual timers and invokes request with its clock."
      :params $ [] 'delay-ms 'max-wait-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'Number 'Number
        :return 'cumulo-util.realtime/Coalescer
    'cumulo-util.realtime/coalescer:request $ {}
      :mode :ensure
      :kind :fn
      :doc "|Merge a dispatch request and return the bounded delay for the caller's one timer."
      :params $ [] 'self 'now-ms
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/Coalescer 'Number
        :return 'cumulo-util.realtime/CoalescedPlan
    'cumulo-util.realtime/coalescer:flush $ {}
      :mode :ensure
      :kind :fn
      :doc "|Clear the explicit pending state after an immediate flush."
      :params $ [] 'self
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/Coalescer
        :return 'cumulo-util.realtime/Coalescer
    'cumulo-util.realtime/coalescer:cancel $ {}
      :mode :ensure
      :kind :fn
      :doc "|Clear the explicit pending state after cancelling the externally-owned timer."
      :params $ [] 'self
      :schema $ :: 'Fn $ {}
        :args $ [] 'cumulo-util.realtime/Coalescer
        :return 'cumulo-util.realtime/Coalescer
  :edges $ #{}
    :: :type 'cumulo-util.realtime/RetryStep 'cumulo-util.realtime/RetryBackoff
    :: :call 'cumulo-util.realtime/retry-backoff:next 'cumulo-util.realtime/retry-backoff:reset
    :: :call 'cumulo-util.realtime/heartbeat-lease 'cumulo-util.realtime/heartbeat-lease:renew
    :: :call 'cumulo-util.realtime/coalescer:cancel 'cumulo-util.realtime/coalescer:flush
