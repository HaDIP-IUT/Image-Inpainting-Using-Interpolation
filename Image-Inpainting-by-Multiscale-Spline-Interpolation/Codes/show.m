num_img = 5;
tmp = double(squeeze(c_i(num_img,:,:)))+double(mask);
tmp = cat(3,tmp,tmp,tmp);
tmp1 = squeeze(img(num_img,:,:));
tmp1 = cat(3,tmp1,tmp1,tmp1);
mask_b = uint8(mask==255);
[p(i),output] = inpating3( tmp,tmp1,mask_b);
 

yrange = 420:520;
xrange = 180:280;
% figure(); subplot(2,2,1);imshow(squeeze(c_i(num_img,207:371,299:695)),[]); title('masked Image')
% subplot(2,2,2);imshow(squeeze(output(207:371,299:695,1)),[]);title('Motmaen')
% subplot(2,2,3);imshow(squeeze(out_m(num_img,207:371,299:695)),[]);title('ours: new')
% subplot(2,2,4);imshow(squeeze(img_resized(1,num_img,207:371,299:695)),[]);title('ours: previousre')

% figure();imshow(squeeze(c_i(num_img,207:371,299:695))+mask(207:371,299:695),[]); title('masked Image', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17);
% figure();imshow(squeeze(output(207:371,299:695,1)),[]);title('Motmaen', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)
% figure();imshow(squeeze(img_resized(1,num_img,207:371,299:695)),[]);title('ours: previous', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)
% figure();imshow(squeeze(out_m(num_img,207:371,299:695)),[]);title('ours: new', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)


figure();imshow(squeeze(c_i(num_img,xrange,yrange))+mask(xrange,yrange),[]); title('masked Image', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17);
figure();imshow(squeeze(output(xrange,yrange,1)),[]);title('Motmaen', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)
figure();imshow(squeeze(img_resized(1,num_img,xrange,yrange)),[]);title('ours: previous', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)
figure();imshow(squeeze(out_m(num_img,xrange,yrange)),[]);title('ours: new', 'Interpreter' ,'latex', 'FontWeight', 'bold', 'FontSize', 17)
