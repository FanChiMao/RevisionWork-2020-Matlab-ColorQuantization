function color_difference = C_D(orignal,quantized)
    cd = 0;
    o = rgb2lab(orignal);
    q = rgb2lab(quantized);
    [IoW,IoL,c] = size(orignal);
    O = reshape(o,IoW*IoL,c);
    Q = reshape(q,IoW*IoL,c);
    for i = 1:IoW*IoL
       cd = cd + dist(O(i,:),Q(i,:)'); 
    end
    color_difference = cd/(IoW*IoL);

end
