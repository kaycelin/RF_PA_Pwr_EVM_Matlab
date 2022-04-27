%% 2022-04-27, PA1

function [y, pwrX]  = dsp_pwr_g(x, pwrY_dBm, flag_dBm)

pwrX_w = (mean(abs(x).^2));

if ~exist('flag_dBm','var')||isempty(flag_dBm)
    flag_dBm = 1;
    pwrY_w = 10.^((pwrY_dBm-30)/10); % Convert dBm to linear Watts
    pwrX = 10*log10(pwrX_w)+30;
else
    flag_dBm = 0;
    pwrY_w = 10.^((pwrY_dBm-0)/10); % Convert dBm to linear Watts
    pwrX = 10*log10(pwrX_w)+0;
end

pwr_gain = pwrY_w/pwrX_w;

y = x*sqrt(pwr_gain);

end