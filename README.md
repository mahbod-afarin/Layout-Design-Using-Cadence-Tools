# Physical Design and Layout Flow Using Cadence for Synthesized Digital Circuits

1. For this project, you must use the same Verilog code from the [Post-Synthesis-Evaluation](https://github.com/mahbod-afarin/Post-Synthesis-Evaluation) project.
2. You will need the `.sdc` file, which is the output of the first part (synthesis of the circuit using Design Compiler).
3. In the SoC tool, define the floorplan and place the initial metal and power layers.
4. After routing, place the synthesized cells of the design on the die.
5. In the next step, perform final routing and add filler metals to complete the final layout.
6. After the layout is finalized, perform timing analysis to ensure the correctness of the layout.
7. Another output of the layout design is **RC extraction**, which generates a `.spef` file containing parasitic information of the circuit.
8. In the final step, using trial and error, determine the approximate smallest die size for your design.

## 🛠️ Design Flow Steps

### 1. **Design Import**
- Launch `encounter` from terminal.
- Import files:
  - `Netlist` (output from DC)
  - `SDC` (Standard Delay Constraints)
  - `LEF` (technology layer and standard cell info)
- Use both standard LEF and antenna-effect LEF files.

### 2. **Floorplanning**
- Define VDD and GND in `Advanced → Power` tab.
- Use “Specify by Die Size” to manually set the die area.
- Create **VDD/VSS rings** around the core for power distribution and noise immunity.

### 3. **Power Planning**
- Connect power/ground using `Global Net Connections`.
- Add **Tie High** and **Tie Low** cells for noise-resistant logic levels.
- Add **power strips** inside the core using: Power → Power Planning → Add Strip
- Run **Special Route** to connect all power components.

### 4. **Clock Tree Synthesis (CTS)**
- Generate buffer/inverter trees for `clk` signals.
- Use: Clock → Generate Clock Spec
- Verify **setup time** and **hold time** through: Timing → Timing Analysis
- If hold violations exist, apply **Hold Optimization** until violations are resolved.

### 5. **Routing**
- Perform final routing using Encounter tools.
- Visualize signal routes and check congestion visually.

### 6. **Verification**
- Run:
- `Verify → Geometry`
- `Verify → Connectivity`
- Ensure there are **0 violations and 0 warnings**.

### 7. **Filler Cells and Metal Fill**
- Add filler cells to close cell gaps for manufacturability.
- Perform **Metal Fill** to ensure uniform metal density:

---

## ⏱️ Final Timing Check

- Re-run timing analysis post-layout.
- Eliminate antenna effects using `ANTENNATF` diodes.
- Confirm:
- No negative setup/hold slack
- No DRC violations

---

## 📦 Outputs

- `*.spef` — extracted parasitic file  
- `*.gds` — layout GDSII for tape-out  
- Final netlist  
- Timing reports and verification logs

---

## 📐 Die Size Exploration

Using trial and error, the optimal die size was found to be approximately: 390µm × 390µm
