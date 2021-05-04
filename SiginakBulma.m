function [outimage] = SiginakBulma( inimage,esik )
%Size ile g�r�nt�n�n boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);
%Cikti resminin tan�mlanmas�
outimage=zeros(satir,sutun);
%Girdi resmi renkli bir g�r�nt� ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Belirlenen esik de�erine g�re s�g�naklar�n siyah, arkaplan�n beyaz renk 
%yap�lmas�
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

