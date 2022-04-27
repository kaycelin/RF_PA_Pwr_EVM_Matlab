function [evm] = dsp_evm_g(ref, mea)
% Signals must be synchronized
ref=ref(:);
row_ref = size(ref,1);
col_ref = size(ref,2);
mea=reshape(mea,row_ref,col_ref);
mea_rms = dsp_rms_g(mea);
ref_rms = dsp_rms_g(ref);
e = mea/mea_rms-ref/ref_rms;
% dsp_rms_g(e)
% dsp_rms_g(ref_time_sync)
% evm = 100*dsp_rms_g(e)/dsp_rms_g(ref_time_sync)
evm = 100*dsp_rms_g(e);
end

function rms = dsp_rms_g(x)
rms = sqrt(mean(abs(x).^2));
end

