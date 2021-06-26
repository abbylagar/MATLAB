%% inverse z transform
%X(z) =z /3z^2 − 4z + 1
% X(z) = z ^−1 /  3 − 4z^−1 + z^−2  
%X(z) = 0 + z ^−1 /3 − 4z−1 + z−2

b = [0 1];
a = [3 -4 1];
[R,p,C] = residuez(b,a)
zplane(b,a)
%% inverse back 
R=[0 0.5 1]
p=[3 4 2]
[b,a] = residuez(R,p,C);
zplane(b,a)
%% 
%y(n) − 0.9y(n − 1) = x(n)

b= [1, 0]; 
a = [1, -0.9];
zplane(b,a)

[R,p,C] = residuez(b,a)


%% A causal LTI system is implemented with the difference equation
% y(n) = 0.5x(n) + 0.2x(n - 1) + 0.5 y(n - 1)- 0.1 y(n -2):
% Compute and plot the frequency response magnitude jHf (!)j using the MATLAB command freqz.
b = [0.5 0.2 ];
a = [1 0.5 -0.1];
freqz(b,a)



%%
%zplane
zplane(b,a)
[z,p,k] = tf2zpk(b,a);

%% Find the output produced by the input x(n) = cos(0.2pi *n). Compare your answer with the output signal
%found numerically with the MATLAB command filter.
n = 0:100;
x = cos(0.2*pi.*n);
yout=filter(b,a,x);
subplot(2,1,1)
plot(x)

subplot(2,1,2)
plot(yout)
