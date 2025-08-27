# Arrays in ts

```
let a = [1, 2, 3];                // number[]
var b = ['a', 'b'];              // string[]
let c: string[] = ['a'];         // string[]
let d = [1, 'a'];                // (string | number)[]
const e = [2, 'b'];              // (string | number)[]

let f = ['red'];                 // string[]
f.push('blue');                  // OK
f.push(true);                    // ❌ Error: Argument of type 'true' is not assignable to parameter of type 'string'

let g = [];                      // any[]
g.push(1);                       // number[]
g.push('red');                   // (string | number)[]

let h: number[] = [];            // number[]
h.push(1);                       // OK
h.push('red');                   // ❌ Error: Argument of type '"red"' is not assignable to parameter of type 'number'

```

The default behaviour of typescript if we don't provide any type is to keep everything homogenious only of one type with with which the object was initialized.
