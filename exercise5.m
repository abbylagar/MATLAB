%% chirp signal spectrogram
t = 0:1/1e3:2; %set the time variable
y = chirp(t,100,1,300); 
sound(y,Fs)
%specgram(y)

 s = spectrogram(y); 
 spectrogram(y,'yaxis')
 
 
 %% Denoising signal using fft
 % Thresholding
x=cos(2*pi*200*[1:1000]/1000)+2*cos(2*pi*300*[1:1000]/1000)+.5*randn(1,1000); %create the signal
X=fft(x); %apply DFT on the signal
F=linspace(0,1000,length(x)); %create x-axis for plotting the spectrum
%plot(F,abs(X)./length(x)*2); %plot the magnitude spectrum
i = find(abs(X) < 100); %use 100 as threshold
X(i) = zeros(size(i));
xr = ifft(X);
plot([0:999]/1000,xr); %plot the magnitude spectrum
plot(xr(1:100))
