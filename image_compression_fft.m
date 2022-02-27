%Image Compression using FFT
%reference:
%https://www.youtube.com/watch?v=KGiV_2i713I&list=PLMrJAkhIeNNT_Xh3Oy0Y4LTj0Oxo8GqsC&index=34

A = imread('C:\Users\abegail\Downloads\CODE\CH01\dog.jpg');
B = rgb2gray(A); % Convert to grayscale image
Bt = fft2(B); % fft2
Btsort = sort(abs(Bt(:))); % Sort by magnitude
imagesc(fftshift(log(abs(Bt))))
colorbar


for keep=[.1 .05 .01 .002]
thresh = Btsort(floor((1-keep)*length(Btsort)));
ind = abs(Bt)>thresh; % Find small indices
Atlow = Bt.*ind; % Threshold small indices
Alow=uint8(ifft2(Atlow)); % Compressed image
figure, imshow(Alow) % Plot Reconstruction
title(num2str(keep*100)+ "%")
end