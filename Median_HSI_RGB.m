function [ ] = Median_HSI_RGB(inimage,filtreBoyutu)
%Birinci katmana yani r değerine median filtre uygulanması
red=inimage(:,:,1);
out1= LowPass_Median( red,filtreBoyutu);
figure(1),subplot(1,3,1),imshow(out1),title('1.katman Low-Pass Median Filtre Uygulanmış Hali');


green=inimage(:,:,2);
%İkinci katmana yani g değerine median filtre uygulanması
out2=LowPass_Median( green,filtreBoyutu);
subplot(1,3,2),imshow(out2),title('2.katman Low-Pass Median Filtre Uygulanmış Hali');

blue=inimage(:,:,3);
%Üçüncü katmana yani b değerine median filtre uygulanması
out3=LowPass_Median(blue,filtreBoyutu);
subplot(1,3,3),imshow(out3),title('3.katman Low-Pass Median Filtre Uygulanmış Hali');

%Orjinal resmin gösterilmesi
figure(2),subplot(1,2,1),imshow(inimage),title('RGB-Orjinal Resim');

%RGB Low pass median filtrenin Uygulanmış Hali 
rgbImage=cat(3,out1,out2,out3);
subplot(1,2,2),imshow(rgbImage),title('RGB-LowPass Median Filtre Uygulanmış Hali');

hsi=rgb2hsi(inimage);
intensity=hsi(:,:,3);
[sa,su,ka]=size(intensity);
hue=hsi(:,:,1);
saturation=hsi(:,:,2);
%Intensity katmanına filtrenin uygulanması
intensityMedian=LowPass_Median(intensity,filtreBoyutu);
%Katmanların tekrar birleştirilmesi
%Katmanşların boyutları aynı olmalı
intensityMedian=imresize(intensityMedian,[sa,su]);
intensityMedian=double(intensityMedian);
deneme=cat(3,hue,saturation,intensityMedian);
%out4 görüntüsünün rgb modeline dönüştürülmesi
rgbCikis=hsv2rgb(deneme);
%Görüntünün gösterilmesi
figure(3),imshow(rgbCikis),title('HSI-LowPass Median Filtre Uygulanmış Hali');

end

