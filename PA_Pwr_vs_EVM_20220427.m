%% 2022-04-25, PA1
%% 2022-04-25, reference1: https://www.mathworks.com/help/comm/ref/comm.memorylessnonlinearity-system-object.html
%% 2022-04-25, reference2: https://www.mathworks.com/help/dsp/ref/spectrumanalyzer.html

%% load OFDM waveform
fnum = 0425
load('waveform_OFDM_20MHz_122p88MHz.mat')
x = signal;
fs = 122.88e6
Nsamps = numel(signal)
% PLOT_FFT_dB_g(x, fs, Nsamps, ['x'], 'df', 'full', 'pwr', [fnum]);
[PAR_x] = CCDF_g(x, Nsamps, fnum+1, 'x')

%% Power assignment
PdBm_x = 10*log10(mean(abs(x).^2))+30

pindBm = [21]; % Input power
[x2, PdBm_x] = dsp_pwr_g(x, pindBm);
PdBm_x2 = 10*log10(mean(abs(x2).^2))+30

%% Settings PA parameters
pa.gain = 15 % Input gain
pa.oip3 = 50 % Input oip3
pa.am2pm = 0.00 % Input am/pm
pa.model = "Cubic polynomial" % model of am/am and am/pm

PA = comm.MemorylessNonlinearity("Method",pa.model, ...
    "LinearGain",pa.gain,"AMPMConversion",pa.am2pm,"TOISpecification",'OIP3',...
    "OIP3",pa.oip3);

figure(fnum+2)
plot(PA)

%% Setup spectrum
if 1
    sa.SampleRate = fs
    sa.SpectrumType = 'Power'
    sa.RBW = fs/Nsamps;
    scope = dsp.SpectrumAnalyzer('SampleRate',sa.SampleRate,'SpectrumType',sa.SpectrumType)
    scope(x);
end

%% PA application
y = PA(x2);
scope(y);
[PAR_y] = CCDF_g(y, Nsamps, fnum+1, 'y')

%% EVM comparsion between PA in and PA out
evm = dsp_evm_g(x, y)




