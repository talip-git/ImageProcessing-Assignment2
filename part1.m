close all
clear

img = double(imread('vazo2.jpg'))/255;
figure;imshow(img);title('input');

gaussian_pyr = my_gaussian_pyramid(img,4);

for i = 1:length(gaussian_pyr)
    figure;imshow(gaussian_pyr{i});title(['gaussian level ' num2str(i)]);
end

 for i = 1:length(gaussian_pyr)
     imwrite(gaussian_pyr{i},['vazo2_gp' num2str(i) '.png']);
 end