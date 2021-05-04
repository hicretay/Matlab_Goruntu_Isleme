%Keskinle�tirici filtre, g�r�nt�deki kenarlar� bulur.
%ay.jpg yada checkboard_corrupt.pgm ile test edilebilir.
function [outimage] = Laplace( inimage)
%Filtre boyutu
filtreBoyutu=3;

%Girdi resminin boyutlar�n�n al�nmas�
[row,col,katman]=size(inimage);
if(katman>1)
   inimage=rgb2gray(inimage);
end
%S�n�r de�erleri i�in al�nan veriler
boyut1=(filtreBoyutu-1)/2;
boyut2=((filtreBoyutu-1)/2)+1;
%Girdi resminin veri tipinin double'ye d�n��t�r�lmesi
inimage=double(inimage);
%Filtre uygulan�rken ta�malar olaca��ndan ��kt� resmini tekrar
%boyutland�r�yoruz.
outimage=double(zeros(row-filtreBoyutu-1,col-filtreBoyutu-1));    
filtre=[0 1 0; 1 -4 1;0 1 0];
%D�ng� ile filtreyi g�r�nt� �zerinde gezdiriyoruz.
%%%%%%%%%%%%KONVOLUSYON ��LEM�%%%%%%%%%%%%%%%
for y=boyut2:row-boyut2
    for x=boyut2:col-boyut2
        komsu=inimage((y-boyut1):y+boyut1,x-boyut1:x+boyut1);
        %belirlenmi� olan noktan�n filtre uyguland�ktan sonraki yeni de�eri
        toplam=0;
        for m=1:filtreBoyutu
            for n=1:filtreBoyutu
                toplam=toplam+filtre(m,n)*komsu(m,n);
            end
        end
        outimage(y-boyut1,x-boyut1)=toplam;
    end
end
%%%%%%%%%%%%%%%KONVOLUSYON ��LEM�%%%%%%%%%%%%%%
%��kt� resminin veri tipinin integer a d�n��t�r�lmesi
outimage=uint8(outimage);
end


