# Array-Like Objects

An array-like object is any object with a `length` property and indexed elements (numeric keys like 0, 1, etc.).

```javascript
const m = {
  length: 10,
};
// This object behaves like an array in structure,
// but it doesn't inherit array methods like push, map, filter, etc.
```

## ✅ Converting to Array

If the array-like object has keys in a sequence from 0 to length - 1, we can convert it to a real array using `Array.from()`:

```javascript
const kk = {
  0: 20,
  1: 3,
  2: 4,
  3: 11,
  length: 4,
};
const arr = Array.from(kk);
console.log(arr); // [20, 3, 4, 11]
```

## ⚠️ Edge Cases & Behavior

### 1. Missing Indices → undefined

```javascript
const obj = {
  0: "a",
  2: "b",
  length: 3,
};
console.log(Array.from(obj)); // ['a', undefined, 'b']
```

### 2. Non-numeric Keys Are Ignored

```javascript
const obj = {
  0: "x",
  1: "y",
  foo: "bar",
  length: 2,
};
console.log(Array.from(obj)); // ['x', 'y']
```

### 3. length as String or Non-numeric

```javascript
const obj = {
  0: "a",
  1: "b",
  length: "2",
};
console.log(Array.from(obj)); // ['a', 'b']
```

```javascript
const bad = {
  0: "x",
  1: "y",
  length: "abc",
};
console.log(Array.from(bad)); // []
```

### 4. Float length is Floored

```javascript
const obj = {
  0: "a",
  1: "b",
  2: "c",
  length: 2.7,
};
console.log(Array.from(obj)); // ['a', 'b']
```

### 5. Mapping Function in Array.from()

```javascript
const obj = {
  0: 2,
  1: 3,
  2: 4,
  length: 3,
};
const result = Array.from(obj, (value) => value * 2);
console.log(result); // [4, 6, 8]
```

### 6. Real World Example: arguments

```javascript
function example() {
  const args = Array.from(arguments);
  console.log(args); // ['a', 'b', 'c']
}
example("a", "b", "c");
```

## Key Takeaways

- Array-like objects have `length` property and numeric indices
- `Array.from()` converts them to real arrays with all array methods
- Missing indices become `undefined` in the resulting array
- Non-numeric properties are ignored during conversion
- String lengths are coerced to numbers, invalid strings result in empty arrays
- Float lengths are floored to integers
- Mapping function can transform values during conversion
