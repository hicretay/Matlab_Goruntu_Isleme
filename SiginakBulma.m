function [outimage] = SiginakBulma( inimage,esik )
%Size ile görüntünün boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);
%Cikti resminin tanımlanması
outimage=zeros(satir,sutun);
%Girdi resmi renkli bir görüntü ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Belirlenen esik değerine göre sıgınakların siyah, arkaplanın beyaz renk 
%yapılması
for y=1:satir
    for x=1:sutun
        if(inimage(y,x)>esik)
            outimage(y,x)=0;            
        else
            outimage(y,x)=255;
        end
    end
end
outimage=uint8(outimage);
end

