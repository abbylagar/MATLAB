% Design a Butterworth IIR bandpass filter. The specifications are as follows:
% normalized passband edges at 0.45p and 0.65p, normalized stopband edges at 0.3p and
% 0.75p, passband ripple of 1 dB, and a minimum stopband attenuation of 40 dB.

Wp=[0.45 0.65]; 
Ws= [0.3 0.75]; 
Rp=1 ;%db
Rs= 40; %db

[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn,"bandpass");
[h,w] = freqz(b,a);

% freqz(b,a,512)

plot(w/pi,20*log10(abs(h)))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Gain (dB)')
title("Butterworth Bandpass Filter")
