function [outimage] = Median( inimage)
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
       %Median ortanca demektir. Bir dizideki ortancay� bulmak i�in �nce
       %elemanlar k���kten b�y��e s�ralanmal�d�r. sort metodu bu y�zden
       %kullan�l�r.
        siraliVektor=sort(komsu(:));
        yeniDeger=median(siraliVektor);
        outimage(y,x)=yeniDeger;
  end
end
outimage=uint8(outimage);
end

