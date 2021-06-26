% Problem2.15
%Let x(n) - (0.8^n)u(n)
%a. Determine x(n)*x(n)
%using conv:
n=(0:49);% get first 50 samples
x=(0.8).^n;
y= conv(x,x); %get the convolution of the x(n)*x(n)
yn=y(1:50);%get the first 50 samples
stem(n,yn) %plot
xlabel('n')
ylabel('y(n)')
title('x(n)*x(n) using conv')

%% 
% The impulse response h(n) of an LTI system is given by
% h(n) = ((2/3)^n) u(n)
% Find and sketch the output y(n) when the input is given by
% (a) x(n) = delta(n)

n = 0:20;
step = ones(1,21);
h= ((2/3).^(n)).*step;
[x,n] = impseq(0,0,20);
plot(x)
%get the first 40 results
y = conv(x,h);
t= 0:40;
yout = y(1:41);
stem(t,yout)

%%
%P2.19 A linear and time-invariant system is described by the difference equation
% y(n) − 0.5y(n − 1) + 0.25y(n − 2) = x(n) + 2x(n − 1) + x(n − 3)
% 1. Using the filter function, compute and plot the impulse response of the system over
% 0 ≤ n ≤ 100.
% 2. Determine the stability of the system from this impulse response.
% 3. If the input to this system is x(n) = [5 + 3 cos(0.2πn) + 4sin(0.6πn)] u(n), determine the
% response y(n) over 0 ≤ n ≤ 200 using the filter function
b = [1 2 1];
a = [1 -0.5 0.25];
n = 0:100;
h = impz(b,a,n);
stem(n,h)
title("implulse response")

%%
%c If the input to this system is x(n) = [5 + 3 cos(0.2πn) + 4sin(0.6πn)] u(n), determine the
% response y(n) over 0 ≤ n ≤ 200 using the filter function
b = [1 2 1];
a = [1 -0.5 0.25];
n = 0:200;
x = 5 + 3*cos(0.2*pi.*n)+4*sin(0.6*pi.*n);
yfilter= filter(b,a,x);
stem(n,yfilter)%plot

%%
load handel; % the signal is in y and sampling freq in Fs
sound(y,Fs); pause(10); % Play the original sound
alpha = 0.9; D = 4196; % Echo parameters
b = [1,zeros(1,D),alpha]; % Filter parameters
x = filter(b,1,y); % Generate sound plus its echo
sound(x,Fs); % Play sound with echo



%% functions 

function [x,n] = impseq(n0,n1,n2)
% Generates x(n) = delta(n-n0); n1 <= n <= n2
% ----------------------------------------------
% [x,n] = impseq(n0,n1,n2)
%
n = [n1:n2]; x = [(n-n0) == 0];
end



%signal shift
 function[y,n] = signalshift(x,n,k)
 %signal shift y(n-k) = x(n-k) 
 %x= vector
 %n = interval
 %k = shift
 n = n+k;
 y = x;
 end
 