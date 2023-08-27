% Fourier Analyzer
% Input: *Matrix of time windows, frquencies, window size in time, sampling frequency
% Output: *Fourier transform of the signal in desired frequencies
function fourier_amp = fourAnalyze(fs, time_wind, samp_mat, theory)
    t = 0:1/fs:time_wind-1/fs;
    fourier_amp = zeros(7,size(samp_mat,2));
    for f = 1:7
        fourier_amp(f,:) = abs(trapz(samp_mat.*exp(-1i*2*pi*(theory(f))*t')));
    end
    fourier_amp = fourier_amp/max(fourier_amp,[],"all");
end