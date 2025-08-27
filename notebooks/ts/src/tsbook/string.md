# Strings in js/ts

## String defination

When String() is called as a function (without new), it returns value coerced to a string primitive. one\
But When String() is called as a constructor (with new), it coerces value to a string primitive (without special symbol handling) and returns a wrapping String object, which is not a primitive. one\
For Example:

```typescript
const a = new String("Hello world"); // a === "Hello world" is false
const b = String("Hello world"); // b === "Hello world" is true
a instanceof String; // is true
b instanceof String; // is false
typeof a; // "object"
typeof b; // "string"
```

## String behaviour with Symbols

```typescript
const sym = Symbol("example");
`${sym}`; // TypeError: Cannot convert a Symbol value to a string
"" + sym; // TypeError: Cannot convert a Symbol value to a string
"".concat(sym); // TypeError: Cannot convert a Symbol value to a string
```
