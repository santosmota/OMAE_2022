clearvars;

%%
%caso = 1; %1:  H=10, two units
%caso = 2; %2: H=5, only one unit
caso = 2; %3 H=5, only one unit, longer time for secondary

%%
%saveTextFile = 0; %DO NOT save files
if caso > 0
    saveTextFile = 0; %save files
else
    saveTextFile = 0;
end

%total simulation time
Ttot = 80;

%name of the simulink model
nomemodelo = 'SimpleMass'; 

%Total apparent power
Sn = 2*47e6;
np = 1; %numper of pair of poles, same mechanical and electrical frequencies
Fn = 50; %Hz

%angular frequency
omegan = 2 * pi * Fn / np;

%nominal torque would produce P = Sn
Tn = Sn / omegan;

H = 10; %with both generators
Jtwo = 2 * H * Sn / omegan^2;

if caso > 1
    H = 5; %with only one generator
end
J = 2 * H * Sn / omegan^2;

%Dead time for the gas valve
DeadTimeValve = 0.05;

%Governor
droop = 0.10; %droop
RateSec = 1/20; %maximum rate of secondary control
Tsec = 4; %integrator time of secondary control
Tsec_on_delay = 25; %on-delay to show difference between primary and secondary control 
if caso == 3
    Tsec_on_delay = 40; %with only one generator
end


%First and second time constants of the governor
Tgt1 = 0.1; %representing a fuel system
Tgt2 = 1.5; %the larger time constant

%Initial power level
Peini = 0.26;

%Power step - a large motor start (10% of the nominal power)
Pestep = 0.12;
StepTime = 10;

%%
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(['Simulating for a total time:',num2str(Ttot), ' s']);
simulado = sim(nomemodelo, 'SimulationMode', 'accelerator');
rawdata(:,:) = simulado.get('rawdata');

%%
if saveTextFile == 1 % saving text files
    %Indices %not really necessary, made only for code checking
    Ind = [];
    Ind.time = 1;
    Ind.f = 2;
    Ind.e = 3;
    Ind.pe = 4;
    Ind.pm = 5;
    Ind.pacc = 6;
    Ind.pprim = 7;
    Ind.psec = 8; 
 
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('Saving raw data');
    if caso == 1
        arquivo = fopen('SimpleMass_Two_Raw.txt','w');
    elseif caso == 2 
        arquivo = fopen('SimpleMass_One_Raw.txt','w');
    elseif caso == 3 
       arquivo = fopen('SimpleMass_One_SlowerSec_Raw.txt','w');
    end
    
    for cnt = 1:length(rawdata(:,Ind.time))
        fprintf(arquivo, '%e, %e, %e, %e, %e, %e, %e, %e\n',rawdata(cnt, :));
        disp(['Sample: ',num2str(cnt)]);
    end
    fclose(arquivo);
end    

