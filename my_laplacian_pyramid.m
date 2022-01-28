function laplacian_pyr = my_laplacian_pyramid(gaussian_pyr)
tmp = gaussian_pyr;
for i = 1:length(gaussian_pyr)-1
    upgauss = impyramid(tmp{i+1},"expand");
    size1 = size(upgauss);
    size2 = size(tmp{i});
    while(1)
        if size1(1) == size2(1) && size1(2) == size2(2)
            break;
        end
        if size1(1)<size2(1)
            last_row = upgauss(end,:,1);
    
            upgauss(end+1,:,1) = last_row;
        end
        if(size1(2)<size2(2))
            last_col = upgauss(:,end,1);
    
            upgauss(:,end+1,1) = last_col;
        end
        size1 = size(upgauss);
        size2 = size(tmp{i});
    end
    laplacian_pyr{i} = tmp{i}-upgauss;
end
laplacian_pyr{length(gaussian_pyr)} = gaussian_pyr{length(gaussian_pyr)};
end