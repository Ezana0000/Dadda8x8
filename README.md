# 8x8 Unsigned Dadda Multiplier

## Project Overview
This project is a structural, gate-level Verilog implementation of an 8x8 unsigned Dadda multiplier. Designed for **ECE 310**, the architecture focuses on high-speed arithmetic by utilizing the Dadda reduction technique to minimize column height across systematic reduction stages.

## Technical Specifications
The design is partitioned into three primary hardware stages:
1.  **Partial Product Generation:** 64 AND gates generate all bitwise products ($a[i] \cdot b[j]$) simultaneously.
2.  **Dadda Reduction Tree:** A structured compression tree using **48 Full Adders** and **8 Half Adders** to reduce the partial product matrix into two final rows.
3.  **Vector Addition:** A final 16-bit **Ripple Carry Adder (RCA)** computes the final product from the reduced rows.

## Design Constraints
To ensure hardware accuracy and low-level modeling, the project adheres to the following constraints:
* **Structural Verilog:** Built entirely using gate-level primitives.
* **No Behavioral Operators:** The design avoids high-level operators like `*` or `+`.
* **Custom Modules:** Includes custom-built `HA` (Half Adder) and `FA` (Full Adder) modules using basic logic gates (AND, OR, XOR).

## Performance & Verification
Functionality was verified using **Xilinx Vivado**. The design successfully passed all structural and functional tests, including:
* **Edge Cases:** Verified $0xFF \times 0xFF$ for correct 16-bit carry propagation.
* **Test Vectors:** Multiple non-trivial operands (e.g., $0x0D \times 0x11$ and $0x3C \times 0xA7$) were simulated to ensure the Dadda tree and RCA stage produced the correct expected outputs.

## Implementation Details
The core logic is contained within:
* `HA` / `FA` modules: Basic building blocks for the reduction tree.
* `Dadda8x8`: The top-level module interconnecting the 64 AND gates and the adder tree.

---
**Author:** Ezana Enquobahrie  
**Date:** February 12, 2026  
**Course:** ECE 310 - Project 1
