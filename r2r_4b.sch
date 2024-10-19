v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -70 180 -70 {
lab=VOUT}
N 140 -90 180 -90 {
lab=VDD}
N -420 -70 -200 -70 {
lab=#net1}
N -570 -70 -480 -70 {
lab=#net2}
N -700 -70 -630 -70 {
lab=#net3}
N -860 -70 -760 -70 {
lab=#net4}
N -800 -160 -800 -70 {
lab=#net4}
N -660 -160 -660 -70 {
lab=#net3}
N -530 -160 -530 -70 {
lab=#net2}
N -380 -160 -380 -70 {
lab=#net1}
N 160 -70 160 10 {
lab=VOUT}
N -800 -270 -800 -220 {
lab=#net5}
N -660 -270 -660 -220 {
lab=#net6}
N -530 -270 -530 -220 {
lab=#net7}
N -380 -270 -380 -220 {
lab=#net8}
N -800 -380 -800 -330 {
lab=GND}
N -800 -380 -300 -380 {
lab=GND}
N -300 -380 -300 -350 {
lab=GND}
N -660 -380 -660 -330 {
lab=GND}
N -530 -380 -530 -330 {
lab=GND}
N -380 -380 -380 -330 {
lab=GND}
N -200 -90 -200 -70 {
lab=#net1}
N -200 -90 -160 -90 {
lab=#net1}
N -160 -70 -160 10 {
lab=VOUT}
N -160 10 160 10 {
lab=VOUT}
N -940 -70 -940 -40 {
lab=GND}
N -940 -70 -920 -70 {
lab=GND}
N -300 -540 -300 -520 {
lab=GND}
N -300 -630 -300 -600 {
lab=VDD}
C {opamp.sym} -10 -80 0 0 {name=x1}
C {iopin.sym} 180 -70 0 0 {name=p3 lab=VOUT}
C {res.sym} -380 -190 0 0 {name=R1
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -530 -190 0 0 {name=R2
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -660 -190 0 0 {name=R3
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -800 -190 0 0 {name=R4
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -450 -70 1 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -600 -70 1 0 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -730 -70 1 0 {name=R7
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -890 -70 1 0 {name=R8
value=2k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -380 -300 0 0 {name=D0 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -530 -300 0 0 {name=D1 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -660 -300 0 0 {name=D2 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -800 -300 0 0 {name=D3 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {gnd.sym} -300 -350 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 180 -90 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -940 -40 0 0 {name=l1 lab=GND}
C {vsource.sym} -300 -570 0 0 {name=VDD value=0.7 savecurrent=false}
C {gnd.sym} -300 -520 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -300 -630 0 0 {name=p5 sig_type=std_logic lab=VDD}
