# OMAE_2022
Computer simulation model used in the preparation of the manuscript "Offshore Wind Farms and Isolated Oil and Gas Platforms: Perspectives and Possibilities" submitted to the ASME 41st International Conference on Ocean, Offshore & Arctic Engineering (OMAE 2022).

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
