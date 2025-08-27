# Result in Rust

In Rust, we have a result-type operator that is used for error-handling operations with the result-type operator. The Result type is wrapped in an enum that has two values - Ok and Err. Ok (T) denotes success while Err(E) is used for representing errors and error values (if present).

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
// T Represents the type of value which will be returned if It successeds without error
// E Represents the type of error value.

```

The Result type is commonly used as a function return value.

```rust
fn divide(numerator: f64, denominator: f64) -> Result<f64, String> {
    if denominator == 0.0 {
        Err("Cannot divide by zero".to_string())
    } else {
        Ok(numerator / denominator)
    }
}

fn main() {
    let result = divide(4.0, 2.0);
    match result {
        Ok(value) => println!("Result: {}", value),
        Err(e) => println!("Error: {}", e),
    }
}
```

## How to Handle Errors with Result

### 1. Using the match Statement

```rust
fn main() {
    let result = divide(4.0, 2.0);
    // we take the variable of type Result<...> and give it to match
    match result {
        Ok(value) => println!("Result: {}", value),
        Err(e) => println!("Error: {}", e),
    }
}

```

### 2. Using If let Statement

If Let statement is short hand version of match. Which only waits for Ok();

```rust
fn main() {
    let result = divide(4.0, 2.0);
    if let Ok(value) = result {
        println!("Result: {}", value);
    }
}
```

### 3. Using the ? Operator

The ? operator is a special syntax in Rust that allows errors to be conveniently propagated from within a function. When calling a function that returns a Result type, the ? operator can simplify error handling

```rust

// i don't get it.
```

## Common Methods of Result

The Result type provides several useful methods that make error handling more convenient.

### 1. is_ok and is_err Methods

```rust
fn main() {
    let result = divide(4.0, 2.0);
    if result.is_ok() {
        println!("Result: {}", result.unwrap());
    } else {
        println!("Error: {}", result.unwrap_err());
    }
}

```

### 2.unwrap and unwrap_err Methods

when you are 100% sure that result won't be an error then you can use unwrap(). but by chance if it will fail unrecoverable panic will occur.

```rust
fn main(){


  let result = divide(4.0, 2.0);
    let value = result.unwrap();
    println!("Result: {}", value);
    }
```

### 3. expect and expect_err Methods

The expect and expect_err methods are similar to unwrap and unwrap_err, but they allow a custom error message to be specified. If the Result is not of the expected variant, a panic occurs and the specified message is printed.

```rust
fn main() {
    let result = divide(4.0, 2.0);
    let value = result.expect("Failed to divide");
    println!("Result: {}", value);
}
```
