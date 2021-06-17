function [outimage] = LowPass_Median( inimage,filtreBoyutu)
%Girdi resminin g�sterilmesi
%subplot(1,2,1),imshow(inimage,[]);
%title('Orjinal Resim');
%Girdi resminin boyutlar�n�n al�nmas�
[row,col]=size(inimage);
%S�n�r de�erleri i�in al�nan veriler
boyut1=(filtreBoyutu-1)/2;
boyut2=((filtreBoyutu-1)/2)+1;
%Girdi resminin veri tipinin double'ye d�n��t�r�lmesi
inimage=double(inimage);
%Filtre uygulan�rken ta�malar olaca��ndan ��kt� resmini tekrar
%boyutland�r�yoruz.
outimage=double(zeros(row-filtreBoyutu-1,col-filtreBoyutu-1));       
%D�ng� kullanarak filtreyi g�r�nt� �zerinde gezdiriyoruz
for y=boyut2:row-boyut2
    for x=boyut2:col-boyut2
        komsu=inimage((y-boyut1):y+boyut1,x-boyut1:x+boyut1);
        %belirlenmi� olan noktan�n filtre uyguland�ktan sonraki yeni de�eri
        siraliVektor=sort(komsu(:));
        yeniDeger=median(siraliVektor);
        outimage(y-boyut1,x-boyut1)=yeniDeger;
    end
end
%��kt� resminin veri tipinin integer a d�n��t�r�lmesi
outimage=uint8(outimage);
%��kt� resminin g�sterilmesi
%subplot(1,2,2),imshow(outimage,[]);
%title('Low-Pass Median Filtre Uygulanm�� Resim');
end