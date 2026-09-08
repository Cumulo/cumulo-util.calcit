#!/usr/bin/env bash

set -euo pipefail

calcit_bin="${CALCIT_BIN:-calcit}"

"$calcit_bin" calcit.cirru eval --dep ./ "$(cat <<'EOF'
ns app.demo $ :require
  cumulo-util.realtime :refer $ RetryBackoff RetryStep HeartbeatLease Coalescer CoalescedPlan coalescer heartbeat-lease retry-backoff

let
    retry-initial $ retry-backoff 100 1000 0
    retry-one $ retry-initial.next 0.5
  do
    assert |retry-one $ = 100 (:delay-ms retry-one)
    let
        retry-state-one $ :next retry-one
        retry-two $ retry-state-one.next 0.5
      do
        assert |retry-two $ = 200 (:delay-ms retry-two)
        let
            retry-state-two $ :next retry-two
            retry-three $ retry-state-two.next 0.5
          do
            assert |retry-three $ = 400 (:delay-ms retry-three)
            let
                retry-state-three $ :next retry-three
                retry-four $ retry-state-three.next 0.5
              do
                assert |retry-four $ = 800 (:delay-ms retry-four)
                let
                    retry-state-four $ :next retry-four
                    retry-capped $ retry-state-four.next 0.5
                    low-jitter-state $ retry-backoff 100 1000 1
                    high-jitter-state $ retry-backoff 100 1000 1
                    low-jitter $ low-jitter-state.next 0
                    high-jitter $ high-jitter-state.next 1
                  do
                    assert |retry-capped $ = 1000 (:delay-ms retry-capped)
                    assert |low-jitter $ = 50 (:delay-ms low-jitter)
                    assert |high-jitter $ = 150 (:delay-ms high-jitter)
                    let
                        retry-capped-state $ :next retry-capped
                        reset-state $ retry-capped-state.reset
                      do
                        assert |reset-state $ = 0 (:attempt reset-state)
                        let
                            lease $ heartbeat-lease 1000 50
                            renewed $ lease.renew 1100 20
                          do
                            assert |lease-before-deadline $ = false (lease.expired? 1049)
                            assert |lease-at-deadline $ = true (lease.expired? 1050)
                            assert |renewed-time $ = 1100 (:last-seen-ms renewed)
                            assert |renewed-before-deadline $ = false (renewed.expired? 1119)
                            assert |renewed-at-deadline $ = true (renewed.expired? 1120)
                            let
                                initial-coalescer $ coalescer 20 50
                                first-plan $ initial-coalescer.request 100
                              do
                                assert |first-plan $ = 20 (:delay-ms first-plan)
                                let
                                    coalescer-one $ :state first-plan
                                    second-plan $ coalescer-one.request 120
                                  do
                                    assert |second-plan $ = 20 (:delay-ms second-plan)
                                    let
                                        coalescer-two $ :state second-plan
                                        last-plan $ coalescer-two.request 145
                                      do
                                        assert |last-plan $ = 5 (:delay-ms last-plan)
                                        let
                                            coalescer-three $ :state last-plan
                                            timeout-plan $ coalescer-three.request 200
                                            flushed $ coalescer-three.flush
                                            cancelled $ coalescer-three.cancel
                                          do
                                            assert |timeout-plan $ = 0 (:delay-ms timeout-plan)
                                            assert |flushed $ = false (:pending? flushed)
                                            assert |cancelled $ = false (:pending? cancelled)
                                            , :ok
EOF
)"
