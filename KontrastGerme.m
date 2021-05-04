%ekmek.png test edilebilir.
function [] =KontrastGerme( inimage )
% Görüntünün boyut bilgilerinin alýnmasý
[row,col,katman ]=size(inimage);
% Girdi resminin gri seviye görüntüye dönüþtürülmesi
if(katman>1)
    inimage=rgb2gray(inimage);
end
subplot(2,2,1),imshow(inimage),title('Girdi Görüntüsü');
subplot(2,2,2), imhist(inimage),title('Girdi Görüntüsünün Histogramý');


%Çýktý resmine ilk deðer atama
outimage=zeros(row ,col);
%Görüntüdeki en düþük ve en yüksek gri seviye piksel deðerinin bulunmasý
maxDeger=max(inimage(:));
minDeger=min(inimage(:));

outimage=double(outimage);
for i=1:row
    for j=1:col
        %Kontrast germe iþlemi
        pay=double(inimage(i,j)-minDeger);
        payda=double(maxDeger-minDeger);     
        outimage(i,j)=(pay*255)/(payda);
    end
end
%Sonuçlarý kaydetmeden önce görüntü formatýnýn uint8 'e döndürülmesi
outimage=uint8(outimage);

subplot(2,2,3),imshow(outimage),title('Çýktý Görüntüsü');
subplot(2,2,4), imhist(outimage),title('Çýktý Görüntüsünün Histogramý');
end


