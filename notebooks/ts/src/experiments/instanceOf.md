# instance of

```typescript
class DD {}
class MM {}
class PP extends MM {}
const p = new PP();
console.log(p instanceof DD); // false
console.log(p instanceof MM); // true
/////     |||      \\\\\\
let b = true;
let mm = "dkdk";
console.log(b instanceof Boolean); // false
console.log(b instanceof String); //false
```
