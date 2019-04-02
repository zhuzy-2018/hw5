I=imread('test3_corrupt.pgm');
[Ibutter,ButterRate]=my_butterworth(I,50,6,'highpass');
[Igauss,GaussRate]=my_gauss(I,60,'highpass');
figure,
subplot(131),imshow(I);title('origin');
subplot(132),imshow(Igauss);title({'Gauss';'D0=60';['功率谱比=',num2str(ButterRate)]});
subplot(133),imshow(Ibutter);title({'Butterworth';'D0=50,n=6';['功率谱比=',num2str(GaussRate)]});