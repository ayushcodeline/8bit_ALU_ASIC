# 8-bit ALU ASIC | RTL-to-GDSII Implementation

## Overview

This project demonstrates the complete RTL-to-GDSII ASIC design flow of a parameterized 8-bit Arithmetic Logic Unit (ALU) using open-source EDA tools and the Sky130 Process Design Kit (PDK).

The design was implemented from RTL coding to physical layout generation using the OpenLane/OpenROAD flow.

---

## Features

* 8-bit Parameterized ALU
* Arithmetic Operations
* Logic Operations
* Shift Operations
* Status Flag Generation

---

## Design Flow

```
Specification
        ↓
RTL Design (Verilog)
        ↓
Functional Verification
        ↓
Logic Synthesis (Yosys)
        ↓
Static Timing Analysis (OpenSTA)
        ↓
Floorplanning
        ↓
Placement
        ↓
Routing
        ↓
Magic GDS Generation
        ↓
DRC Verification
```

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Yosys
* OpenSTA
* OpenLane
* OpenROAD
* Magic
* KLayout
* Sky130 PDK

---

## Results

| Parameter      | Value        |
| -------------- | ------------ |
| Standard Cells | 156          |
| Estimated Area | 1320.016 μm² |
| Routing        | Completed    |
| Magic DRC      | 0 Violations |
| GDSII          | Generated    |

---

## Repository Structure

```
rtl/
tb/
simulation/
synthesis/
floorplan/
placement/
routing/
gdsii/
reports/
docs/
```

---

## Future Improvements

* Sequential ALU
* Clock Tree Synthesis (CTS)
* Timing Optimization
* RISC-V Integration

---

## Author

Ayush Yalasangi
ASIC | RTL Design | Physical Design | OpenLane | Sky130
