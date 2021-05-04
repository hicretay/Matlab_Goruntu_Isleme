%log.png test edilebilir.
%Farkl� cSabit de�erleri ile test edelim.
%cSabit=50,75,100,150 
function [ outimage ] =LogTransform( image, cSabit)
%Girdi resmin g�sterilmesi
figure(1),imshow(image,[]);
title('Log Transform Uygulanmadan �nceki Resim');
image=im2double(image);
%Girdi resminin boyutlar�n�n al�nmas�
[ row,col,k]=size(image);
if(k>1)
    image=rgb2gray(image);
end
%��kt� resmine ilk de�er atama
outimage=zeros(row,col);
%Piksel piksel log transformation uygulanmas�
for y=1:1:row
    for x=1:1:col
        outimage(y,x)=cSabit*log(1+image(y,x));
    end
end
outimage=uint8(outimage);
figure(2),imshow(outimage,[]);
title('Log Transform Uyguland�ktan Sonraki Resim');
end

