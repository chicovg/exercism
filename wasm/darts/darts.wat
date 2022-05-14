(module
  (func $squared (param $n f32) (result f32)
  	(f32.mul
  	  (local.get $n)
  	  (local.get $n)))

  (func $within-circle (param $x f32) (param $y f32) (param $radius f32) (result i32)
  	(f32.le
      (f32.add
      	(call $squared (local.get $x))
      	(call $squared (local.get $y)))
      (call $squared (local.get $radius))))

  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (if (call $within-circle (local.get $x) (local.get $y) (f32.const 1))
      (then (return (i32.const 10))))

    (if (call $within-circle (local.get $x) (local.get $y) (f32.const 5))
      (then (return (i32.const 5))))

    (if (call $within-circle (local.get $x) (local.get $y) (f32.const 10))
      (then (return (i32.const 1))))

    (i32.const 0)))
