% Correlation Analyzer
% Input: *Matrix of time windows, frquencies, window size in time and samples
% Output: *correlation analysis in desired frequencies
function corr_mat = corrAnalyze(theory, time_wind, samp_wind, samp_mat)
    sines = sin(2*pi*theory.*linspace(0,time_wind,samp_wind)');
    cosines = cos(2*pi*theory.*linspace(0,time_wind,samp_wind)');
    
    corr_sin = zeros(7,size(samp_mat,2));
    corr_cos = corr_sin;
    for j = 1:7
        for k = 1:size(samp_mat,2)
            corr_sin(j,k) = corr(sines(:,j),samp_mat(:,k));
            corr_cos(j,k) = corr(cosines(:,j),samp_mat(:,k));
        end
    end
    corr_mat = abs(corr_sin)+abs(corr_cos);
    corr_mat(isnan(corr_mat)) = 0;
    corr_mat = corr_mat/max(corr_mat,[],"all");
end