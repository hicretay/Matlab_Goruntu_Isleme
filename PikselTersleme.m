function [outimage] = PikselTersleme(inimage )
%"Size" ile g�r�nt�n�n boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);
%Girdi resmi renkli bir g�r�nt� ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Cikti resminin tan�mlanmas�
outimage=zeros(satir,sutun);

%Satir satir piksel de�erlerinin i�lenmesi,
%Girdi resminde 0 (siyah) de�eri olan bir
%piksel c�k�sta 255 (beyaz) olur.
for y=1:satir
    for x=1:sutun
        outimage(y,x)=255-inimage(y,x);
    end
end
outimage=uint8(outimage);
end

