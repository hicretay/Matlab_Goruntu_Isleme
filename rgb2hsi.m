function [hsi] = rgb2hsi(rgbImage)
rgbImage = im2double(rgbImage);
r = rgbImage(:, :, 1);
g = rgbImage(:, :, 2);
b = rgbImage(:, :, 3);

%Tanýmlanmýþ olan eþitlikleri
%kullanarak  H,S,I deðerlerini bulalým
num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));

H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;

I = (r + g + b)/3;

%son olarak bu üç katmaný birleþtiriyoruz.
hsi = cat(3, H, S, I);
subplot(1,2,1), imshow(rgbImage,[]),title('Renkli Görüntü');
subplot(1,2,2), imshow(hsi,[]),title('RGB to HSI Görüntü');
end