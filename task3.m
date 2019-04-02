% I=imread('test3_corrupt.pgm');
I=imread('test4 copy.bmp');
Iunsharp=my_unsharp(I,60,1);
Ilaplas=my_laplas(I,-1);
figure,
subplot(131),imshow(I);title('origin');
subplot(132),imshow(Iunsharp);title({'Unsharp masking';'k=1'});
subplot(133),imshow(Ilaplas);title({'Laplace';'D0=50,c=-1'});