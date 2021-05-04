function [ outimage] = Filtreler(filtreAdi)
[filename, pathname]=uigetfile({'*.jpg';'*.gif';'*.png';'*.ppm';'*.pgm'},'Resim dosyas�n� se�iniz:');
fullPathName=strcat( pathname, filename);
inimage=imread(fullPathName);


switch(filtreAdi)
    case 'Prewitt'
        outimage=Prewitt(inimage);
        baslik='Prewitt uygulanm�� resim';
    case 'Laplace'
        outimage=Laplace(inimage);
        baslik='Laplace uygulanm�� resim';
    %case ler ar�r�labilir.
    %Sobel, Roberts, Mean, Median, vb. filtreleri eklenebilir.
end
subplot(1,2,1),imshow(inimage), title('Orjinal Resim');
subplot(1,2,2),imshow(outimage), title(baslik);

end

