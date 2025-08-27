# Null, Undefined, Void and Never

## Null and Undefined

undefined type means the type has not been yet defined. And null means absence of a value it is defined but absent it is defined but can we access or not we don't know.

## Void and Never

Functions that never return (throw, infinite loops) are inferred as returning never by good ts programmers.<br/> void means a function will execute completly. for its scope.

## unkown and never

```
// unknown is the supertype of all types
let value: unknown;

value = 42;         // OK
value = "hello";    // OK
value = true;       // OK
value = { x: 1 };   // OK
// a variable of type unkown can accept any type of value as given
```

```
// at the same time never is the subtype of all types → Bottom type

let neverValue: never;

// You can assign `never` to any type:
let str: string = neverValue;
let num: number = neverValue; // err str is assign berfore initialization but its not giving type error
// OR

function k(): never {
  throw TypeError("eee");
}
let m: string = k();


// a variable of type never can be assigned to any type or it is accepted by any type in ts.

```
