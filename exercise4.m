%% Design a Type 1 Chebyshev IIR highpass filter. The specifications of the highpass
% filters are as follows: passband edge at 700 Hz, stopband edge at 500 Hz, passband ripple
% of 1 dB, minimum stopband attenuation of 32 dB, and sampling frequency of 2000 Hz.
Wp=700/1000; 
Ws= 500/1000; 
Rp=1 ;%db
Rs= 32; %db

[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs) ;
[b,a] = cheby1(n,Rp,Wp,"high");

freqz(b,a,512) 
title('n = 4 Chebyshev Type I Highpass Filter')

%  magnitude only 
% [h,w] = freqz(b,a);
% plot(w/pi,20*log10(abs(h)))
% xlabel('Normalized Frequency (\times\pi rad/sample)')
% ylabel('Magnitude (dB)')

%% Challenge
%  
% a)	Generate the corresponding DTMF signal, i.e. create 2 sinusoids with frequencies
% xxx Hz and xxx Hz then get their sum. Assume Fs=8 kHz.
% b)	Verify the signal by displaying its spectrum.
% c)	Design two IIR filters to separate the two frequency components of the signal.
% d)	Verify the IIR designs by filtering the signal. Use the function filter(B,A,x), where
% B and A are vectors of filter coefficients in the numerator and denominator
% respectively, and x is the signal to be filtered.
% e)	Display the two spectra of the filtered signals. 

%a create the signal
fs = 8000; %sampling freq
freq1 = 752; %frequency 1
time = (0:7999)/8000; %time
signal1=sin(2*pi*freq1.*time); %create the signal
x=signal1; %add the signals

%plot the signal
 plot(x)
 xlim([0 500])
%% b) Display spectrum of the signal

X=fft(x); %get fft
n = length(x);
f = (0:n-1)*(fs/n);     %frequency range
%use fftshift
Y = fftshift(X); % use fftshift shift zero component to center of spectrum
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
plot(fshift,abs(Y)./length(x))
xlabel("frequency(Hz)")
ylabel("magnitude")

%% c)Design two IIR filters to separate the two frequency components of the signal.

%use elliptic filter
Wp=950/4000; 
Ws= 1100/4000; 
Rp=1 ;%db
Rs= 40; %db

[n1,Wp1] = ellipord(Wp,Ws,Rp,Rs); % Gives mimimum order of filter
[b1,a1] = ellip(n1,Rp,Rs,Wp1);
freqz(b1,a1,512) 
title("Elliptic Lowpass Filter")

%% step d and e. 
%use filter function and display fft

%filtering the 852Hz signal

%use filter function 
y1= filter(b1,a1,x);

%created function to display the spectrum after using filter function 
getspectrum("Spectrum after using the Lowpass Filter",y1,8000)





%% Challenge
%  

%a create the signal
fs = 8000; %sampling freq
freq1 = 752; %frequency 1
freq2 = 1500;
time = (0:7999)/8000; %time
signal1=sin(2*pi*freq1.*time); %create the signal
signal2=1.2*cos(2*pi*freq2.*time); %create the signal
noise = rand(1,8000);
x=signal1+signal2; %add the signals

%plot the signal
 plot(x)
 xlim([0 500])
%% b) Display spectrum of the signal

X=fft(x); %get fft
n = length(x);
f = (0:n-1)*(fs/n);     %frequency range
%use fftshift
Y = fftshift(X); % use fftshift shift zero component to center of spectrum
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
plot(fshift,abs(Y)./length(x))
xlabel("frequency(Hz)")
ylabel("magnitude")

%% c)Design two IIR filters to separate the two frequency components of the signal.

%use elliptic filter
Wp=950/4000; 
Ws= 1100/4000; 
Rp=1 ;%db
Rs= 40; %db

[n1,Wp1] = ellipord(Wp,Ws,Rp,Rs); % Gives mimimum order of filter
[b1,a1] = ellip(n1,Rp,Rs,Wp1);
freqz(b1,a1,512) 
title("Elliptic Lowpass Filter")

%% step d and e. 
%use filter function and display fft

%filtering the 852Hz signal

%use filter function 
y1= filter(b1,a1,x);

%created function to display the spectrum after using filter function 
getspectrum("Spectrum after using the Lowpass Filter",y1,8000)


%% 
function getspectrum(label,x,fs)
% display spectrum
%label - title of plot
%x - signal 
%fs - sampling frequency used

    X=fft(x); %get fft
    n = length(x);
    f = (0:n-1)*(fs/n);     %frequency range
    %use fftshift
    Y = fftshift(X); % use fftshift shift zero component to center of spectrum
    fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
    plot(fshift,abs(Y)./length(x))
    title(label)
    xlabel("frequency(Hz)")
    ylabel("magnitude")
end
