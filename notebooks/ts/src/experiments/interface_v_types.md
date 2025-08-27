# interfaces vs types

## Types

Types are like which can represent any thing in typescript. everything in ts can be represented by types one\
For Example:

```typescript
type Reservation = any;
type m = Boolean; // class
enum k {
  "akdk" = "dkkdk",
}
type l = k; // enum
type gg = number; // premitive data type
```

## Interfaces

But on the other hand Interfaces and only represent Object and Classes structure no other type.

```typescript
interface num extends number; // no premitive data type
interface bool extends Boolean // yes it can extend class and a class can impelement interface also
interface enuum extends k // no extention from enum

```

basically it only works with object and classes

## Class

And a class can not implement type

```typescript
class M implements Reserve {
  // wrong
}
```
