![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg) ![](../../workflows/fpga/badge.svg)

# CDM BOOTCAMP 2026

## How it works

A traffic-light controller built entirely from logic gates and flip-flops (no HDL). A 2-bit state register cycles Green → Yellow → Red → Green, and a 4-bit down-counter times each phase: 10 clock cycles for Green and Red, 5 for Yellow. The counter's current value drives a 7-segment display, counting down 9→0 each phase. When the counter hits 0, the state advances and the counter reloads.

## How to test

- Feed a clock into `clk` and release `rst_n` (active-low reset starts the sequence at Green, count 9).
- Watch `uo_out[6:0]` drive a 7-segment display, counting 9→0 during each phase.
- `uo_out[7]` is high while the light is Green.
- Pulse `rst_n` low at any time to restart the sequence from Green.

## External hardware

A common-cathode 7-segment display on `uo_out[6:0]` (segments A–G). Optionally, LEDs on spare `uio` pins for Yellow/Red indication.
