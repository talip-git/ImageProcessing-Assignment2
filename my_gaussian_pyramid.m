function gaussian_pyr = my_gaussian_pyramid(img,levels)
gaussian_pyr{1} = img;
    for i = 2:levels
        g = gaussian_pyr{i-1};
        g = imgaussfilt(g,2);
        gaussian_pyr{i} = impyramid(g,"reduce");
    end
end