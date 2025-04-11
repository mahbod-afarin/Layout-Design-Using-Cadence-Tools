1. For this project, you must use the same Verilog code from the [Post-Synthesis-Evaluation]<https://github.com/mahbod-afarin/Post-Synthesis-Evaluation> project.
2. You will need the `.sdc` file, which is the output of the first part (synthesis of the circuit using Design Compiler).
3. In the SoC tool, define the floorplan and place the initial metal and power layers.
4. After routing, place the synthesized cells of the design on the die.
5. In the next step, perform final routing and add filler metals to complete the final layout.
6. After the layout is finalized, perform timing analysis to ensure the correctness of the layout.
7. Another output of the layout design is **RC extraction**, which generates a `.spef` file containing parasitic information of the circuit.
8. In the final step, using trial and error, determine the approximate smallest die size for your design.
