%ekmek.png test edilebilir.
function [ outimage ] = HistogramEsitleme( inimage )
%Girdi g�r�nt�s�n�n boyut bilgilerinin al�nmas�
[satir,sutun,katman]=size(inimage);
%G�r�nt�n�n gri seviye g�r�nt�ye d�n��t�r�lmesi
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Toplam piksel say�s�
pikselSayisi=satir*sutun;

HIm=uint8(zeros(size(inimage,1),size(inimage,2)));
%Olas�l�k vekt�r�
probc=zeros(256,1);
%K�m�latif toplam vekt�r�
cum=zeros(256,1);
%��kt� vekt�r�
output=zeros(256,1);
%G�r�nt�n�n histogram bilgileri
[counts,x] = imhist(inimage);
%Olas�l�klar
probf = counts/ pikselSayisi;
sum=0;
%255 gri seviye maksimum de�eri
no_bins=255;
%Histogram E�itleme i�lemi
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



