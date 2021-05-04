%ekmek.png test edilebilir.
function [ outimage ] = HistogramEsitleme( inimage )
%Girdi görüntüsünün boyut bilgilerinin alýnmasý
[satir,sutun,katman]=size(inimage);
%Görüntünün gri seviye görüntüye dönüþtürülmesi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Toplam piksel sayýsý
pikselSayisi=satir*sutun;

HIm=uint8(zeros(size(inimage,1),size(inimage,2)));
%Olasýlýk vektörü
probc=zeros(256,1);
%Kümülatif toplam vektörü
cum=zeros(256,1);
%Çýktý vektörü
output=zeros(256,1);
%Görüntünün histogram bilgileri
[counts,x] = imhist(inimage);
%Olasýlýklar
probf = counts/ pikselSayisi;
sum=0;
%255 gri seviye maksimum deðeri
no_bins=255;
%Histogram Eþitleme iþlemi
for i=1:size(probf)
    sum=sum+counts(i);
    cum(i)=sum;
    probc(i)=cum(i)/pikselSayisi;
   output(i)=round(probc(i)*no_bins);
end
for i=1:size(inimage,1)
     for j=1:size(inimage,2)
          HIm(i,j)=output(inimage(i,j)+1);
     end
end
HIm = im2double(HIm);
MAx = max(max(HIm));
MIn = min(min(HIm));
outimage= uint8(round(((HIm - MIn) / ( MAx - MIn))*255));
end



