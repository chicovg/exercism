(module
  (import "console" "log_i32_s" (func $log_i32_s (param i32)))

  (func $is-even (param $number i32) (result i32)
    (i32.eq
      (i32.const 0)
      (i32.rem_u
        (local.get $number)
        (i32.const 2))))

  (func $calc-steps (param $number i32) (param $steps i32) (result i32)
    (i32.le_s
      (local.get $number)
      (i32.const 0))
    (if (result i32)
      (then
        (i32.const -1))
      (else
        (i32.eq
          (local.get $number)
          (i32.const 1))
        (if (result i32)
          (then
            (local.get $steps))
          (else
            (call $is-even
              (local.get $number))
            (if (result i32)
            (then
              (call $calc-steps
                (i32.div_s
                  (local.get $number)
                  (i32.const 2))
                (i32.add
                  (local.get $steps)
                  (i32.const 1))))
            (else
              (call $calc-steps
                (i32.add
                  (i32.mul
                    (local.get $number)
                    (i32.const 3))
                  (i32.const 1))
                (i32.add
                  (local.get $steps)
                  (i32.const 1))))))))))

  (func (export "steps") (param $number i32) (result i32)
    (return
      (call $calc-steps (local.get $number) (i32.const 0)))))
