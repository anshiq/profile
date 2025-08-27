# Custom Iterator

## What is Iterator

An iterator is any object that has a next() method returning { value, done }.

Your next() method:

```javascript
next() {
  return {
    value: this.count++,    // Return the current value, then apply given operation/calculation
    done: this.count === 10 // Stop when count reaches 10
  };
}
```

Now, our object is Iterator, means can be iterate over it somehow

## How to make it Iteratable??

Use `[Symbol.iterator]()`!!! in you object. This method makes your object iterable — it returns something that the for...of loop or spread operator (...) can use.

```javascript
  [Symbol.iterator]() {
  return this;
}

```

Now when ever we will use this in spead operator or in for...of loop, javascript will look for next(), next().value, next().done in your object and till your done is not true it will keep executing next function. For example:

```javascript
const anshik = {
  count: 0,
  next() {
    return {
      value: this.count++,
      done: this.count === 10,
    };
  },
  // your object is iterator
  [Symbol.iterator]() {
    return this;
  },
  // made it iterable trough spread/ for...of loop compatible
console.log([...anshik]);
for (const i of anshik) {
  console.log(i);
}
```

## What is Generator

A generator is a special function declared with function\*, and it can be paused and resumed using the yield keyword.

```javascript
function* anshik() {
  for (let i = 0; i < 10; i++) {
    yield i;
  }
}

console.log([...anshik()]);
// 0,1,2....
//or
console.log(anshik.next()); //output= {value:0,done:false}
console.log(anshik.next());
console.log(anshik.next());
console.log(anshik.next());
console.log(anshik.next());
//....
// in under the hood yield key word is converted to next().value, next().done and when on next iteration of next() if yield is not defined it assumes done:true!!
```

## Experiment Time!!!

Now, if we try

```javascript
const m = [
  { value: 1, done: false },
  { value: 2, done: false },
  { value: 3, done: true },
];
for (const i of m) {
  console.log(i);
}
// i will not give direct 1,2,3 and behave simply, so iterators and generators are internal js machanisums which works only in presence of yeild and [Symbol]
```
