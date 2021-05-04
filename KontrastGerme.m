%ekmek.png test edilebilir.
function [] =KontrastGerme( inimage )
% G�r�nt�n�n boyut bilgilerinin al�nmas�
[row,col,katman ]=size(inimage);
% Girdi resminin gri seviye g�r�nt�ye d�n��t�r�lmesi
if(katman>1)
    inimage=rgb2gray(inimage);
end
subplot(2,2,1),imshow(inimage),title('Girdi G�r�nt�s�');
subplot(2,2,2), imhist(inimage),title('Girdi G�r�nt�s�n�n Histogram�');


%��kt� resmine ilk de�er atama
outimage=zeros(row ,col);
%G�r�nt�deki en d���k ve en y�ksek gri seviye piksel de�erinin bulunmas�
maxDeger=max(inimage(:));
minDeger=min(inimage(:));

outimage=double(outimage);
for i=1:row
    for j=1:col
        %Kontrast germe i�lemi
        pay=double(inimage(i,j)-minDeger);
        payda=double(maxDeger-minDeger);     
        outimage(i,j)=(pay*255)/(payda);
    end
end
%Sonu�lar� kaydetmeden �nce g�r�nt� format�n�n uint8 'e d�nd�r�lmesi
outimage=uint8(outimage);

subplot(2,2,3),imshow(outimage),title('��kt� G�r�nt�s�');
subplot(2,2,4), imhist(outimage),title('��kt� G�r�nt�s�n�n Histogram�');
end


