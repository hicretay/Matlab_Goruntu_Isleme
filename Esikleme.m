function [ outimage ] = Esikleme( inimage,esik )
[satir,sutun,katman]=size(inimage);
if(katman>1)
    inimage=rgb2gray(inimage);
end
%�ncelikle gelen resmin kontrast ayar�n� yapal�m. Kontrast� ayarlamak i�in kullan�lan 
%g�r�nt� iyile�tirme y�ntemleri: Kontrast germe, histogram e�itleme

[ alinanResim ] =histeq( inimage);
%[ alinanResim ] =ContrastStretching(inimage );

outimage=zeros(satir,sutun);
for i=1:satir
    for j=1:sutun
        if(alinanResim(i,j)>=esik)
            outimage(i,j)=255;
        else
            outimage(i,j)=0;
        end
    end
end
figure(2);
subplot(1,3,1), imshow(inimage),title('Orjinal');
subplot(1,3,2), imshow(alinanResim),title('Kontrast ayar� yap�lm�� resim');
subplot(1,3,3), imshow(outimage),title('Segmente edilmi� resim');
end

