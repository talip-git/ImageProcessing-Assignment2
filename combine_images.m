function comb_recons = combine_images(img1,img2,mask,levels)

g1 = my_gaussian_pyramid(img1,levels);
lp1 = my_laplacian_pyramid(g1);

g2 = my_gaussian_pyramid(img2,levels);
lp2 = my_laplacian_pyramid(g2);

mg = my_gaussian_pyramid(mask,levels);

lc = combine_laplacian_pyramids(lp1,lp2,mg);

comb_recons = collapse_laplacian_pyramid(lc);

end