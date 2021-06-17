function [ ] = Median_HSI_RGB(inimage,filtreBoyutu)
%Birinci katmana yani r de�erine median filtre uygulanmas�
red=inimage(:,:,1);
out1= LowPass_Median( red,filtreBoyutu);
figure(1),subplot(1,3,1),imshow(out1),title('1.katman Low-Pass Median Filtre Uygulanm�� Hali');


green=inimage(:,:,2);
%�kinci katmana yani g de�erine median filtre uygulanmas�
out2=LowPass_Median( green,filtreBoyutu);
subplot(1,3,2),imshow(out2),title('2.katman Low-Pass Median Filtre Uygulanm�� Hali');

blue=inimage(:,:,3);
%���nc� katmana yani b de�erine median filtre uygulanmas�
out3=LowPass_Median(blue,filtreBoyutu);
subplot(1,3,3),imshow(out3),title('3.katman Low-Pass Median Filtre Uygulanm�� Hali');

%Orjinal resmin g�sterilmesi
figure(2),subplot(1,2,1),imshow(inimage),title('RGB-Orjinal Resim');

%RGB Low pass median filtrenin Uygulanm�� Hali 
rgbImage=cat(3,out1,out2,out3);
subplot(1,2,2),imshow(rgbImage),title('RGB-LowPass Median Filtre Uygulanm�� Hali');

hsi=rgb2hsi(inimage);
intensity=hsi(:,:,3);
[sa,su,ka]=size(intensity);
hue=hsi(:,:,1);
saturation=hsi(:,:,2);
%Intensity katman�na filtrenin uygulanmas�
intensityMedian=LowPass_Median(intensity,filtreBoyutu);
%Katmanlar�n tekrar birle�tirilmesi
%Katman�lar�n boyutlar� ayn� olmal�
intensityMedian=imresize(intensityMedian,[sa,su]);
intensityMedian=double(intensityMedian);
deneme=cat(3,hue,saturation,intensityMedian);
%out4 g�r�nt�s�n�n rgb modeline d�n��t�r�lmesi
rgbCikis=hsv2rgb(deneme);
%G�r�nt�n�n g�sterilmesi
figure(3),imshow(rgbCikis),title('HSI-LowPass Median Filtre Uygulanm�� Hali');

end

