% Make an accurate sketch of each of the discrete-time signals
% (a) x(n) = u(n + 3) + 0.5u(n - 1)
n= -5:5;
[x1,n1] = stepseq(-3,-5,5);
[x2,n2] = stepseq(-1,-5,5);
x2 = x2*0.5;
x = x1+x2;
stem(n,x)

%% 
%(b) x(n) = delta(n + 3) + 0.5delta(n - 1)
n = -5:5;
[x1,n1] = impseq(-3,-5,5);
[x2,n2] = impseq(1,-5,5);
x = x1+0.5*x2;
stem(n,x)



%%
% Let x(n) = {1,-2,4,6,-5,8,10} . Generate and plot the samples (use the
% stem function of the following sequences
n = (-4:2); % given x(n) = {1,-2,4,6,-5,8,10} with index located at -5 therefore -4≤n≤2
x= [1,-2,4,6,-5,8,10];
% Problem 2.2 a
% a. x1(n) = 3x(n+2) +x(n-4)-2x(n)
[x1a,n1a]= signalshift(x,n,-2); % shift -2
[x1b,n1b]=signalshift(x,n,4); %shift 4
[x1c,n1c]= signaladd(3*x1a, n1a,x1b,n1b); %x(n)= 3x(n+2) +x(n-4)
[x1,n1] = signaladd(x1c,n1c,-2*x,n);%x1(n) = 3x(n+2) +x(n-4)-2x(n)
stem(n1,x1);
xlabel('n')
ylabel('x1(n)')
title('Sequence x1(n)')



%% functions 

function [x,n] = impseq(n0,n1,n2)
% Generates x(n) = delta(n-n0); n1 <= n <= n2
% ----------------------------------------------
% [x,n] = impseq(n0,n1,n2)
%
n = [n1:n2]; x = [(n-n0) == 0];
end

function [x,n] = stepseq(n0,n1,n2)
% Generates x(n) = u(n-n0); n1 <= n <= n2
% ------------------------------------------
% [x,n] = stepseq(n0,n1,n2)
%
n = [n1:n2]; x = [(n-n0) >= 0];

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
 
%signal addition
function[y,n] = signaladd(x1,n1,x2,n2)
     %add two signals 
    % x1 =signal 1
    %x2 = signal 2
    %n1 = interval signal 1
    %2 = interval signal 2
    %
    n = min(min(n1),min(n2)):max(max(n1),max(n2)); 
    y1 = zeros(1,length(n)); y2 = y1; 
    y1(find((n>=min(n1))&(n<=max(n1))==1))=x1; 
    y2(find((n>=min(n2))&(n<=max(n2))==1))=x2; 
    y = y1+y2;
end

% signal multiplication
function[y,n] = signalmult(x1,n1,x2,n2)
  %multiply two signals 
    % x1 =signal 1
    %x2 = signal 2
    %n1 = interval signal 1
    %2 = interval signal 2
    %
   n = min(min(n1),min(n2)):max(max(n1),max(n2)); 
    y1 = zeros(1,length(n)); y2 = y1; 
    y1(find((n>=min(n1))&(n<=max(n1))==1))=x1; 
    y2(find((n>=min(n2))&(n<=max(n2))==1))=x2;
    y = y1.*y2;

end


% signal fold
function [y,n] = signalfold(x,n)
%  y(n) = x(-n)
y = fliplr(x); n = -fliplr(n);
end


%odd and even signal 
function [xe, xo, m] = evenodd(x,n)
% Real signal decomposition into even and odd parts
% [xe, xo, m] = evenodd(x,n)
%
    if any(imag(x) ~= 0)
    error('x is not a real sequence')
    end
    m = -fliplr(n);
    m1 = min([m,n]); 
    m2 = max([m,n]);
    m = m1:m2;
    nm = n(1)-m(1);
    n1 = 1:length(n);
    x1 = zeros(1,length(m)); 
    x1(n1+nm) = x;
    x = x1;
    xe = 0.5*(x + fliplr(x)); 
    xo = 0.5*(x - fliplr(x));
     
end
