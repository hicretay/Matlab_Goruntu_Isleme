function [outimage] = LowPass_Median( inimage,filtreBoyutu)
%Girdi resminin gösterilmesi
%subplot(1,2,1),imshow(inimage,[]);
%title('Orjinal Resim');
%Girdi resminin boyutlarýnýn alýnmasý
[row,col]=size(inimage);
%Sýnýr deðerleri için alýnan veriler
boyut1=(filtreBoyutu-1)/2;
boyut2=((filtreBoyutu-1)/2)+1;
%Girdi resminin veri tipinin double'ye dönüþtürülmesi
inimage=double(inimage);
%Filtre uygulanýrken taþmalar olacaðýndan çýktý resmini tekrar
%boyutlandýrýyoruz.
outimage=double(zeros(row-filtreBoyutu-1,col-filtreBoyutu-1));       
%Döngü kullanarak filtreyi görüntü üzerinde gezdiriyoruz
for y=boyut2:row-boyut2
    for x=boyut2:col-boyut2
        komsu=inimage((y-boyut1):y+boyut1,x-boyut1:x+boyut1);
        %belirlenmiþ olan noktanýn filtre uygulandýktan sonraki yeni deðeri
        siraliVektor=sort(komsu(:));
        yeniDeger=median(siraliVektor);
        outimage(y-boyut1,x-boyut1)=yeniDeger;
    end
end
%Çýktý resminin veri tipinin integer a dönüþtürülmesi
outimage=uint8(outimage);
%Çýktý resminin gösterilmesi
%subplot(1,2,2),imshow(outimage,[]);
%title('Low-Pass Median Filtre Uygulanmýþ Resim');
end