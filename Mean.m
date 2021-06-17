function [outimage] = Mean( inimage)
filtreBoyutu=3;
%Girdi resminin boyutlarinin alinmasi
[row,col,katman]=size(inimage);
if(katman>1)
    inimage=rgb2gray(inimage);
end
%Sinir degerleri i�in alinan veriler,goruntuyu genisletiyoruz
genisleme=(filtreBoyutu-1)/2+1;
baslama=((filtreBoyutu-1)/2);
%Filtre uygulanirken tasmalar olacagindan �ikti resmini tekrar
%boyutlandiriyoruz.

outimage=zeros(row+genisleme,col+genisleme);  
[row1,col1]=size(outimage);
 

for i=2:row1-genisleme
    for j=2:col1-genisleme
        outimage(i,j)=inimage(i,j);
    end
end
%D�ng� kullanarak filtreyi g�r�nt� �zerinde gezdiriyoruz
for y=2:row1-baslama
  for x=2:col1-baslama
        komsu=outimage((y-baslama):y+baslama,(x-baslama):x+baslama);
       %belirlenmis olan noktanin filtre uygulandiktan sonraki yeni degeri
       %mean fonksiyonu 3x3 luk penceredeki de�erlerin ortalamas�n� al�r.
       %(mean=ortalama demektir.)
       outimage(y,x)=mean(komsu(:));
  end
end
outimage=uint8(outimage);
end

