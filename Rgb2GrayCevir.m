%Herhangi bir resim;
%inimage=imread(resim  yolu) al�narak okunur.
%inimage=imread('G:\ImageProcessing\Lab1\images\pembe.jpg') gibi...

%imshow ile de resim fig�r olarak g�sterilebilir.
%imshow(inimage);


%G�r�nt� K�rpma
%k�rp=inimage(100:200,150:250,:)

function [ griSeviye ] = Rgb2GrayCevir( inimage )
%"Size" ile g�r�nt�n�n boyut bilgilerinin alinmasi
[satir,sutun,katman]=size(inimage);


%Cikti resminin tan�mlanmas�
griSeviye=zeros(satir,sutun);
%Girdi resmi renkli bir g�r�nt� ise (RGB,katman=3) ise
% gri seviye resme dondurulmasi    
if(katman==1)
    disp('Resim zaten gri seviye,tekrar gri seviye d�n���m yap�lamaz.');
    griSeviye=inimage;
    return;
else
    %Renkli g�r�nt� 0.2989 * R + 0.5870 * G + 0.1140 * B oranlar�nda 
    %kar�st�r�larak gri
    %seviye g�r�nt� elde edilir.
    
    for m=1:satir
        for n=1:sutun
            griSeviye(m,n)=0.2989*inimage(m,n,1)...
                +0.5870*inimage(m,n,2)...
                +0.1140*inimage(m,n,3);
        end
    end
end
% For d�ng�leri kullanmadan d�n���m:
% % griSeviye=0.2989*inimage(:,:,1)+0.5870*inimage(:,:,2)+0.1140*inimage(:,:,3);
subplot(1,2,1), imshow(inimage,[]),title('Renkli G�r�nt�');
subplot(1,2,2), imshow(griSeviye,[]),title('Gri Seviye G�r�nt�');

end
