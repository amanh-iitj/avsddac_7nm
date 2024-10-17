# Design and Implementation of a 10-bit R-2R DAC Using 7nm FinFET Technology with Open-Source Tools

## Table of Contents
- ASAP 7nm PDK
- Design Specifications
- Project Overview
- Simulations and Results
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

#### Circuit diagram of 10-bit R-2R DAC:
 
![Fig2-DAC-Circuits](https://github.com/user-attachments/assets/741c69af-22da-4b54-8807-35c5f4e62fab)








## Simulations and Results:

### 1) Op-Amp:

![opamp_op](https://github.com/user-attachments/assets/bcb113a6-a379-4529-bcd3-5bdd5ec140ef)

- From the above waveform, Gain of the Op-Amp = 3.355.

### 2) 4-bit R2R DAC:

![Screenshot from 2024-10-14 21-34-45](https://github.com/user-attachments/assets/4c5274e7-f1da-407c-a509-aeacfbdf0d07)



### 3) 10-bit R2R DAC:

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
| 6             | VDD         | Power supply voltage               | 0.7      | V     |
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
- Dr. Skandha Deepsita, Teaching Assistant, VLSI System Design (VSD) Corp. Pvt. Ltd.

