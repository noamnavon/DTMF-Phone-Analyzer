% Signal Normalizer
% Input: Signal
% Output: Same signal normalized
function signal = sigNorm(signal)
    subplot(2,6,[1 2])
    plot(signal)
    title('Signal')
    xlabel('Sample')
    ylabel('Bits per sample')

    signal = signal/max(abs(signal));
    while nnz(abs(signal)>0.8)<length(signal)/1000
        signal(abs(signal)>0.8) = signal(abs(signal)>0.8)*0.7;
        signal = signal/max(abs(signal));
    end

    subplot(2,6,[7 8])
    plot(signal)
    title('Normalized Signal')
    xlabel('Sample')
    ylabel('Bits per sample - Normalized')
end