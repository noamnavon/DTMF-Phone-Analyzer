% Frequencies Analyzer
% Input: *interval *reshaped signal *sampling frequency
% Output: *Frequency presence
function freqs_proj = freqAnalyze(time_wind,samp_wind,samp_mat,fs)
    theory = [697 770 852 941 1209 1336 1477];
    corr_mat = corrAnalyze(theory, time_wind, samp_wind, samp_mat);
    subplot(2,6,3)
    stem(corr_mat')
    title('Correlator')
    xlabel('Time Section')
    ylabel('Corr - Norm')
    
    fourier_amp = fourAnalyze(fs, time_wind, samp_mat, theory);
    subplot(2,6,4)
    stem(fourier_amp')
    title('Fourier')
    xlabel('Time Section')
    ylabel('Fourier - Norm')
    
    freqs_proj = fourier_amp.*corr_mat;
    freqs_proj = freqs_proj/max(freqs_proj,[],"all");
    subplot(2,6,9)
    stem(freqs_proj')
    title('Correlator x Fourier')
    xlabel('Time Section')
    ylabel('Corr x Fourier')
end