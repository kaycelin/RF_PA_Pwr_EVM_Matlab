# RF_PA_Pwr_EVM_Matlab

# History  
%% 2022-04-25, PA1  
%% 2022-04-25, reference1: https://www.mathworks.com/help/comm/ref/comm.memorylessnonlinearity-system-object.html  
%% 2022-04-25, reference2: https://www.mathworks.com/help/dsp/ref/spectrumanalyzer.html  

# Procdure  
%% load OFDM waveform  

%% Power assignment  
pindBm = [21]; % Input power  

%% Setup spectrum  

%% Settings PA parameters  
pa.gain = 15 % Input gain  
pa.oip3 = 50 % Input oip3  
pa.am2pm = 0.00 % Input am/pm  

%% PA application  

%% EVM comparsion between PA in and PA out  
evm = 6.0921  

%% Plot Result  
- spectrum  
![image](https://user-images.githubusercontent.com/87049112/165516480-ef1c29ef-22fe-4d52-9962-002915da8bf8.png)  
![image](https://user-images.githubusercontent.com/87049112/165516559-c4e469ad-0852-4be0-83cf-ab6878bc19e0.png)  

- CCDF  
![image](https://user-images.githubusercontent.com/87049112/165516679-e3649db3-ff03-49b9-878a-c06d97d6ea5e.png)

