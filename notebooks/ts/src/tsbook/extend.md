# Extend of types and interfaces

type are extended using union operators and interfaces are extended using extend keyword

## interface

```typescript
const m = {
  name: "nashi",
};

interface k {
  name: string;
}

interface p extends k {
  description: string;
}

const mmm: p = {
  name: "anhsik",
  description: "dkdkk",
};

const ggg: k = mmm;
// ggg.description // undefined
// inteface follows same java concepts like inheritance, extension and interfaces
```

## types

```typescript
// Base type
type K = {
  name: string;
};

// Extended type (like subclassing)
type P = K & {
  description: string;
};

// Object of extended type
const mmm: P = {
  name: "anhsik",
  description: "dkdkk",
};

// Assigning subtype to base type — works because of structural typing
const ggg: K = mmm;
// ggg.description // undefined
// like java inheritance
```
