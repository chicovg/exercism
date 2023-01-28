(module
  (import "console" "log_i32_s" (func $log_i32_s (param i32)))
  (import "console" "log_i32_u" (func $log_i32_u (param i32)))
  (import "console" "log_mem_as_u8" (func $log_mem_as_u8 (param $byteOffset i32) (param $length i32)))

  (memory (export "mem") 1)

  (data (i32.const 100) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  ;; Return buffer of comma separated colors
  ;; black,brown,red,orange,yellow,green,blue,violet,grey,white
  (func (export "colors") (result i32 i32)
    (return (i32.const 100) (i32.const 58)))

  (func $p100 (param $n i32) (result i32)
    (return
      (i32.add
        (local.get $n)
        (i32.const 100))))

  (func $initialize
    ;; code for black;
    (i32.store
      (call $p100 (i32.const 100))
      (i32.const 0))
    (i32.store
      (call $p100 (i32.const 106))
      (i32.const 1))
    (i32.store
      (call $p100 (i32.const 112))
      (i32.const 2))
    (i32.store
      (call $p100 (i32.const 116))
      (i32.const 3))
    (i32.store
      (call $p100 (i32.const 123))
      (i32.const 4))
    (i32.store
      (call $p100 (i32.const 130))
      (i32.const 5))
    (i32.store
      (call $p100 (i32.const 136))
      (i32.const 6))
    (i32.store
      (call $p100 (i32.const 141))
      (i32.const 7))
    (i32.store
      (call $p100 (i32.const 148))
      (i32.const 8))
    (i32.store
      (call $p100 (i32.const 153))
      (i32.const 9)))

  (start $initialize)

  (func $inc (param $n i32) (result i32)
    (return
      (i32.add
        (local.get $n)
        (i32.const 1))))

  (func $dec (param $n i32) (result i32)
    (return
      (i32.sub
        (local.get $n)
        (i32.const 1))))

  (func $find_matching_data
    (param $in_offset i32)
    (param $curr_in_offset i32)
    (param $data_offset i32)
    (param $len i32)
    (param $rem_len i32)
    (result i32)
  (if (result i32)
    (i32.eq
      (local.get $rem_len)
      (i32.const 0))
    (then
      (return
        (i32.sub
          (local.get $data_offset)
          (local.get $len))))
    (else
      (if (result i32)
        (i32.eq
          (i32.load8_u (local.get $curr_in_offset))
          (i32.load8_u (local.get $data_offset)))
        (then
          (return
            (call $find_matching_data
              (local.get $in_offset)
              (call $inc (local.get $curr_in_offset))
              (call $inc (local.get $data_offset))
              (local.get $len)
              (call $dec (local.get $rem_len)))))
        (else
          (return
            (call $find_matching_data
              (local.get $in_offset)
              (local.get $in_offset)
              (call $inc (local.get $data_offset))
              (local.get $len)
              (local.get $len))))))))

  ;; Given a valid resistor color, returns the associated value
  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (local $color_offset i32)
    (local.set $color_offset
      (call $find_matching_data
        (local.get $offset)
        (local.get $offset)
        (i32.const 100)
        (local.get $len)
        (local.get $len)))
    ;;
    (return
      (i32.load
        (call $p100
          (local.get $color_offset)))))
)
