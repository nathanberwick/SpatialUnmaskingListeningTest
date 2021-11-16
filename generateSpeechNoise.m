function output = generateSpeechNoise(input)
        input  = 0.999 * input / max(abs(input)); % Normalizing the amplitudes 
        spec   = abs(fft(input)).*exp(j*2*pi*rand(size(input))); % Applying the fourier transform and randomizing the phases of all the spectral components
        output = real(ifft(spec)); % Obatining the real parts of the IFFT
        output = 0.999 * output / max(abs(output)); %Normalizing the speech noise amplitude for wavwrite