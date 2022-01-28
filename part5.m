close all
clear

img1 = double(imread('insan1.jpg'))/255;
figure;imshow(img1);title('img1');

img2 = double(imread('insan2.jpg'))/255;
figure;imshow(img2);title('img2');

mask = ones(size(img1));
mask(:,500:end,:) = 0;
figure;imshow(mask);title('mask');

levels = 20;
comb_recons4 = combine_images(img1,img2,mask,levels);
figure;imshow(comb_recons4);title(['blending result with levels' num2str(levels)]);

imwrite(comb_recons4,'insan1_insan2_laplacian_blend_20.png');
