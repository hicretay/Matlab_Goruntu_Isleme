function [ outimage] = Filtreler(filtreAdi)
[filename, pathname]=uigetfile({'*.jpg';'*.gif';'*.png';'*.ppm';'*.pgm'},'Resim dosyasını seçiniz:');
fullPathName=strcat( pathname, filename);
inimage=imread(fullPathName);


switch(filtreAdi)
    case 'Prewitt'
        outimage=Prewitt(inimage);
        baslik='Prewitt uygulanmış resim';
    case 'Laplace'
        outimage=Laplace(inimage);
        baslik='Laplace uygulanmış resim';
    %case ler arırılabilir.
    %Sobel, Roberts, Mean, Median, vb. filtreleri eklenebilir.
end
subplot(1,2,1),imshow(inimage), title('Orjinal Resim');
subplot(1,2,2),imshow(outimage), title(baslik);

end

