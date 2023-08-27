% Sound to Number Converter
% Input: *signal *sampling frequency
% Dispay Phone NUmber
function Sound2Number(signal,fs)
    signal = sigNorm(signal);
    sound(signal,fs)

    time_wind = 0.1;
    samp_wind = time_wind*fs;
    signal = [signal; zeros(samp_wind-mod(length(signal),samp_wind),1)];
    samp_mat = reshape(signal,samp_wind,[]);

    freqs_proj = freqAnalyze(time_wind,samp_wind,samp_mat,fs);
    level = levelDet(freqs_proj);
    pairs = freqs_proj.*(freqs_proj>level);

    hits = pairs~=0;
    hits(:,sum(hits)==1) = 0;
    hits = fixTimeOv(hits);
    subplot(2,6,[5 6 11 12])
    stem((pairs.*hits)')
    title('Analysis Result')
    xlabel(['Time Section of ' num2str(time_wind) ' seconds'])
    ylabel('Frequency Gated Presence')
    hits = hits(:, any(hits ~= 0, 1));
    
    phone = decode_phone(hits);
    dispPhone(phone);
end