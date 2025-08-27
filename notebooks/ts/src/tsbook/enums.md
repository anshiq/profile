# Enums

There are two kinds of enums: enums that map from strings to strings, and enums that map from strings to numbers. They look like this:

```
enum Language {
English = 0,
Spanish = 1
enum Language {
Russian = 2
}
}
enum Language { English, Spanish, Russian } // ts automatically merge types
```

```
enum Language {
English = 100,
Spanish = 200 + 300,
Russian // TypeScript infers 501 (the next number after 500)
}
```

Language[6] // ts won't give error<br/> use enum with const to disable unsafe access like Language[6]

```
  const enum Language {
English,
Spanish,
Russian
}
let d = Language[6] // Error TS2476: A const enum member can only be
// accessed using a string literal.
```

but it also can generate issue as shown inbook page 43 <br/> TSC Flag: preserveConstEnums<br/> use string to string relation ship in const based enums to avoid any miscalculations <br/>
