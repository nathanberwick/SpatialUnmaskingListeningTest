%% Program to generate power spectrum matched noise. This is primarily
%% intended for audiologists to generate their own speech shaped noises
%% based on existing speech Corpus.
%% The input can be any number of wav files. The program derives the
%% fourier transform of all the speech files put together. The Fourier
%% transform thus obtained is then manipulated such that the phases of the
%% spectral components are randomised. The resultant modified fourier
%% output is then converted back into the time domain using an inverse
%% fourier transform. The resultant is a speech shaped noise with spectrum
%% almost identical to that of the original speech corpus
clear all;
[files,path] = uigetfile('*.wav', 'Select the speech files', 'MultiSelect', 'on'); % Selectin all the wave files to be included in the analysis
[row,col] = size(files); %Determining the number of wave files loaded
fileID = fopen( 'filenames.txt', 'wt' );

if iscell(files) %for many audio files
    for i = 1:col
        [data,fs] = audioread([path,char(files(i))]);% reading the data file
        noise = generateSpeechNoise(data);
        [filepath, name, ext] = fileparts(char(files(i)));
        audiowrite( [name, '_noise.wav'], noise, fs);
        fprintf(fileID, '%i, %s;\n', i-1, name);
    end
else %if only one audio file passed.
    [data, fs] = audioread([path, files]);
    noise = generateSpeechNoise(data);
    [filepath, name, ext] = fileparts(files);
    audiowrite([name, '_noise.wav'], noise, fs);
end

fclose(fileID);
