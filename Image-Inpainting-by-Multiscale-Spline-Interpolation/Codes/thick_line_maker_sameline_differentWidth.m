path = 'D:\Local_Disk_F\uni\arshad_Dr_Samavi\1398\Inpainting\Kodak\masks\';

line_l = 200;
number_line = 6;
mask1 = zeros(r, c, 'uint8');mask3 = zeros(r, c, 'uint8');mask5 = zeros(r, c, 'uint8');
mask7 = zeros(r, c, 'uint8');mask9 = zeros(r, c, 'uint8');mask11 = zeros(r, c, 'uint8');
mask13 = zeros(r, c, 'uint8');mask16 = zeros(r, c, 'uint8');
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
    
    mask1(index) = 255;mask3(index) = 255;mask5(index) = 255;mask7(index) = 255;
    mask9(index) = 255;mask11(index) = 255;mask13(index) = 255;mask16(index) = 255;
    
    mask3(index-1) = 255;mask5(index-1) = 255;mask7(index-1) = 255;mask9(index-1) = 255;
    mask11(index-1) = 255;mask13(index-1) = 255;mask16(index-1) = 255;
    
    mask3(index+1) = 255;mask5(index+1) = 255;mask7(index+1) = 255;mask9(index+1) = 255;
    mask11(index+1) = 255;mask13(index+1) = 255;mask16(index+1) = 255;
    
    mask5(index-2) = 255;mask7(index-2) = 255;mask9(index-2) = 255;
    mask11(index-2) = 255;mask13(index-2) = 255;mask16(index-2) = 255;
    
    mask5(index+2) = 255;mask7(index+2) = 255;mask9(index+2) = 255;
    mask11(index+2) = 255;mask13(index+2) = 255;mask16(index+2) = 255;
    
    mask7(index-3) = 255;mask9(index-3) = 255;mask11(index-3) = 255;
    mask13(index-3) = 255;mask16(index-3) = 255;
    
    mask7(index+3) = 255;mask9(index+3) = 255;mask11(index+3) = 255;
    mask13(index+3) = 255;mask16(index+3) = 255;
    
    mask9(index-4) = 255;mask11(index-4) = 255;
    mask11(index-4) = 255;mask16(index-4) = 255;
    
    mask9(index+4) = 255;mask11(index+4) = 255;
    mask11(index+4) = 255;mask16(index+4) = 255;
    
    mask11(index-5) = 255;mask13(index-5) = 255;mask16(index-5) = 255;
    
    mask11(index+5) = 255;mask13(index+5) = 255;mask16(index+5) = 255;
    
    mask13(index-6) = 255;mask16(index-6) = 255;
    
    mask13(index+6) = 255;mask16(index+6) = 255;
    
    mask16(index+7) = 255;
    mask16(index-7) = 255;
    mask16(index+8) = 255;
end
figure; imshow(mask);
imwrite(mask1,[path 'mask_thick_1_4.png']);
imwrite(mask3,[path 'mask_thick_3_4.png']);
imwrite(mask5,[path 'mask_thick_5_4.png']);
imwrite(mask7,[path 'mask_thick_7_4.png']);
imwrite(mask9,[path 'mask_thick_9_4.png']);
imwrite(mask11,[path 'mask_thick_11_4.png']);
imwrite(mask13,[path 'mask_thick_13_4.png']);
imwrite(mask16,[path 'mask_thick_16_4.png']);
