function [outimage] = PikselTersleme(inimage )
%"Size" ile görüntünün boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);
%Girdi resmi renkli bir görüntü ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Cikti resminin tanımlanması
outimage=zeros(satir,sutun);

%Satir satir piksel değerlerinin işlenmesi,
%Girdi resminde 0 (siyah) değeri olan bir
%piksel cıkısta 255 (beyaz) olur.
for y=1:satir
    for x=1:sutun
        outimage(y,x)=255-inimage(y,x);
    end
end
outimage=uint8(outimage);
end

