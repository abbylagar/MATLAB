%% Window-Based FIR Filter Design
fsamp = 12000; %sampling rate
fcuts = [1800 2000]; %indicate frequency cutoffs
mags = [1 0]; %desired magnitudes per band
devs = [0.0114469 0.01778279]; %amplitude deviation per band
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);...
%Use Kaiser window estimation
kw = kaiser(n+1,beta);
b = fir1(n,Wn, kw);
[h,omega] = freqz(b,1,512);
plot(omega/pi,20*log10(abs(h)));grid;
xlabel('\omega/\pi'); ylabel('Gain, dB');

hold on
hw = hann(n+1); %use Hann window
b = fir1(n,Wn, hw);
[h,omega] = freqz(b,1,512);
plot(omega/pi,20*log10(abs(h)),'r'); %plot the response in red
cw = chebwin(n+1); %use Chebyshev window
b = fir1(n,Wn,cw);
[h,omega] = freqz(b,1,512);
plot(omega/pi,20*log10(abs(h)),'k'); %plot the response in black
%xline(Wn)
%xline(1/3)
%yline(-35)
