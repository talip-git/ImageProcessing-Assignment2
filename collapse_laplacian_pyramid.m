function img = collapse_laplacian_pyramid(laplacian_pyr)

collapse = laplacian_pyr;

for i = length(laplacian_pyr):-1:2
    uplapp = impyramid(collapse{i},"expand");
    size1 = size(uplapp);
    size2 = size(collapse{i-1});
    while(1)
        if size1(1) == size2(1) && size1(2) == size2(2)
            break;
        end
        if size1(1)<size2(1)
            last_row = uplapp(end,:,1);
    
            uplapp(end+1,:,1) = last_row;
        end
        if(size1(2)<size2(2))
            last_col = uplapp(:,end,1);
    
            uplapp(:,end+1,1) = last_col;
        end
        size1 = size(uplapp);
        size2 = size(collapse{i-1});
    end
    collapse{i-1} = collapse{i-1}+uplapp;
end
%Last Index
img = collapse{1};

end