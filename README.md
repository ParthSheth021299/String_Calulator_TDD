# string_calculator_TDD

A demo  of TDD laws and how to integrate it for scalable development.

## Three Laws of TDD (Test-Driven Development)

1. **You may not write production code unless it is to make a failing test pass.**
2. **You may not write more of a test than is sufficient to fail, and compilation failures are failures.**
3. **You may not write more production code than is sufficient to pass the currently failing test.**

---

## What We Have Covered

This project follows the **String Calculator Kata** using **TDD principles**.  
We started with the simplest possible case and incrementally added features with tests driving the implementation.

### Features Implemented:
- Return 0 for an empty string.
- Return a single number when only one is provided.
- Handle two numbers separated by a comma.
- Support multiple numbers separated by commas.
- Support newline (`\n`) as a delimiter.
- Support custom single-character delimiters (`//;\n1;2`).
- Support custom delimiters of any length (`//[***]\n1***2***3`).
- Support multiple delimiters (`//[*][%]\n1*2%3`).
- Support multiple delimiters of varying lengths (`//[***][%%]\n1***2%%3`).
- Ignore numbers greater than 1000.
- Throw an exception when negative numbers are passed, listing all negatives.

---

## Development Process

The development followed **Red → Green → Refactor**:
1. **Red** – Write a test that fails because the functionality does not exist.
2. **Green** – Write the minimum production code required to make the test pass.
3. **Refactor** – Clean up code without changing functionality, ensuring all tests still pass.

At each step:
- We wrote a **failing test first**.
- Implemented just enough code to make it pass.
- Gradually evolved the solution by **adding tests for new rules** and updating the implementation.
- Used **incremental commits** to keep changes small and focused.

This process ensured:
- Code is well-tested.
- Implementation is driven by requirements.
- Clean and maintainable structure.


![App Demo](working_string_calculator_tdd.gif)


---
