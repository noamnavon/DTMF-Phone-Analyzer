function main()
    clear sound

    [signal, fs] = audioread(chooseFile);
    disp(['Original signal:','length = ', num2str(length(signal)), '[samples], sampling frequency = ', num2str(fs),'[Hz]']);

    Sound2Number(signal,fs);
end