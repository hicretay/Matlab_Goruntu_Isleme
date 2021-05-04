%log.png test edilebilir.
%Farklý cSabit deðerleri ile test edelim.
%cSabit=50,75,100,150 
function [ outimage ] =LogTransform( image, cSabit)
%Girdi resmin gösterilmesi
figure(1),imshow(image,[]);
title('Log Transform Uygulanmadan Önceki Resim');
image=im2double(image);
%Girdi resminin boyutlarýnýn alýnmasý
[ row,col,k]=size(image);
if(k>1)
    image=rgb2gray(image);
end
%Çýktý resmine ilk deðer atama
outimage=zeros(row,col);
%Piksel piksel log transformation uygulanmasý
for y=1:1:row
    for x=1:1:col
        outimage(y,x)=cSabit*log(1+image(y,x));
    end
end
outimage=uint8(outimage);
figure(2),imshow(outimage,[]);
title('Log Transform Uygulandýktan Sonraki Resim');
end

