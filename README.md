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

- [**Lexicographical sorting of 2D points**](./3_memory/6_structures/2_lexicographic_sort.asm)  
  Implements insertion-style sorting over an array of `(x, y)` structs using raw memory offsets.

- [**AABB (Axis-Aligned Bounding Box) intersection**](./3_memory/6_structures/1_intersection.asm)  
  Computes rectangle overlap using min/max point comparisons.

- [**Rectangle area comparison**](./3_memory/6_structures/0_area_competition.asm)  
  Calculates areas from struct fields and determines the larger rectangle.

- [**Most common number**](./3_memory/5_ex/3_common_number.asm)  
  Uses a frequency table in memory to find the most common byte value.

- [**Gray code -> binary conversion**](./2_bitwise_operations/7_gray_to_binary.asm)  
  Implements bitwise propagation across 32 bits.

- [**Bit reversal**](./2_bitwise_operations/2_bit_reverse.asm)  
  Reverses a 32-bit integer using shifts and rotates.

---

### Additional Exercises

The repository also includes smaller programs exploring:
- [Prime number generation](./0_branching/2_basic_conditional_branching/31_all_primes.asm)  
- [Fibonacci sequences](./0_branching/2_basic_conditional_branching/2_fibonacci.asm)  
- [Power-of-two detection](./2_bitwise_operations/6_2_power_2_loopless.asm)  
- [Basic arithmetic and looping](./3_memory/5_ex/1_0_strange_sum_mem.asm)  

These were written as part of learning instruction-level control flow and arithmetic.

---

### About building

This repository only includes **my own assembly source files**.  
The original course-provided include files (`training.inc`, `win32a.inc`) are excluded for copyright reasons, so the programs will not build as-is.

All program output is in **hexadecimal format**.

The code is provided for **review and demonstration of low-level programming practice**, not as a standalone build system.
