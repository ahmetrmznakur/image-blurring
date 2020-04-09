function output = blur(img, w)

    imgvec = imread(img);
    [row, col] = size(imgvec);
    for ii = 1:row
       blurringMatrix = [];
       for jj = 1:col
           leftrange = jj-w;
           rightrange = jj+w;
           upperrange = ii-w;
           lowerrange = ii+w;
           if leftrange <= 0
              leftrange = 1; 
           end
           if rightrange > col
               rightrange = col;
           end
           if upperrange <= 0
               upperrange = 1;
           end
           if lowerrange > row
               lowerrange = row;
           end
           blurringMatrix = imgvec(upperrange:lowerrange, leftrange:rightrange);
           meansofrows = mean(blurringMatrix);
           generalmean = mean(meansofrows);
           imgvec(ii,jj) = uint8(generalmean);
       end
    end
    output = imgvec;
end