# Experiments

## Assigning object as key in object

```

let i = {
  10: "akkkdkd",
};
const p = {
  [i]: 888,
  10:44,
};
console.log(p["[object Object]"]);
// output is 888 wtf
console.log(p[10]);
```

## Ts Unions and Intersections.

```
  type k = {
  name: string;
  desc: string;
};
type k1 = {
  name: number;
  desc1: string;
};
type p = k | k1; //union
let mmmm: p = {
  name: 33,
  desc: "",
  desc1: "",
};
mmmm.name; // both string and number

type m = {
  name: string;
  desc: string;
};
type m1 = {
  name: number;
  desc1: string;
};
type n = m & m1; //name is only comman
let mmm: n = {
  name,
};
m.name; // name is now of type never because string & number is not possible at same time....

```
