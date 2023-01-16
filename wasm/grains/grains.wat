(module
  (func $outside-range (param $n i32) (result i32)
    (if (result i32)
      (i32.lt_s
        (local.get $n)
        (i32.const 1))
      (then
        (i32.const 1))
      (else
        (i32.gt_s
          (local.get $n)
          (i32.const 64)))))

  ;; squareNum is signed
  ;; Result is unsigned
  (func $square (export "square") (param $squareNum i32) (result i64)
    (if (result i64)
      (call $outside-range
        (local.get $squareNum))
      (then
        (i64.const 0))
      (else
        (if (result i64)
          (i32.eq
            (local.get $squareNum)
            (i32.const 1))
          (then
            (i64.const 1))
          (else
            (i64.mul
              (call $square
                (i32.sub
                  (local.get $squareNum)
                (i32.const 1)))
              (i64.const 2)))))))

  (func $calc-total (param $n i32) (param $prev-sq i64) (param $prev-total i64) (result i64)
    (if (result i64)
      (i32.gt_s
        (local.get $n)
        (i32.const 64))
      (then
        (local.get $prev-total))
      (else
        (call $calc-total
          (i32.add
            (local.get $n)
            (i32.const 1))
          (i64.mul
            (local.get $prev-sq)
            (i64.const 2))
          (i64.add
            (local.get $prev-total)
            (i64.mul
              (local.get $prev-sq)
              (i64.const 2)))))))

  ;; Result is unsigned
  (func $total (export "total") (result i64)
    (call $calc-total
      (i32.const 2)
      (i64.const 1)
      (i64.const 1)))
)
