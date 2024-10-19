v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 680 210 720 210 {
lab=VOUT}
N 680 190 720 190 {
lab=VDD}
N -460 -370 -460 -350 {
lab=GND}
N -460 -460 -460 -430 {
lab=VDD}
N 120 210 340 210 {
lab=#net1}
N -30 210 60 210 {
lab=#net2}
N -160 210 -90 210 {
lab=#net3}
N -320 210 -220 210 {
lab=#net4}
N -420 210 -380 210 {
lab=#net5}
N -260 120 -260 210 {
lab=#net4}
N -120 120 -120 210 {
lab=#net3}
N 10 120 10 210 {
lab=#net2}
N 160 120 160 210 {
lab=#net1}
N 700 210 700 290 {
lab=VOUT}
N -260 10 -260 60 {
lab=#net6}
N -120 10 -120 60 {
lab=#net7}
N 10 10 10 60 {
lab=#net8}
N 160 10 160 60 {
lab=#net9}
N -260 -100 -260 -50 {
lab=GND}
N -260 -100 240 -100 {
lab=GND}
N 240 -100 240 -70 {
lab=GND}
N -120 -100 -120 -50 {
lab=GND}
N 10 -100 10 -50 {
lab=GND}
N 160 -100 160 -50 {
lab=GND}
N 340 190 340 210 {
lab=#net1}
N 340 190 380 190 {
lab=#net1}
N 380 210 380 290 {
lab=VOUT}
N 380 290 700 290 {
lab=VOUT}
N -840 10 -840 60 {
lab=#net10}
N -700 10 -700 60 {
lab=#net11}
N -570 10 -570 60 {
lab=#net12}
N -420 10 -420 60 {
lab=#net13}
N -840 -100 -840 -50 {
lab=GND}
N -700 -100 -700 -50 {
lab=GND}
N -570 -100 -570 -50 {
lab=GND}
N -420 -100 -420 -50 {
lab=GND}
N -1140 10 -1140 60 {
lab=#net14}
N -1000 10 -1000 60 {
lab=#net15}
N -1140 -100 -1140 -50 {
lab=GND}
N -1000 -100 -1000 -50 {
lab=GND}
N -610 210 -520 210 {
lab=#net16}
N -740 210 -670 210 {
lab=#net17}
N -900 210 -800 210 {
lab=#net18}
N -1000 210 -960 210 {
lab=#net19}
N -840 120 -840 210 {
lab=#net18}
N -700 120 -700 210 {
lab=#net17}
N -570 120 -570 210 {
lab=#net16}
N -420 120 -420 210 {
lab=#net5}
N -460 210 -420 210 {
lab=#net5}
N -1140 120 -1140 210 {
lab=#net20}
N -1170 210 -1110 210 {
lab=#net20}
N -1050 210 -1000 210 {
lab=#net19}
N -1000 120 -1000 210 {
lab=#net19}
N -1300 210 -1300 240 {
lab=GND}
N -1300 210 -1280 210 {
lab=GND}
N -1140 -100 -260 -100 {
lab=GND}
N -1280 210 -1230 210 {
lab=GND}
C {opamp.sym} 530 200 0 0 {name=x1}
C {vsource.sym} -460 -400 0 0 {name=VDD value=0.7 savecurrent=false}
C {iopin.sym} 720 210 0 0 {name=p3 lab=VOUT}
C {gnd.sym} -460 -350 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -460 -460 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {res.sym} 160 90 0 0 {name=R1
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} 10 90 0 0 {name=R2
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -120 90 0 0 {name=R3
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -260 90 0 0 {name=R4
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} 90 210 1 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -60 210 1 0 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -190 210 1 0 {name=R7
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -350 210 1 0 {name=R8
value=1k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 160 -20 0 0 {name=D0 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} 10 -20 0 0 {name=D1 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -120 -20 0 0 {name=D2 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -260 -20 0 0 {name=D3 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {gnd.sym} 240 -70 0 0 {name=l4 lab=GND}
C {gnd.sym} -1300 240 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 720 190 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {res.sym} -420 90 0 0 {name=R9
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -570 90 0 0 {name=R10
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -700 90 0 0 {name=R11
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -840 90 0 0 {name=R12
value=2k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -420 -20 0 0 {name=D4 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -570 -20 0 0 {name=D5 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -700 -20 0 0 {name=D6 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -840 -20 0 0 {name=D7 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {res.sym} -1000 90 0 0 {name=R13
value=2k
footprint=1206
device=resistor
m=1}
C {res.sym} -1140 90 0 0 {name=R14
value=2k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -1000 -20 0 0 {name=D8 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {vsource.sym} -1140 -20 0 0 {name=D9 value=PULSE(0 0.7 0 1n 1n 1u 2u) savecurrent=false}
C {res.sym} -490 210 1 0 {name=R15
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -640 210 1 0 {name=R16
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -770 210 1 0 {name=R17
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -930 210 1 0 {name=R18
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -1080 210 1 0 {name=R19
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -1200 210 1 0 {name=R20
value=2k
footprint=1206
device=resistor
m=1}
