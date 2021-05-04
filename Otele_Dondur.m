function [] = Otele_Dondur( inimage )
%Size ile görüntünün boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);
%Cikti resminin tanýmlanmasý
outimage1=zeros(satir,sutun);
outimage2=zeros(satir,sutun);
%Girdi resmi renkli bir görüntü ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Oteleme
for y=1:satir
    for x=1:sutun
        outimage1(y,x)=inimage(satir-y+1,x);
    end
end
%Dondurme
for y=1:satir
    for x=1:sutun
        outimage2(y+15,x+12)=inimage(y,x);
    end
end
outimage1=uint8(outimage1);
outimage2=uint8(outimage2);
subplot(1,3,1),imshow(inimage);
subplot(1,3,2),imshow(outimage1);
subplot(1,3,3),imshow(outimage2);
end