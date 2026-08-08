# 8-bit FIFO Memory Using Verilog

## 📌 Project Overview

This project implements an **8-bit FIFO (First-In First-Out) Memory** using Verilog HDL.

A FIFO is a memory structure in which the data written first is read first.

This project implements a synchronous FIFO with:

* 8-bit data width
* 8 storage locations
* Write operation
* Read operation
* Full flag
* Empty flag
* Testbench
* Simulation waveform

## 🔹 FIFO Specifications

| Parameter       | Value              |
| --------------- | ------------------ |
| Data Width      | 8 bits             |
| FIFO Depth      | 8                  |
| Type            | Synchronous FIFO   |
| Write Interface | `wr_en`, `data_in` |
| Read Interface  | `rd_en`            |
| Output          | `data_out`         |
| Status          | `full`, `empty`    |

## 🔹 FIFO Concept

FIFO stands for **First-In First-Out**.

The first data written into the FIFO is the first data that is read.

Example:

```text
Write:
A1 → B2 → C3 → D4

Read:
A1 → B2 → C3 → D4
```

Therefore:

```text
First In = First Out
```

## 🔹 FIFO Signals

| Signal     | Description             |
| ---------- | ----------------------- |
| `clk`      | Clock signal            |
| `rst`      | Reset signal            |
| `wr_en`    | Write enable            |
| `rd_en`    | Read enable             |
| `data_in`  | Input data              |
| `data_out` | Output data             |
| `full`     | Indicates FIFO is full  |
| `empty`    | Indicates FIFO is empty |

## 📂 Project Structure

```text
fifo-verilog/
│
├── README.md
├── src/
│   └── fifo.v
├── testbench/
│   └── tb_fifo.v
└── simulation/
    └── waveform.png
```

## 💻 Design Description

The FIFO contains:

* Memory array
* Write pointer
* Read pointer
* Data counter

### Write Operation

When:

```text
wr_en = 1
```

and the FIFO is not full, data is stored in the memory.

The write pointer moves to the next location.

### Read Operation

When:

```text
rd_en = 1
```

and the FIFO is not empty, data is read from memory.

The read pointer moves to the next location.

### Full Condition

The FIFO becomes full when all eight memory locations contain data.

```text
full = 1
```

### Empty Condition

The FIFO is empty when there is no data available to read.

```text
empty = 1
```

## 🔄 FIFO Block Diagram

```text
                 +----------------+
data_in -------->|                |
wr_en ---------->|     FIFO       |--------> data_out
rd_en ---------->|    MEMORY      |
clk ------------>|                |
rst ------------>|                |
                 +----------------+
                    |          |
                    v          v
                  full       empty
```

## 🧪 Testbench

The testbench is located at:

```text
testbench/tb_fifo.v
```

The testbench verifies:

1. Writing data into the FIFO
2. Reading data from the FIFO
3. FIFO ordering
4. Empty condition
5. Multiple write operations
6. Multiple read operations

The testbench writes:

```text
A1
B2
C3
D4
```

and then reads:

```text
A1
B2
C3
D4
```

This verifies the FIFO behavior.

## ▶️ Simulation Using Icarus Verilog

Compile the design and testbench:

```bash
iverilog -o fifo_sim src/fifo.v testbench/tb_fifo.v
```

Run the simulation:

```bash
vvp fifo_sim
```

The simulation generates:

```text
fifo.vcd
```

## 📊 View Waveform Using GTKWave

Open the waveform:

```bash
gtkwave fifo.vcd
```

Add these signals:

```text
clk
rst
wr_en
rd_en
data_in
data_out
full
empty
```

Save a screenshot of the waveform as:

```text
simulation/waveform.png
```

## 📋 Expected Simulation

The first four values written are:

```text
A1 → B2 → C3 → D4
```

The values read from the FIFO should be:

```text
A1 → B2 → C3 → D4
```

This confirms the FIFO's First-In First-Out behavior.

After reading all four values:

```text
empty = 1
```

## 🎯 Applications

FIFO memories are commonly used in:

* Processor systems
* UART communication
* Data buffering
* Network interfaces
* Audio and video systems
* Digital signal processing
* FPGA designs
* Clock-domain data buffering

## 📚 Learning Outcomes

This project demonstrates:

* FIFO architecture
* Memory arrays
* Read and write pointers
* Counters
* Sequential logic
* Verilog HDL
* Testbench development
* Data buffering
* Simulation
* GTKWave waveform analysis
* GitHub project organization

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## 👩‍💻 Author

**Honey Praveena**

## 📄 License

This project is created for educational and academic purposes.
