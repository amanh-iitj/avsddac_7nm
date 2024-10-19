v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 120 -0 120 170 {
lab=#net1}
N 160 -30 420 -30 {
lab=#net1}
N 460 0 460 170 {
lab=#net2}
N 120 230 120 280 {
lab=#net3}
N 120 280 460 280 {
lab=#net3}
N 300 280 300 370 {
lab=#net3}
N 120 -140 120 -60 {
lab=VDD}
N 120 -140 460 -140 {
lab=VDD}
N 460 -140 460 -50 {
lab=VDD}
N 770 -140 770 -60 {
lab=VDD}
N 460 -140 770 -140 {
lab=VDD}
N 460 50 590 50 {
lab=#net2}
N 650 50 770 50 {
lab=VOUT}
N 770 0 770 50 {
lab=VOUT}
N 770 50 770 290 {
lab=VOUT}
N 770 80 1100 80 {
lab=VOUT}
N 1010 80 1010 110 {
lab=VOUT}
N 570 -30 570 50 {
lab=#net2}
N 570 -30 730 -30 {
lab=#net2}
N -120 430 -120 550 {
lab=#net4}
N -120 550 770 550 {
lab=#net4}
N 770 340 770 550 {
lab=#net4}
N -120 150 -120 370 {
lab=#net5}
N -80 400 260 400 {
lab=#net5}
N -120 320 -20 320 {
lab=#net5}
N -20 320 -20 400 {
lab=#net5}
N 200 310 730 310 {
lab=#net5}
N 200 310 200 400 {
lab=#net5}
N 1010 170 1010 530 {
lab=#net4}
N 770 550 1010 550 {
lab=#net4}
N 1010 530 1010 550 {
lab=#net4}
N -120 400 -120 420 {
lab=#net6}
N 770 310 770 330 {
lab=#net7}
N 120 -50 120 -30 {
lab=#net8}
N 770 -60 770 -30 {
lab=VDD}
N 460 -50 460 -30 {
lab=VDD}
N -120 -140 120 -140 {
lab=VDD}
N -120 -140 -120 90 {
lab=VDD}
N 120 40 210 40 {
lab=#net1}
N 210 -30 210 40 {
lab=#net1}
N 300 400 300 420 {
lab=#net9}
N 300 430 300 550 {
lab=#net4}
N 160 -320 160 -290 {
lab=GND}
N 290 -320 290 -290 {
lab=GND}
N 430 -320 430 -290 {
lab=GND}
N 460 230 460 280 {
lab=#net3}
N 120 200 150 200 {
lab=GND}
N 150 200 150 240 {
lab=GND}
N 400 200 400 230 {
lab=GND}
N 400 200 460 200 {
lab=GND}
N 160 -430 160 -380 {
lab=VIN1}
N 290 -430 290 -380 {
lab=VIN2}
N 430 -430 430 -380 {
lab=VDD}
N 470 550 470 630 {
lab=#net4}
N 20 200 80 200 {
lab=VIN1}
N 500 200 570 200 {
lab=VIN2}
N 410 -160 410 -140 {
lab=VDD}
C {asap_7nm_nfet.sym} 100 200 0 0 {name=nfet1 model=asap_7nm_nfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_pfet.sym} 440 -30 0 0 {name=pfet1 model=asap_7nm_pfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_pfet.sym} 140 -30 0 1 {name=pfet2 model=asap_7nm_pfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_nfet.sym} 480 200 0 1 {name=nfet2 model=asap_7nm_nfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_nfet.sym} 280 400 0 0 {name=nfet3 model=asap_7nm_nfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_nfet.sym} -100 400 0 1 {name=nfet4 model=asap_7nm_nfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_pfet.sym} 750 -30 0 0 {name=pfet3 model=asap_7nm_pfet spiceprefix=X l=7e-009 nfin=14}
C {asap_7nm_nfet.sym} 750 310 0 0 {name=nfet5 model=asap_7nm_nfet spiceprefix=X l=7e-009 nfin=14}
C {capa-2.sym} 1010 140 0 0 {name=C1
m=1
value=2p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 620 50 1 0 {name=C2
m=1
value=100f
footprint=1206
device=polarized_capacitor}
C {isource.sym} -120 120 0 0 {name=I0 value=20u}
C {vsource.sym} 160 -350 0 0 {name=VIN1 value=0.7 savecurrent=false}
C {vsource.sym} 290 -350 0 0 {name=VIN2 value=0.7 savecurrent=false}
C {vsource.sym} 430 -350 0 0 {name=VDD value=0.7 savecurrent=false}
C {gnd.sym} 160 -290 0 0 {name=l2 lab=GND}
C {gnd.sym} 290 -290 0 0 {name=l4 lab=GND}
C {gnd.sym} 430 -290 0 0 {name=l5 lab=GND}
C {gnd.sym} 150 240 0 0 {name=l6 lab=GND}
C {gnd.sym} 400 230 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 430 -430 0 0 {name=VIN5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 160 -430 0 0 {name=p3 sig_type=std_logic lab=VIN1}
C {lab_pin.sym} 290 -430 0 1 {name=p4 sig_type=std_logic lab=VIN2}
C {ipin.sym} 20 200 0 0 {name=p5 lab=VIN1
}
C {opin.sym} 1100 80 0 0 {name=p6 lab=VOUT}
C {iopin.sym} 410 -160 0 0 {name=p7 lab=VDD}
C {ipin.sym} 570 200 0 1 {name=p1 lab=VIN2}
C {gnd.sym} 470 630 0 0 {name=l1 lab=GND}
