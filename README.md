# OMAE_2022
Computer simulation model used in the preparation of the manuscript "Offshore Wind Farms and Isolated Oil and Gas Platforms: Perspectives and Possibilities" submitted to the ASME 41st International Conference on Ocean, Offshore & Arctic Engineering (OMAE 2022).

## PowerFactory files
DIgSILENT PowerFactory 2020 SP2a (x64) Build 20.0.4.1 (10037) / Rev. 73397

Model: 20201211_OMAE_BaseModel.pfd

### Cases
  - Case 1: ESS is connected but does not contribute.
  - Case 2: ESS is connected and contribute with primary reserves (a slow and small secondary resposnse is tuned in the controller).
  - Case 3: ESS is connected and contribute wiht primary and inertial reserves (a slow and small secondary response is tuned in the controller).
  - Case 4: same as case 3, but the DC voltage controller current feed-forward is not active. This case did not receive a special name in the paper, it was still called case 3.

### Raw data files
  - aaaammdd_Case_0\*_ESS.csv: ESS related measurements
  - aaaammdd_Case_0\*_PCC.csv: Measurements at the PCC, but also at the wind turbines
  - aaaammdd_Case_0\*_Freq.csv: Frequencies and speeds on the system

#### Structure of \*_ESS.csv
  - time in seconds
  - Vmesa_ESS_690V: voltage in pu of 690V
  - ESS_GC: total power leaving the ac terminals of GC in MW
  - PQ_Meas_BCs_CurrentSource: power arriving at the capacitor from ESDs in MW 
  - ESS_GC: DC voltage in pu of 1200V 
  - ESS_GC: DC current at terminals in pu of 8.333kA
  - BC_DCLinkSide: DC current at the DC link side from the BC in pu of 3.5kA
  - FC_DCLinkSide: DC current at the DC link side from the FCC  in pu of 5kA

#### Structure of \*_PCC.csv
  - time in seconds
  - GG_01: speed in pu
  - GG_02: speed in pu
  - PQ_Meas_GG01_11kV: active power in MW
  - PQ_Meas_GG02_11kV: active power in MW
  - PQ_Meas_RL01_11kV: active power in MW 
  - PQ_Meas_RL02_11kV: active power in MW 
  - PQ_Meas_WF_11kV: active power in pu in MW  
  - PQ_Meas_ESS_TR_11kV: active power in MW  
  - PQ_Meas_LV_Load_11kV: active power in MW  
  - PQ_Meas_WT1_33kV: active power in MW  
  - PQ_Meas_WT2_33kV: active power in MW  
  - PQ_Meas_WT3_33kV: active power in MW  
  - GG_01: voltage in pu of 11kV

#### Structure of \*_Freq.csv
  - time in seconds
  - ESS 690V PLL Type 1 Model 3: frequency in pu
  - PLL_WT1_690V_G: frequency in pu
  - PLL_WT2_690V_G: frequency in pu
  - PLL_WT3_690V_G: frequency in pu
  - GG_01: mechanical speed in pu
  - GG_02: mechanical speed in pu

## Matlab files
MATLAB R2018a Udpate 6 (9.4.0.949201) 64-bit (win64)

Simulink model: SimpleMass.slx

Script: SimpleRotatinMass_script.m

Simple model of the swing equation of a machine without damping windings. 
It was used for obtaining the data for the figures:

  - Figure: phases of the frequency control, just the frequency
    - Case in script: 3
      - Basic info: H=5s (lower inertia), longer time for the secondary to start
      - Raw data file: SimpleMass_One_SlowerSec_Raw.txt
    
  - Figure: roles of inertia and governor in the phases of the frequency control
    - Case in script: 1
      - Basic info: H=10s (high inertia), shorter time for the secondary to start
      - Raw data file: SimpleMass_Two_Raw.txt
    - Case in script: 2
      - Basic info: H=5s (low inertia), shorter time for the secondary to start
      - Raw data file: SimpleMass_One_Raw.txt

Be careful with the raw data files and the cases in the script. Case 1 was for high inertia, but the raw file was called "two" because it was as if there were two generator units in the system. The opposite happend with case 2, which was linked to the raw file "one". 
