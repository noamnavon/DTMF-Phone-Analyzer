% Gate Level Determination
% Input: *Presence of frequencies
% Output: *level of threshold based on input
function level = levelDet(freqs_proj)
    noise_mean = mean(freqs_proj,"all","omitnan");
    level = 2.1*noise_mean;
    
    while level~=1
        peaks = freqs_proj>level;
        if any(sum(peaks)>2)
            level = level + 0.01;
            continue;
        end

        if any(sum(peaks(1:4,:)) > 1) || any(sum(peaks(5:7,:)) > 1)
            level = level + 0.01;
            continue;
        end
        break
    end
    subplot(2,6,10)
    stem(freqs_proj')
    yline(level, "Label","Gate")
    title('Gate Suggestion')
    xlabel('Time Section')
    ylabel('Corr x Fourier')
end