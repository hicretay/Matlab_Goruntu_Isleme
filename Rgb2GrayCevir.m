%Herhangi bir resim;
%inimage=imread(resim  yolu) alýnarak okunur.
%inimage=imread('G:\ImageProcessing\Lab1\images\pembe.jpg') gibi...

%imshow ile de resim figür olarak gösterilebilir.
%imshow(inimage);


%Görüntü Kýrpma
%kýrp=inimage(100:200,150:250,:)

function [ griSeviye ] = Rgb2GrayCevir( inimage )
%"Size" ile görüntünün boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);


%Cikti resminin tanýmlanmasý
griSeviye=zeros(satir,sutun);
%Girdi resmi renkli bir görüntü ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi    
if(katman==1)
    disp('Resim zaten gri seviye,tekrar gri seviye dönüþüm yapýlamaz.');
    griSeviye=inimage;
    return;
else
    %Renkli görüntü 0.2989 * R + 0.5870 * G + 0.1140 * B oranlarýnda 
    %karýstýrýlarak gri
    %seviye görüntü elde edilir.
    
    for m=1:satir
        for n=1:sutun
            griSeviye(m,n)=0.2989*inimage(m,n,1)...
                +0.5870*inimage(m,n,2)...
                +0.1140*inimage(m,n,3);
        end
    end
end
% For döngüleri kullanmadan dönüþüm:
% % griSeviye=0.2989*inimage(:,:,1)+0.5870*inimage(:,:,2)+0.1140*inimage(:,:,3);
subplot(1,2,1), imshow(inimage,[]),title('Renkli Görüntü');
subplot(1,2,2), imshow(griSeviye,[]),title('Gri Seviye Görüntü');

end
