%%
n = (-4:2); % given x(n) = {1,-2,4,6,-5,8,10} with index located at -5 therefore -4≤n≤2
x= [1,-2,4,6,-5,8,10];

% a. x1(n) = 3x(n+2) +x(n-4)-2x(n)
[x1a,n1a]= signalshift(x,n,-2); % shift -2
[x1b,n1b]=signalshift(x,n,4); %shift 4
[x1c,n1c]= signaladd(3*x1a, n1a,x1b,n1b); %x(n)= 3x(n+2) +x(n-4)
[x1,n1] = signaladd(x1c,n1c,-2*x,n);%x1(n) = 3x(n+2) +x(n-4)-2x(n)
stem(n1,x1);
xlabel('n')
ylabel('x1(n)')
title('Sequence x1(n)')
%%
%a. x1(n) = 3x(n+2) +x(n-4)-2x(n)
 [xe1,xo1,m1]= evenodd(x1,n1);
 subplot(1,2,1)
 stem(m1,xe1)
 xlabel('n')
 ylabel('xe1(n)')
 title('Sequence x1(n) Even Component')
 subplot(1,2,2)
 stem(m1,xo1)
 xlabel('n')
 ylabel('xo1(n)')
 title('Sequence x1(n) Odd Component')


%%
% functions 
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