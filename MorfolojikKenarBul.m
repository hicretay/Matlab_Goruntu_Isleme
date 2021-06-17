function [ outimage ] = MorfolojikKenarBul( inimage,yapisalEleman,filtreBoyutu,arkaplan,cisimRenk)
[inimageS,kopyaImage] =Asinma( inimage,yapisalEleman,filtreBoyutu,arkaplan, cisimRenk);
outimage=uint8(inimageS)-uint8(kopyaImage);
subplot(1,2,1),imshow(inimageS),title('Girdi Resmi');
subplot(1,2,2),imshow(outimage,[]),title('Son Resim');
end

