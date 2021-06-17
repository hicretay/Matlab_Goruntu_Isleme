function [outimage,kopyaImage] =Asinma( inimage,yapisalEleman,filtreBoyutu,arkaplan,cisimRenk)
%Girdi resminin boyutlarinin alinmasi
[row,col,katman]=size(inimage);
if(katman>1)
    inimage=rgb2gray(inimage);
end
[ inimage ] = Esikleme( inimage,150);
%Sinir degerleri için alinan veriler,goruntuyu genisletiyoruz
genisleme=(filtreBoyutu-1)/2+1;
baslama=((filtreBoyutu-1)/2);
%Filtre uygulanirken tasmalar olacagindan çikti resmini tekrar
%boyutlandiriyoruz.

outimage=zeros(row+genisleme,col+genisleme);  
[row1,col1]=size(outimage);
 

for i=2:row1-genisleme
    for j=2:col1-genisleme
        outimage(i,j)=inimage(i,j);
    end
end
kopyaImage=outimage;

%Döngü kullanarak filtreyi görüntü üzerinde gezdiriyoruz
for y=2:row1-baslama
  for x=2:col1-baslama
        komsu=outimage((y-baslama):y+baslama,(x-baslama):x+baslama);
       %belirlenmis olan noktanin filtre uygulandiktan sonraki yeni degeri
        if((komsu(1,1)==yapisalEleman(1,1))  && (komsu(1,2)==yapisalEleman(1,2)) && (komsu(1,3)==yapisalEleman(1,3)) &&...
                (komsu(2,1)==yapisalEleman(2,1)) && (komsu(2,2)==yapisalEleman(2,2))  && (komsu(2,3)==yapisalEleman(2,3)) &&...
                (komsu(3,1)==yapisalEleman(3,1)) && (komsu(3,2)==yapisalEleman(3,2)) && (komsu(3,3)==yapisalEleman(3,3)))     
                %yada if(komsu==yapisalEleman) yazýlabilir.
            kopyaImage(y,x)=cisimRenk;
                
        else
            kopyaImage(y,x)=arkaplan;
        end
        
  end
end

kopyaImage=uint8(kopyaImage);
subplot(1,2,1),imshow(inimage),title('Girdi Resmi');
subplot(1,2,2),imshow(kopyaImage,[]),title('Asinmis Resim');
end