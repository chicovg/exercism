(module
  (import "console" "log_i32_u" (func $log_i32_u (param i32)))
  (import "console" "log_mem_as_i32" (func $log_mem_as_i32 (param $byteOffset i32) (param $length i32)))

  (memory (export "mem") 1)
  ;; Add globals here!
  (global $capacity (mut i32) (i32.const 0))
  (global $oldestIndex (mut i32) (i32.const 0))
  (global $items (mut i32) (i32.const 0))

  ;; Helpers
  (func $isEmpty (result i32)
    (i32.eq
      (global.get $items)
      (i32.const 0)))

  (func $isFull (result i32)
    (i32.eq
      (global.get $items)
      (global.get $capacity)))

  (func $writeIndex (result i32)
    (i32.rem_u
      (i32.add
        (global.get $oldestIndex)
        (global.get $items))
      (global.get $capacity)))

  (func $incOldestIndex
    (global.set $oldestIndex
      (i32.rem_u
        (i32.add
          (global.get $oldestIndex)
          (i32.const 1))
        (global.get $capacity))))

  (func $decItems
    (if
      (call $isEmpty)
      (then
        (nop))
      (else
        (global.set $items
          (i32.sub
            (global.get $items)
            (i32.const 1))))))

  (func $incItems
    (if
      (call $isFull)
      (then
        (nop))
      (else
        (global.set $items
          (i32.add
            (global.get $items)
            (i32.const 1))))))

  (func $storeVal (param $val i32)
    (i32.store
      (i32.mul
        (call $writeIndex)
        (i32.const 4))
      (local.get $val)))

  (func $readVal (param $index i32) (result i32)
    (i32.load
      (i32.mul
        (local.get $index)
        (i32.const 4))))

  ;; newCapacity is a capacity between 0 and 1024
  ;; a WebAssembly page is 4096 bytes, so up to 1024 i32s
  ;; returns 0 on success or -1 on error
  (func (export "init") (param $newCapacity i32) (result i32)
    (block $valid_input
      (br_if $valid_input
        (i32.lt_s
          (local.get $newCapacity)
          (i32.const 0)))
      (br_if $valid_input
        (i32.gt_s
          (local.get $newCapacity)
          (i32.const 1020)))
      (global.set $capacity (local.get $newCapacity))
      (global.set $oldestIndex (i32.const 0))
      (global.set $items (i32.const 0))
      (return (i32.const 0))
    )
    (i32.const -1)
  )

  (func (export "clear")
    (if
      (call $isEmpty)
      (then
        (nop))
      (else
        (call $incOldestIndex)
        (call $decItems))))

  ;; returns 0 on success or -1 on error
  (func (export "write") (param $elem i32) (result i32)
    (if (result i32)
      (call $isFull)
      (then
        (i32.const -1))
      (else
        (call $storeVal
          (local.get $elem))
        (call $incItems)
        (i32.const 0))))

  ;; returns 0 on success or -1 on error
  (func (export "forceWrite") (param $elem i32) (result i32)
    (local $isFullBeforeWrite i32)
    (local.set $isFullBeforeWrite
      (call $isFull))
    (call $storeVal
      (local.get $elem))
    (call $incItems)
    (if
      (local.get $isFullBeforeWrite)
      (then
        (call $incOldestIndex)))
    (i32.const 0))

  ;; Returns Go-style error handling tuple (i32, i32)
  ;; The first element of the return tuple is the returned value or -1 on error
  ;; The second element should be 0 on success or -1 on error
  (func (export "read") (result i32 i32)
    (local $readIndex i32)
    (if (result i32 i32)
      (call $isEmpty)
      (then
        (return (i32.const -1) (i32.const -1)))
      (else
        (local.set $readIndex (global.get $oldestIndex))
        (call $incOldestIndex)
        (call $decItems)
        (return
          (call $readVal
            (local.get $readIndex))
          (i32.const 0)))))
)
