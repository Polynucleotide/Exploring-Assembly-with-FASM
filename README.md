## Exploring Assembly with FASM

This repository contains a curated collection of x86 assembly programs written while studying low-level programming using xorpd's *Assembly Language Adventures*.

The goal of this project was to build intuition for **control flow, memory layout, struct access, and bitwise operations** by implementing concrete algorithms directly in assembly.

These programs include working with:
- Structured data (Points, Rectangles)
- Arrays and indexing
- Bitwise algorithms
- Sorting and geometric logic

---

### Featured Programs

Some of the more representative exercises include:

- **Lexicographical sorting of 2D points** 
  Implements insertion-style sorting over an array of `(x, y)` structs using raw memory offsets.

- **AABB (Axis-Aligned Bounding Box) intersection**  
  Computes rectangle overlap using min/max point comparisons.

- **Rectangle area comparison**  
  Calculates areas from struct fields and determines the larger rectangle.

- **Most common number**  
  Uses a frequency table in memory to find the most common byte value.

- **Gray code -> binary conversion**  
  Implements bitwise propagation across 32 bits.

- **Bit reversal**  
  Reverses a 32-bit integer using shifts and rotates.

---

### Additional Exercises

The repository also includes smaller programs exploring:
- Prime number generation  
- Fibonacci sequences  
- Power-of-two detection  
- Basic arithmetic and looping  

These were written as part of learning instruction-level control flow and arithmetic.

---

### About building

This repository only includes **my own assembly source files**.  
The original course-provided include files (`training.inc`, `win32a.inc`) are excluded for copyright reasons, so the programs will not build as-is.

The code is provided for **review and demonstration of low-level programming practice**, not as a standalone build system.
