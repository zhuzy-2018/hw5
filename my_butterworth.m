function [FinalImg,rate]= my_butterworth(img,D0,n,HPorLP)
if nargin==3
    HPorLP='lowpass';
end

img=im2double(img);
M=2*size(img,1);
N=2*size(img,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
H=1./(1+(D./D0).^(2*n));
J=fftshift(fft2(img,size(H,1),size(H,2)));
if strcmp(HPorLP,'highpass')
    
    K=J.*(ones(size(H,1),size(H,2))-H);
else
    K=J.*H;
end

Kabs2=abs(K).^2;
Jabs2=abs(J).^2;
Ksum=zeros(size(H,1),size(H,2));
for i=1:size(H,1)
    for j=1:size(H,2)
        if strcmp(HPorLP,'highpass')
            if D(i,j)>D0
            Ksum(i,j)=Kabs2(i,j);
            end
        else
            if D(i,j)<D0
            Ksum(i,j)=Kabs2(i,j);
            end
        end
    end
end
% Kabs2=Kabs2(:);
% Ksum=Ksum(:);
% Ksum=Kabs2(D(:)>D0);
        rate=sum(Ksum(:))/sum(Jabs2(:));
        
FinalImg=ifft2(ifftshift(K));
FinalImg=FinalImg(1:size(img,1),1:size(img,2));
FinalImg=(FinalImg-min(min(FinalImg)))/(max(max(FinalImg))-min(min(FinalImg)))*255;
FinalImg=uint8(FinalImg);
% figure;
% subplot(121);imshow(img);title('原始图像');
% subplot(122);imshow(FinalImg);title('巴特沃斯低通滤波后的图像');