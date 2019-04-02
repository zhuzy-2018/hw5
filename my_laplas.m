function FinalImg= my_laplas(img,c)


img=im2double(img);
% imgbar=imhist(img);
% img=(img-min(min(img)))/(max(max(img))-min(min(img)));
M=2*size(img,1);
N=2*size(img,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
H=-1*4*(pi^2)*(D.^2);
% H=((H-min(min(H)))/(max(max(H))-min(min(H)))-1)*2000;
J=fftshift(fft2(img,size(H,1),size(H,2)));

    K=J.*H;

FinalImg=ifft2(ifftshift(K));
% FinalImg=FinalImg/max(max(FinalImg));
FinalImg=img+c*FinalImg(1:size(img,1),1:size(img,2));
% FinalImg=FinalImg(1:size(img,1),1:size(img,2));
FinalImg=(FinalImg-min(min(FinalImg)))/(max(max(FinalImg))-min(min(FinalImg)))*255;

% FinalImg=histeq(FinalImg,imgbar);

FinalImg=uint8(FinalImg);
figure;
subplot(121);imshow(img);title('原始图像');
subplot(122);imshow(FinalImg);title('拉普拉斯高通滤波后的图像');