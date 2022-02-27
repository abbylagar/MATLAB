
%% DFT of sinusiod
x=cos(2*pi*100*[1:512]/8000); %create the signal
X=fft(x); %apply DFT on the signal
F=linspace(0,8000,length(x)); %create x-axis for plotting the spectrum
plot(F,abs(X)./length(x)*2); %plot the magnitude spectrum
title("x=cos(2*pi*100*[1:512]/8000)")
xlabel("frequency(Hz)")
ylabel("magnitude")
%symmetry location
%freqsymm = F(257); %4007.8 ~ 4Khz

%% Additive Noise
x=cos(2*pi*100*[1:1000]/1000)+2*cos(2*pi*105*[1:1000]/1000)...
+randn(1,1000); %create the signal
X=fft(x); %apply DFT on the signal
F=linspace(0,1000,length(x)); %create x-axis for plotting the spectrum
plot(F,abs(X)./length(x)*2); %plot the magnitude spectrum
title("𝑥(𝑡) = cos(2𝜋100𝑡) + 2 cos(2𝜋105𝑡) + 𝑛(𝑡)")
xlabel("frequency(Hz)")
ylabel("magnitude")

