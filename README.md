# Design and Implementation of a 10-bit R-2R DAC Using 7nm FinFET Technology with Open-Source Tools

## Table of Contents
- ASAP 7nm PDK
- Design Specifications
- Project Overview
- Schematics, Netlist and Simulations
- Design Characterization
- Conclusion
- References
- Acknowledgement 

## ASAP 7nm PDK:
- The ASAP7 7nm PDK is an open-source Process Design Kit developed by Arizona State University in collaboration with ARM Research. It is a predictive PDK that models a 7nm FinFET technology node, aiming to provide realistic performance estimates for advanced semiconductor designs. ASAP7 is designed to enable research and academic projects in areas such as VLSI design, circuit optimization, and emerging technology exploration. It includes standard cell libraries, device models, parasitics, and design rules based on FinFET technology.




## Design Specifications:

- DAC Type: R2R Ladder
- Resolution: 10-bit
- Technology: FinFET
- Process Node: ASAP7nm PDK
- Components: Operational Amplifier(Opamp), Resistor Ladder(R2R)
- Tools used: Xschem, Ngspice (Opensource)


## Project Overview:

### Operational Amplifier (Op-Amp):

- In this design of 10-bit R2R DAC, a CMOS 2-stage operational amplifier (Op-Amp) is a critical component for the proper functioning of the R-2R DAC. This topology is highly favored in analog circuit design due to its ability to provide both high gain and the flexibility to drive low-impedance loads effectively.

- The CMOS 2-stage Op-Amp consists of two key stages: The first stage is a differential amplifier, responsible for achieving a high gain and rejecting common-mode signals.The second stage further amplifies the signal, ensuring that the Op-Amp can drive loads with significant current demands while maintaining stability and performance.

![Block-diagram-of-two-stage-op-amp](https://github.com/user-attachments/assets/c9aa4ae0-6a64-4b9d-ba9e-0aac6a8e3dfe)


### R2R ladder DAC:

- The R2R ladder DAC is a widely used architecture for digital-to-analog conversion due to its simplicity and scalability. In this design, the ladder structure uses resistors with two values: R and 2R, arranged in a network to divide the input voltages according to the digital input bits. The output is an analog voltage corresponding to the binary-weighted sum of the input digital bits.
- It converts a digital input (binary) to an analog output by leveraging the voltage division principle.

#### Circuit diagram of 4-bit R-2R DAC:

![prasa6-p6-prasa-large](https://github.com/user-attachments/assets/12b9db05-1492-4adb-8547-f73862aeefbe)

#### Circuit diagram of N-bit R-2R DAC:
 
![Fig2-DAC-Circuits](https://github.com/user-attachments/assets/741c69af-22da-4b54-8807-35c5f4e62fab)








## Schematics, Netlist and Simulations:

### 1) Op-Amp:

#### *Schematic:*

![Screenshot from 2024-10-19 13-28-40](https://github.com/user-attachments/assets/acff7135-fbc4-4cd2-9fea-b8ec327ed678)


#### *Generated Netlist of Op-Amp:*

<details>
  <summary>Click to expand the Generated Netlist of Op-Amp section</summary>

```
** sch_path: /home/aman/asap_7nm_Xschem/opamp.sch
**.subckt opamp
Xnfet1 net1 VIN1 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xpfet1 net2 net1 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xpfet2 net1 net1 VDD net7 asap_7nm_pfet l=7e-009 nfin=14
Xnfet2 net2 VIN2 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xnfet3 net3 net4 GND net8 asap_7nm_nfet l=7e-009 nfin=14
Xnfet4 net4 net4 GND net5 asap_7nm_nfet l=7e-009 nfin=14
Xpfet3 VOUT net2 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xnfet5 VOUT net4 GND net6 asap_7nm_nfet l=7e-009 nfin=14
C1 VOUT GND 2p m=1
C2 VOUT net2 100f m=1
I0 VDD net4 20u



* Voltage sources with 180-degree phase shift

VIN1 VIN1 GND SIN(0.5 0.1 1k 0 0) ; 
VIN2 VIN2 GND SIN(0.5 -0.1 1k 0 0) ;  
VDD VDD GND dc 0.7 ;

**.ends
.GLOBAL VDD
.GLOBAL GND

**** begin user architecture code

.subckt asap_7nm_pfet S G D B l=7e-009 nfin=14
	npmos_finfet S G D B BSIMCMG_osdi_P l=7e-009 nfin=14
.ends asap_7nm_pfet

* Transient analysis setup
.TRAN 1u 5m  ;  

.control
    run
    plot v(VOUT) v(VIN1) v(VIN2) ;
.endc


.model BSIMCMG_osdi_P BSIMCMG_va (
+ TYPE = 0

************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 3e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.9278          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2.5e-009       dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.8e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.003469        cdscd   = 0.001486        dvt0    = 0.05
+dvt1    = 0.36            phin    = 0.05            eta0    = 0.094           dsub    = 0.24
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 0
+etaqm   = 0.54            qm0     = 2.183e-012      pqm     = 0.66            u0      = 0.0237
+etamob  = 4               up      = 0               ua      = 1.133           eu      = 0.05
+ud      = 0.0105          ucs     = 0.2672          rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 60000           deltavsat= 0.17            ksativ  = 1.592
+mexp    = 2.491           ptwg    = 25              pclm    = 0.01            pclmg   = 1
+pdibl1  = 800             pdibl2  = 0.005704        drout   = 4.97            pvag    = 200
+fpitch  = 2.7e-008        rth0    = 0.15            cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 0               lcdscdr = 0               lrdsw   = 1.3             lvsat   = 1441
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.007           bigc    = 0.0015          cigc    = 1               dlcigs  = 5e-009
+dlcigd  = 5e-009          aigs    = 0.006           aigd    = 0.006           bigs    = 0.001944
+bigd    = 0.001944        cigs    = 1               cigd    = 1               poxedge = 1.152
+agidl   = 2e-012          agisl   = 2e-012          bgidl   = 1.5e+008        bgisl   = 1.5e+008
+egidl   = 1.142           egisl   = 1.142
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -1.2            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc



.subckt asap_7nm_nfet S G D B l=7e-009 nfin=14
	nnmos_finfet S G D B BSIMCMG_osdi_N l=7e-009 nfin=14
.ends asap_7nm_nfet

.model BSIMCMG_osdi_N BSIMCMG_va (
+ TYPE = 1
************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 1e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.2466          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2e-009         dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.80e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.01            cdscd   = 0.01            dvt0    = 0.05
+dvt1    = 0.47            phin    = 0.05            eta0    = 0.07            dsub    = 0.35
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 2.5
+etaqm   = 0.54            qm0     = 0.001           pqm     = 0.66            u0      = 0.0303
+etamob  = 2               up      = 0               ua      = 0.55            eu      = 1.2
+ud      = 0               ucs     = 1               rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 70000           deltavsat= 0.2             ksativ  = 2
+mexp    = 4               ptwg    = 30              pclm    = 0.05            pclmg   = 0
+pdibl1  = 0               pdibl2  = 0.002           drout   = 1               pvag    = 0
+fpitch  = 2.7e-008        rth0    = 0.225           cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 5e-005          lcdscdr = 5e-005          lrdsw   = 0.2             lvsat   = 0
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.014           bigc    = 0.005           cigc    = 0.25            dlcigs  = 1e-009
+dlcigd  = 1e-009          aigs    = 0.0115          aigd    = 0.0115          bigs    = 0.00332
+bigd    = 0.00332         cigs    = 0.35            cigd    = 0.35            poxedge = 1.1
+agidl   = 1e-012          agisl   = 1e-012          bgidl   = 10000000        bgisl   = 10000000
+egidl   = 0.35            egisl   = 0.35
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -0.7            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc


**** end user architecture code
.end

```
<details>


#### *Simulated waveform*
![opamp_op](https://github.com/user-attachments/assets/bcb113a6-a379-4529-bcd3-5bdd5ec140ef)

- From the above waveform, Gain of the Op-Amp = 3.355.



### 2) 4-bit R2R DAC:

#### *Schematic:*

![Screenshot from 2024-10-19 13-35-59](https://github.com/user-attachments/assets/bb760b23-afc1-4047-b9af-570690506f57)



#### *Generated Netlist of 4-bit R2R DAC:*

<details>
  <summary>Click to expand the Generated Netlist of 4-bit R2R DAC section</summary>

```

** sch_path: /home/aman/asap_7nm_Xschem/r2r_4b.sch
**.subckt r2r VOUT
*.iopin VOUT
x1 VDD VOUT net1 VOUT opamp
VDD VDD GND 0.7
R1 net9 net1 2k m=1
R2 net8 net2 2k m=1
R3 net7 net3 2k m=1
R4 net6 net4 2k m=1
R5 net1 net2 1k m=1
R6 net2 net3 1k m=1
R7 net3 net4 1k m=1
R8 net4 net5 1k m=1

R9 net13 net5 2k m=1
R10 net12 net16 2k m=1
R11 net11 net17 2k m=1
R12 net10 net18 2k m=1

R13 net15 net19 2k m=1
R14 net14 net20 2k m=1

R15 net5 net16 1k m=1
R16 net16 net17 1k m=1
R17 net17 net18 1k m=1
R18 net18 net19 1k m=1
R19 net19 net20 1k m=1
R20 net20 GND 2k m=1


V_D0 net5 GND PULSE(0 0.7 0 1n 1n 1u 2u);


V_D1 net6 GND PULSE(0 0.7 0 1n 1n 2u 4u);

V_D2 net7 GND PULSE(0 0.7 0 1n 1n 4u 8u);


V_D3 net8 GND PULSE(0 0.7 0 1n 1n 8u 16u);


**.ends

* expanding   symbol:  opamp.sym # of pins=4
** sym_path: /home/aman/asap_7nm_Xschem/opamp.sym
** sch_path: /home/aman/asap_7nm_Xschem/opamp.sch
.subckt opamp VDD VOUT VIN2 VIN1
*.ipin VIN1
*.opin VOUT
*.iopin VDD
*.ipin VIN2
Xnfet1 net1 VIN1 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xpfet1 net2 net1 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xpfet2 net1 net1 VDD net7 asap_7nm_pfet l=7e-009 nfin=14
Xnfet2 net2 VIN2 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xnfet3 net3 net4 GND net8 asap_7nm_nfet l=7e-009 nfin=14
Xnfet4 net4 net4 GND net5 asap_7nm_nfet l=7e-009 nfin=14
Xpfet3 VOUT net2 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xnfet5 VOUT net4 GND net6 asap_7nm_nfet l=7e-009 nfin=14
C1 VOUT GND 2p m=1
C2 VOUT net2 100f m=1
I0 VDD net4 20u

.ends

.GLOBAL GND
**** begin user architecture code

.subckt asap_7nm_pfet S G D B l=7e-009 nfin=14
	npmos_finfet S G D B BSIMCMG_osdi_P l=7e-009 nfin=14
.ends asap_7nm_pfet



* Run transient analysis
.TRAN 0.1u 32u ;

.control
run
plot (V(VOUT)+4) V(net5) (V(net6)+1) (V(net7)+2) (V(net8)+3);
.endc



.model BSIMCMG_osdi_P BSIMCMG_va (
+ TYPE = 0

************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 3e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.9278          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2.5e-009       dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.8e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.003469        cdscd   = 0.001486        dvt0    = 0.05
+dvt1    = 0.36            phin    = 0.05            eta0    = 0.094           dsub    = 0.24
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 0
+etaqm   = 0.54            qm0     = 2.183e-012      pqm     = 0.66            u0      = 0.0237
+etamob  = 4               up      = 0               ua      = 1.133           eu      = 0.05
+ud      = 0.0105          ucs     = 0.2672          rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 60000           deltavsat= 0.17            ksativ  = 1.592
+mexp    = 2.491           ptwg    = 25              pclm    = 0.01            pclmg   = 1
+pdibl1  = 800             pdibl2  = 0.005704        drout   = 4.97            pvag    = 200
+fpitch  = 2.7e-008        rth0    = 0.15            cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 0               lcdscdr = 0               lrdsw   = 1.3             lvsat   = 1441
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.007           bigc    = 0.0015          cigc    = 1               dlcigs  = 5e-009
+dlcigd  = 5e-009          aigs    = 0.006           aigd    = 0.006           bigs    = 0.001944
+bigd    = 0.001944        cigs    = 1               cigd    = 1               poxedge = 1.152
+agidl   = 2e-012          agisl   = 2e-012          bgidl   = 1.5e+008        bgisl   = 1.5e+008
+egidl   = 1.142           egisl   = 1.142
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -1.2            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc



.subckt asap_7nm_nfet S G D B l=7e-009 nfin=14
	nnmos_finfet S G D B BSIMCMG_osdi_N l=7e-009 nfin=14
.ends asap_7nm_nfet

.model BSIMCMG_osdi_N BSIMCMG_va (
+ TYPE = 1
************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 1e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.2466          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2e-009         dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.80e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.01            cdscd   = 0.01            dvt0    = 0.05
+dvt1    = 0.47            phin    = 0.05            eta0    = 0.07            dsub    = 0.35
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 2.5
+etaqm   = 0.54            qm0     = 0.001           pqm     = 0.66            u0      = 0.0303
+etamob  = 2               up      = 0               ua      = 0.55            eu      = 1.2
+ud      = 0               ucs     = 1               rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 70000           deltavsat= 0.2             ksativ  = 2
+mexp    = 4               ptwg    = 30              pclm    = 0.05            pclmg   = 0
+pdibl1  = 0               pdibl2  = 0.002           drout   = 1               pvag    = 0
+fpitch  = 2.7e-008        rth0    = 0.225           cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 5e-005          lcdscdr = 5e-005          lrdsw   = 0.2             lvsat   = 0
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.014           bigc    = 0.005           cigc    = 0.25            dlcigs  = 1e-009
+dlcigd  = 1e-009          aigs    = 0.0115          aigd    = 0.0115          bigs    = 0.00332
+bigd    = 0.00332         cigs    = 0.35            cigd    = 0.35            poxedge = 1.1
+agidl   = 1e-012          agisl   = 1e-012          bgidl   = 10000000        bgisl   = 10000000
+egidl   = 0.35            egisl   = 0.35
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -0.7            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc


**** end user architecture code
.end

```

<details>

#### *Simulated waveform:*
![Screenshot from 2024-10-14 21-34-45](https://github.com/user-attachments/assets/4c5274e7-f1da-407c-a509-aeacfbdf0d07)



### 3) 10-bit R2R DAC:

#### *Schematic:*

![Screenshot from 2024-10-19 13-24-08](https://github.com/user-attachments/assets/49b2e332-1afe-46ac-8f96-5986c38d3f02)


#### *Generated Netlist of 10-bit R2R DAC:*

<details>
  <summary>Click to expand the Generated Netlist of 10-bit R2R DAC section</summary>

```

** sch_path: /home/aman/asap_7nm_Xschem/r2r.sch
**.subckt r2r VOUT
*.iopin VOUT
x1 VDD VOUT net1 VOUT opamp
VDD VDD GND 0.7
R1 net9 net1 2k m=1
R2 net8 net2 2k m=1
R3 net7 net3 2k m=1
R4 net6 net4 2k m=1
R5 net1 net2 1k m=1
R6 net2 net3 1k m=1
R7 net3 net4 1k m=1
R8 net4 net5 1k m=1

R9 net13 net5 2k m=1
R10 net12 net16 2k m=1
R11 net11 net17 2k m=1
R12 net10 net18 2k m=1

R13 net15 net19 2k m=1
R14 net14 net20 2k m=1

R15 net5 net16 1k m=1
R16 net16 net17 1k m=1
R17 net17 net18 1k m=1
R18 net18 net19 1k m=1
R19 net19 net20 1k m=1
R20 net20 GND 2k m=1

V_D0 net9 GND PULSE(0 0.7 0 1n 1n 512u 1024u);

V_D1 net8 GND PULSE(0 0.7 0 1n 1n 256u 512u);

V_D2 net7 GND PULSE(0 0.7 0 1n 1n 128u 256u);

V_D3 net6 GND PULSE(0 0.7 0 1n 1n 64u 128u);

V_D4 net13 GND PULSE(0 0.7 0 1n 1n 32u 64u);

V_D5 net12 GND PULSE(0 0.7 0 1n 1n 16u 32u);

V_D6 net11 GND PULSE(0 0.7 0 1n 1n 8u 16u);

V_D7 net10 GND PULSE(0 0.7 0 1n 1n 4u 8u);

V_D8 net15 GND PULSE(0 0.7 0 1n 1n 2u 4u);

V_D9 net14 GND PULSE(0 0.7 0 1n 1n 1u 2u);

**.ends

* expanding   symbol:  opamp.sym # of pins=4
** sym_path: /home/aman/asap_7nm_Xschem/opamp.sym
** sch_path: /home/aman/asap_7nm_Xschem/opamp.sch
.subckt opamp VDD VOUT VIN2 VIN1
*.ipin VIN1
*.opin VOUT
*.iopin VDD
*.ipin VIN2
Xnfet1 net1 VIN1 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xpfet1 net2 net1 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xpfet2 net1 net1 VDD net7 asap_7nm_pfet l=7e-009 nfin=14
Xnfet2 net2 VIN2 net3 GND asap_7nm_nfet l=7e-009 nfin=14
Xnfet3 net3 net4 GND net8 asap_7nm_nfet l=7e-009 nfin=14
Xnfet4 net4 net4 GND net5 asap_7nm_nfet l=7e-009 nfin=14
Xpfet3 VOUT net2 VDD VDD asap_7nm_pfet l=7e-009 nfin=14
Xnfet5 VOUT net4 GND net6 asap_7nm_nfet l=7e-009 nfin=14
C1 VOUT GND 2p m=1
C2 VOUT net2 100f m=1
I0 VDD net4 20u

.ends

.GLOBAL GND
**** begin user architecture code

.subckt asap_7nm_pfet S G D B l=7e-009 nfin=14
	npmos_finfet S G D B BSIMCMG_osdi_P l=7e-009 nfin=14
.ends asap_7nm_pfet





.TRAN 1u 1024u;


.control
run


* Measure the current through VDD
meas tran I_VDD avg i(VDD) from=0 to=1024u

* Instead of using param in measure, print the current and manually calculate the power
print I_VDD


plot V(VOUT) ;

*(V(net9)+9) (V(net8)+8) (V(net7)+7) (V(net6)+6) (V(net13)+5) (V(net12)+4) (V(net11)+3) (V(net10)+2) (V(net15)+1) V(net14)

.endc





.model BSIMCMG_osdi_P BSIMCMG_va (
+ TYPE = 0

************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 3e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.9278          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2.5e-009       dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.8e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.003469        cdscd   = 0.001486        dvt0    = 0.05
+dvt1    = 0.36            phin    = 0.05            eta0    = 0.094           dsub    = 0.24
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 0
+etaqm   = 0.54            qm0     = 2.183e-012      pqm     = 0.66            u0      = 0.0237
+etamob  = 4               up      = 0               ua      = 1.133           eu      = 0.05
+ud      = 0.0105          ucs     = 0.2672          rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 60000           deltavsat= 0.17            ksativ  = 1.592
+mexp    = 2.491           ptwg    = 25              pclm    = 0.01            pclmg   = 1
+pdibl1  = 800             pdibl2  = 0.005704        drout   = 4.97            pvag    = 200
+fpitch  = 2.7e-008        rth0    = 0.15            cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 0               lcdscdr = 0               lrdsw   = 1.3             lvsat   = 1441
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.007           bigc    = 0.0015          cigc    = 1               dlcigs  = 5e-009
+dlcigd  = 5e-009          aigs    = 0.006           aigd    = 0.006           bigs    = 0.001944
+bigd    = 0.001944        cigs    = 1               cigd    = 1               poxedge = 1.152
+agidl   = 2e-012          agisl   = 2e-012          bgidl   = 1.5e+008        bgisl   = 1.5e+008
+egidl   = 1.142           egisl   = 1.142
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -1.2            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc



.subckt asap_7nm_nfet S G D B l=7e-009 nfin=14
	nnmos_finfet S G D B BSIMCMG_osdi_N l=7e-009 nfin=14
.ends asap_7nm_nfet

.model BSIMCMG_osdi_N BSIMCMG_va (
+ TYPE = 1
************************************************************
*                         general                          *
************************************************************
+version = 107             bulkmod = 1               igcmod  = 1               igbmod  = 0
+gidlmod = 1               iimod   = 0               geomod  = 1               rdsmod  = 0
+rgatemod= 0               rgeomod = 0               shmod   = 0               nqsmod  = 0
+coremod = 0               cgeomod = 0               capmod  = 0               tnom    = 25
+eot     = 1e-009          eotbox  = 1.4e-007        eotacc  = 1e-010          tfin    = 6.5e-009
+toxp    = 2.1e-009        nbody   = 1e+022          phig    = 4.2466          epsrox  = 3.9
+epsrsub = 11.9            easub   = 4.05            ni0sub  = 1.1e+016        bg0sub  = 1.17
+nc0sub  = 2.86e+025       nsd     = 2e+026          ngate   = 0               nseg    = 5
+l       = 2.1e-008        xl      = 1e-009          lint    = -2e-009         dlc     = 0
+dlbin   = 0               hfin    = 3.2e-008        deltaw  = 0               deltawcv= 0
+sdterm  = 0               epsrsp  = 3.9             nfin    = 1
+toxg    = 1.80e-009
************************************************************
*                            dc                            *
************************************************************
+cit     = 0               cdsc    = 0.01            cdscd   = 0.01            dvt0    = 0.05
+dvt1    = 0.47            phin    = 0.05            eta0    = 0.07            dsub    = 0.35
+k1rsce  = 0               lpe0    = 0               dvtshift= 0               qmfactor= 2.5
+etaqm   = 0.54            qm0     = 0.001           pqm     = 0.66            u0      = 0.0303
+etamob  = 2               up      = 0               ua      = 0.55            eu      = 1.2
+ud      = 0               ucs     = 1               rdswmin = 0               rdsw    = 200
+wr      = 1               rswmin  = 0               rdwmin  = 0               rshs    = 0
+rshd    = 0               vsat    = 70000           deltavsat= 0.2             ksativ  = 2
+mexp    = 4               ptwg    = 30              pclm    = 0.05            pclmg   = 0
+pdibl1  = 0               pdibl2  = 0.002           drout   = 1               pvag    = 0
+fpitch  = 2.7e-008        rth0    = 0.225           cth0    = 1.243e-006      wth0    = 2.6e-007
+lcdscd  = 5e-005          lcdscdr = 5e-005          lrdsw   = 0.2             lvsat   = 0
************************************************************
*                         leakage                          *
************************************************************
+aigc    = 0.014           bigc    = 0.005           cigc    = 0.25            dlcigs  = 1e-009
+dlcigd  = 1e-009          aigs    = 0.0115          aigd    = 0.0115          bigs    = 0.00332
+bigd    = 0.00332         cigs    = 0.35            cigd    = 0.35            poxedge = 1.1
+agidl   = 1e-012          agisl   = 1e-012          bgidl   = 10000000        bgisl   = 10000000
+egidl   = 0.35            egisl   = 0.35
************************************************************
*                            rf                            *
************************************************************
************************************************************
*                         junction                         *
************************************************************
************************************************************
*                       capacitance                        *
************************************************************
+cfs     = 0               cfd     = 0               cgso    = 1.6e-010        cgdo    = 1.6e-010
+cgsl    = 0               cgdl    = 0               ckappas = 0.6             ckappad = 0.6
+cgbo    = 0               cgbl    = 0
************************************************************
*                       temperature                        *
************************************************************
+tbgasub = 0.000473        tbgbsub = 636             kt1     = 0               kt1l    = 0
+ute     = -0.7            utl     = 0               ua1     = 0.001032        ud1     = 0
+ucste   = -0.004775       at      = 0.001           ptwgt   = 0.004           tmexp   = 0
+prt     = 0               tgidl   = -0.007          igt     = 2.5
************************************************************
*                          noise                           *
************************************************************
**)
.control
pre_osdi /home/aman/asap_7nm_Xschem/bsimcmg.osdi
.endc


**** end user architecture code
.end

```
</details>


#### *Simulated waveform*
![Screenshot from 2024-10-15 00-39-41](https://github.com/user-attachments/assets/8426bb28-919b-467e-bc2f-6941197fb819)






## Design Characterization:

- The 10-bit R-2R DAC is characterized in the table below:


| Serial Number | Parameter   | Description                        | Value    | Unit  |
|---------------|-------------|------------------------------------|----------|-------|
| 1             | TECH          | Technology  | FinFET        | -    |
| 2             | NODE          | Process Node  | 7        | nm    |
| 3             | RES    | Resolution| 10        | bit   |
| 4             | TEMP       | Operating Temperature  | 27      | °C    |
| 5             | TNOM     | Nominal Temperature    | 27      | °C    |
| 6             | VDD         | Supply voltage               | 0.7      | V     |
| 7             | I_VDD       | Average current drawn from VDD     | 6.83e-05 | A     |
| 8             | P_total     | Total power consumption            | 47.83   | μW    |
| 9             | VOUT      | Full-scale output voltage of DAC    | 0.607       | V   |




## Conclusion:
- In this project, I successfully designed and implemented a 10-bit R2R Digital-to-Analog Converter (DAC) using the ASAP7 7nm FinFET PDK. The design integrates an R2R resistor ladder architecture with a CMOS 2-stage operational amplifier (Op-Amp) to achieve accurate and efficient digital-to-analog conversion.
 
- Key performance metrics such as the full-scale output voltage of 0.607V and a total power consumption of 47.83 μW were achieved, demonstrating the efficacy of the design in a 7nm FinFET process. The 10-bit resolution provides a high degree of precision suitable for advanced analog-mixed signal applications. This design showcases the potential of FinFET-based circuits in modern semiconductor technologies, offering a reliable and scalable solution for low-power, high-performance applications.

## References:
- Prasad, S. Rajendra, et al. "An Efficient and Low Power 45nm CMOS Based R-2R DAC." 2023 4th International Conference for Emerging Technology (INCET). IEEE, 2023.
- [avsddac_3v3_sky130_v2 - 10-bit DAC Design Using SKY130 Process](https://github.com/vsdip/avsddac_3v3_sky130_v2#10-bit-dac)
- [DAC Circuits - Analog CMOS Design](https://www.electronics-tutorial.net/Analog-CMOS-Design/Signal-Conditioning/DAC-Circuits/)

## Acknowledgement: 
- Kunal Ghosh, Co-Founder of VLSI System Design (VSD) Corp. Pvt. Ltd.
- Dr. Skandha Deepsita, Physical Design Consultant, VLSI System Design (VSD) Corp. Pvt. Ltd.
- Jossan Eden, Consultant, VLSI System Design (VSD) Corp. Pvt. Ltd.

