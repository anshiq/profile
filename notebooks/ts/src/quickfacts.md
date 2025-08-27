# 📝 Quick Notes

## 🔢 Number

**Number** is the set of all numbers: integers, floats, positives, negatives, Infinity, NaN, and so on. Numbers can do, well, numbery things, like addition (`+`), subtraction (`-`), modulo (`%`), and comparison (`<`).

---

## 🧩 Primitives in JS/TS

In JavaScript, a **primitive** (primitive value, primitive data type) is data that is not an object and has no methods or properties. There are **7 primitive data types**:

> `string` • `number` • `bigint` • `boolean` • `undefined` • `symbol` • `null`

### Key Characteristics:

- **All primitives are immutable** — they cannot be altered
- It's important not to confuse a primitive itself with a variable assigned a primitive value
- The variable may be reassigned to a new value, but the existing value cannot be changed in the ways that objects, arrays, and functions can be altered
- The language does not offer utilities to mutate primitive values

### Auto-boxing Behavior:

Primitives have no methods but still behave as if they do. When properties are accessed on primitives, JavaScript **auto-boxes** the value into a wrapper object and accesses the property on that object instead.

**Example:** `"foo".includes("f")` implicitly creates a String wrapper object and calls `String.prototype.includes()` on that object. This auto-boxing behavior is not observable in JavaScript code but is a good mental model of various behaviors — for example, why "mutating" primitives does not work (because `str.foo = 1` is not assigning to the property `foo` of `str` itself, but to an ephemeral wrapper object).

---

## 🔒 Object.seal(...) and Object.freeze(...)

### Object.seal()

In JavaScript, `Object.seal()` is used to restrict modifications to an object's structure:

- ✅ **Prevents** adding or deleting properties
- ✅ **Allows** changing the values of existing ones
- ⚠️ **Not recursive** — sealing an object does **not** seal its nested objects

You must apply `Object.seal()` manually or via a **recursive function** for deeper levels.

> **Note:** If you seal an object with nested objects inside, you can still modify those nested properties unless they are sealed individually.

### Object.freeze()

`Object.freeze()` makes an object completely **immutable** at the top level:

- ❌ **Prevents** addition, deletion, and value updates of its properties
- ⚠️ Like `seal()`, `freeze()` is also **shallow by default**
- Nested objects remain mutable unless **recursively frozen** using a utility function

### Deep Sealing/Freezing

To make an object fully sealed or frozen, including its nested levels, you need to write or use a **deep sealing/freezing function** that traverses and applies the method to each nested object.

> **Important:** Both `seal` and `freeze` work only on **objects** — if you try to seal or freeze a **primitive value** like a string or number, it has **no effect**.

---

## ✅ Is value a valid Object?

| Value             | `{}` | `object type` | `Object` |
| ----------------- | :--: | :-----------: | :------: |
| `{}`              |  ✅  |      ✅       |    ✅    |
| `['a']`           |  ✅  |      ✅       |    ✅    |
| `function () {}`  |  ✅  |      ✅       |    ✅    |
| `new String('a')` |  ✅  |      ✅       |    ✅    |
| `'a'`             |  ✅  |      ❌       |    ✅    |
| `1`               |  ✅  |      ❌       |    ✅    |
| `Symbol('a')`     |  ✅  |      ❌       |    ✅    |
| `null`            |  ❌  |      ❌       |    ❌    |
| `undefined`       |  ❌  |      ❌       |    ❌    |

**Reason:** Some of them are primitive data types.

## Misconception

This is actually one of JavaScript's most famous quirks. When you use the typeof operator on null, it returns "object": javascripttypeof null // returns "object" However, this is widely considered a bug in JavaScript that has been kept for backward compatibility. According to the JavaScript specification, null is actually a primitive value, not an object.
