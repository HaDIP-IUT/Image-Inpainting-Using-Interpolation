path = 'D:\Local_Disk_F\uni\arshad_Dr_Samavi\1398\Inpainting\Kodak\';

line_l = 200;
number_line = 6;
mask = zeros(r, c, 'uint8');
for i=1:number_line
    x = randi([line_l,r-line_l],1,1);
%     x = sort(x);
    y = randi([line_l,c-line_l],1,1);
%     y = sort(y);
    delta_x = randi([180,2*line_l],1,1);
    delta_y = randi([180,2*line_l],1,1);
    nPoints = max(delta_x, delta_y)+1;
    rIndex = round(linspace(x(1), x(1)+delta_x - line_l, nPoints));  % Row indices
    cIndex = round(linspace(y(1), y(1)+delta_y - line_l, nPoints));  % Column indices
    index = sub2ind(size(mask), rIndex, cIndex);     % Linear indices
    mask(index) = 255;
    mask(index-1) = 255;
    mask(index+1) = 255;
    mask(index+2) = 255;
    mask(index-2) = 255;
    mask(index+3) = 255;
    mask(index-3) = 255;
    mask(index+4) = 255;
    mask(index-4) = 255;
    mask(index+5) = 255;
    mask(index-5) = 255;
    mask(index+6) = 255;
    mask(index-6) = 255;
%     mask(index+7) = 255;
%     mask(index-7) = 255;
%     mask(index+8) = 255;
end
figure; imshow(mask);
imwrite(mask,[path 'mask_thick_13_5.png']);