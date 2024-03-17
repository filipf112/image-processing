function histogram = to_hist(img)
[row,col] = size(img);
histogram = zeros(256);
    for x=1:row
        for y=1:col
            val=img(x,y)+1;
            histogram(val) = histogram(val)+1;
        end
    end
end
