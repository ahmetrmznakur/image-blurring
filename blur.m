function output = blur(img, w)
    % takes two inputs img and w,
    %  img is a two dimensional image, hence vector not array
    %  w is a number indicates how much you want to blur the image
    %  as the w increases blurring increases
    %  function blurs the uploaded image
    %  and returns as a two dimensional matrix
    %  for showing, you have to use imshow to output
    imgvec = imread(img);
    [row, col] = size(imgvec);
    for ii = 1:row
       blurringMatrix = [];  % a matrix created for to take the mean of the uint8 nums around a point
       for jj = 1:col
           leftrange = jj-w;   % w detrmines how wide matrix will be so how much the image will be blurred
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
           generalmean = mean(meansofrows);      %while blurring to preserve the general nature of image code takes mean of the matrix
           imgvec(ii,jj) = uint8(generalmean);
       end
    end
    output = imgvec;
end
