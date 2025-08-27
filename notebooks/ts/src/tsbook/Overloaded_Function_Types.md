# Overloaded Function Types

Signature call is syntax in ts to prodifine prototype/type of function. There are two type to write a signature call.

## First is Short hand signature call.

```typescript
type Log = (message: string, userId?: string) => void;
```

as simple as that

## Second is Full Call Signature

```typescript
type Log = {
  (message: string, userId?: string): void;
};
```

Now, Full Call Signature comes with very very powerful feature of TypeScript: the ability to overload function types

For Example,

```typescript
type Reserve = {
  (from: Date, to: Date, destination: string): Reservation;
  (destination: string): Reservation;
};
```

In languages like java, C++. We can accomplish this using function overloading, but for each overloading we need to define body of that overloaded method below it. one\
but in typescript we define all type of body content in same function. one\
For Example:

```typescript
type Reserve = {
  (from: Date, to: Date, destination: string): Reservation;
  (destination: string): Reservation;
};
let reserve: Reserve = (arg1: Date | string, arg2?: Date, arg3?: string) => {
  if (typeof arg1 === "string") {
    // we can use instanceof class, or other operators also
    // Called as: reserve("Bali")
    return { destination: arg1 };
  } else {
    // Called as: reserve(date1, date2, "Bali")
    return { from: arg1, to: arg2, destination: arg3 };
  }
};
```

In Typescript we handle all type of edge cases for that function in same body. one\
Also,
