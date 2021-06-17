
function [outimage] = Sobel( inimage)
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
filtre1=[-1 -2 -1 ; 0 0 0; 1  2 1];
filtre2=[-1 0 1 ; -2 0 2; -1 0 1];
%D�ng� ile filtreyi g�r�nt� �zerinde gezdiriyoruz.
for y=boyut2:row-boyut2
    for x=boyut2:col-boyut2
        komsu=inimage((y-boyut1):y+boyut1,x-boyut1:x+boyut1);
        %belirlenmi� olan noktan�n filtre uyguland�ktan sonraki yeni de�eri
        toplam1=0;
        toplam2=0;
        for m=1:filtreBoyutu
            for n=1:filtreBoyutu
                toplam1=toplam1+filtre1(m,n)*komsu(m,n);
            end
        end
        for m=1:filtreBoyutu
            for n=1:filtreBoyutu
                toplam2=toplam2+filtre2(m,n)*komsu(m,n);
            end
        end
        deger=power(toplam1,2)+power(toplam2,2);
        outimage(y-boyut1,x-boyut1)=sqrt(deger);
    end
end
%��kt� resminin veri tipinin integer a d�n��t�r�lmesi
outimage=uint8(outimage);

end


