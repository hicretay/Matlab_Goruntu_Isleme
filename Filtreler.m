function [ outimage] = Filtreler(filtreAdi)
[filename, pathname]=uigetfile({'*.jpg';'*.gif';'*.png';'*.ppm';'*.pgm'},'Resim dosyasýný seçiniz:');
fullPathName=strcat( pathname, filename);
inimage=imread(fullPathName);


switch(filtreAdi)
    case 'Prewitt'
        outimage=Prewitt(inimage);
        baslik='Prewitt uygulanmýþ resim';
    case 'Laplace'
        outimage=Laplace(inimage);
        baslik='Laplace uygulanmýþ resim';
    %case ler arýrýlabilir.
    %Sobel, Roberts, Mean, Median, vb. filtreleri eklenebilir.
end
subplot(1,2,1),imshow(inimage), title('Orjinal Resim');
subplot(1,2,2),imshow(outimage), title(baslik);

end

