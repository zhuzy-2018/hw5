function FinalImg= my_unsharp(img,D0,k)
%采用高斯低通滤波
% if nargin==2
%     HPorLP='lowpass';
% end

img=im2double(img);
M=2*size(img,1);
N=2*size(img,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
H=exp(-(D.^2)./(2*(D0.^2)));
J=fftshift(fft2(img,size(H,1),size(H,2)));
% if strcmp(HPorLP,'highpass')
%     
%     K=J.*(ones(size(H,1),size(H,2))-H);
% else
    K=J.*H;
% end
TempImg=ifft2(ifftshift(K));
TempImg=TempImg(1:size(img,1),1:size(img,2));
FinalImg=img+k*(img-TempImg);
FinalImg=(FinalImg-min(min(FinalImg)))/(max(max(FinalImg))-min(min(FinalImg)))*255;
FinalImg=uint8(FinalImg);
% figure;
% subplot(121);imshow(img);title('原始图像');
% subplot(122);imshow(FinalImg);title('unsharp masking后的图像');