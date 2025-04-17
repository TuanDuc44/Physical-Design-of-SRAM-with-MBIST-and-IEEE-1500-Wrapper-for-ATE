# Physical-Design-of-SRAM-with-MBIST-and-IEEE-1500-Wrapper-for-ATE
Design and implement a complete front-end and back-end flow for an SRAM block integrated with DFT support using MBIST, wrapped in IEEE 1500 standard for ATE (Automatic Test Equipment) simulation.

# 🧠 IEEE 1500 Wrapper for SRAM + MBIST | Physical Design Project

This project demonstrates a full front-end to back-end design flow for embedding an SRAM macro with MBIST logic using an IEEE 1500-compliant wrapper. The design simulates DFT-ready architecture suitable for ATE, using open-source tools on a virtual Linux environment.

---

## 🔁 Front-End Overview

### ✅ Modules Implemented:
- `sram_32_512_sky130A`: Generated using **OpenRAM**, 32-bit width, 512-depth.
- `mbist_march_c.v`: Implements March C algorithm for **Built-In Self-Test** (DFT for ATE).
- `ieee1500_wrapper.v`: Connects SRAM macro and MBIST soft IP following **IEEE 1500** standard.

### ⚙️ Simulation Setup:
- **Environment**: Ubuntu 22 (VMware)
- **Tools**: Verilator + Cocotb + Python 3.10.12
- **Testbench**:
  - Python-driven testbenches linked with Verilog modules.
  - Validates MBIST logic and SRAM memory through behavioral simulation.

---

## 🧱 Back-End Overview

### 🧩 IP Classification:
- **SRAM Macro**:
  - Comes with `*.gds`, `*.lef`, `*.def`, and `*.v` from OpenRAM.
  - Edited Verilog to black-box format for compatibility with OpenROAD.
- **MBIST**:
  - Synthesized with **Yosys** from Verilog RTL to gate-level netlist.
- **IEEE 1500 Wrapper**:
  - Yosys synthesis integrates MBIST and SRAM as the top-level design.

### 🏗️ Physical Flow:
- Tool: **OpenROAD** → Floorplan, Placement, Clock Tree Synthesis, Routing.
- Final integration: SRAM macro + MBIST netlist + Wrapper netlist.
- Output: `wrapper.def`, `wrapper.lef`, and GDS generated via **Magic**.

---

## 🎯 Project Goals
- Demonstrate a full-stack design (RTL to GDS) with **DFT integration for ATE**.
- No real ATE used — simulation and layout flows are **fully virtualized** using open-source tools.

---


---

## 📌 Tools Used

- OpenRAM (for SRAM generation)
- Verilator + Cocotb (for RTL simulation)
- Yosys (synthesis)
- OpenROAD (PnR)
- Magic (GDS generation)

---

## 🧪 Status
✅ Functional simulation  
✅ Gate-level netlist  
✅ Physical layout with GDS  
⛔ No real ATE – simulation only

---

## 🧠 Author
[NGUYEN DUC TUAN] – Physical Design & DFT Enthusiast  


