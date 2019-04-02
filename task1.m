I=imread('test1.pgm');
figure,
subplot(2,2,1),imshow(I);

ft=fft2(I);
ft2=fftshift(ft);
ift=uint8(ifft2(ft));
subplot(2,2,2),imshow(ift);

ftr=real(ft2);
fti=imag(ft2);
ftA=sqrt(ftr.^2+fti.^2);
ftA=(ftA-min(min(ftA)))/(max(max(ftA))-min(min(ftA)))*255;
% ftA=uint8(ftA);
subplot(2,2,3),imshow(ftA);

fta=atan(fti./ftr);
fta=(fta-min(min(fta)))/(max(max(fta))-min(min(fta)))*255;
fta=uint8(fta);
subplot(2,2,4),imshow(fta);

%%
[Ibutter,ButterRate]=my_butterworth(I,50,6);
[Igauss,GaussRate]=my_gauss(I,60);
figure,
subplot(131),imshow(I);title('origin');
subplot(132),imshow(Igauss);title({'Gauss';'D0=60';['功率谱比=',num2str(ButterRate)]});
subplot(133),imshow(Ibutter);title({'Butterworth';'D0=50,n=6';['功率谱比=',num2str(GaussRate)]});
