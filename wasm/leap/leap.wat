(module
  ;; Returns 1 if leap year, 0 otherwise

  (func $divisible-by (param $n i32) (param $div i32) (result i32)
    (return
      (i32.eq
        (i32.const 0)
        (i32.rem_u
          (local.get $n)
          (local.get $div)))))

  (func (export "isLeap") (param $year i32) (result i32)
    (call $divisible-by
      (local.get $year)
      (i32.const 400))
    (if (result i32)
      (then
        (i32.const 1))
      (else
        (call $divisible-by
          (local.get $year)
          (i32.const 100))
        (if (result i32)
          (then
            (i32.const 0))
          (else
            (call $divisible-by
              (local.get $year)
              (i32.const 4))))))))
