[files,path] = uigetfile('*.wav', 'Select the speech files', 'MultiSelect', 'on'); % Selectin all the wave files to be included in the analysis

if iscell(files) %for many audio files
    for i = 1:col
        [data,fs] = audioread([path,char(files(i))]);% reading the data file
        largest(i) = max(abs(data));
    end
    max(largest)
    end