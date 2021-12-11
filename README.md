# OMAE_2022
Computer simulation model used in the preparation of the manuscript "Offshore Wind Farms and Isolated Oil and Gas Platforms: Perspectives and Possibilities" submitted to the ASME 41st International Conference on Ocean, Offshore & Arctic Engineering (OMAE 2022).

## PowerFactory files
DIgSILENT PowerFactory 2020 SP2a (x64) Build 20.0.4.1 (10037) / Rev. 73397

Model: 20201211_OMAE_BaseModel.pfd

### Cases
  - Case 1: ESS is connected but does not contribute.
  - Case 2: ESS is connected and contribute with primary reserves (a slow and small secondary resposnse is tuned in the controller).
  - Case 3: ESS is connected and contribute wiht primary and inertial reserves (a slow and small secondary response is tuned in the controller).
  - Case 4: same as case 3, but the feed-forward of current for the DC voltage controller is not active. This case did not receive a special name in the paper, it was still called case 3.

### Struture of \*_ESS.csv
to be done

### Struture of \*_PCC.csv
to be done

### Struture of \*_Freq.csv
to be done

## Matlab files
MATLAB R2018a Udpate 6 (9.4.0.949201) 64-bit (win64)

Simulink model: SimpleMass.slx

Simple model of the swing equation of a machine without damping windings. 
It uses the script: SimpleRotatinMass_script.m
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

Be careful with the raw data files and the cases in the script. Case 1 if for high inertia, but the raw file was called "two" because it was as if there were two generator units in the system. The opposite happend with case 2, which is linked to the raw file "one". 
