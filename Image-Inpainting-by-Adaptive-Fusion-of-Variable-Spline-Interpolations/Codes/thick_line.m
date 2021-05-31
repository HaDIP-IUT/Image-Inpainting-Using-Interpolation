%%% 
% clear
% close all
path = 'D:\Local_Disk_F\uni\arshad_Dr_Samavi\1398\Inpainting\Kodak\';
% path = 'D:\Local_Disk_F\uni\arshad_Dr_Samavi\1398\Prediction\PyCodes\lenna and table\';
% path = 'C:\Users\zara\Dropbox\Inpainting\test image\';
% path = 'D:\Local_Disk_F\uni\arshad_Dr_Samavi\1398\Prediction\Kodak\';
% path = 'F:\sience\PHD\research\RNN\kodak\';
files = dir([path '*.ras']);
i1 = zeros(15,512,768, 'uint8');
% files = dir([path '*.tif']);
% i1 = zeros(2,512,512, 'uint8');
for i=1:15%length(files)
    i1(i,:,:) = imread([path files(i).name]);
end
[i_no,r,c] = size(i1);

% %%
% line_l = 50;
% mask = zeros(r, c, 'uint8');
% for i=1:30
%     x = randi([line_l,r-line_l],1,1);
% %     x = sort(x);
%     y = randi([line_l,c-line_l],1,1);
% %     y = sort(y);
%     delta_x = randi([20,2*line_l],1,1);
%     delta_y = randi([20,2*line_l],1,1);
%     nPoints = max(delta_x, delta_y)+1;
%     rIndex = round(linspace(x(1), x(1)+delta_x - line_l, nPoints));  % Row indices
%     cIndex = round(linspace(y(1), y(1)+delta_y - line_l, nPoints));  % Column indices
%     index = sub2ind(size(mask), rIndex, cIndex);     % Linear indices
%     mask(index) = 255;
%     mask(index-1) = 255;
% end
% imwrite(mask,[path 'mask.png']);

%%
mask = imread([path 'mask_thick.png']);
mask_n = uint8(~mask);
c_i = i1.*permute(repmat(mask_n,1,1,15),[3,1,2]);
% c_i = i1.*permute(repmat(mask_n,1,1,2),[3,1,2]);
% imwrite(squeeze(c_i(1,:,:)),'lena.tiff');
tic
[edge_135, out_di_min45] = directional_min45_spline(c_i , mask);
[edge_di45, out_di_plus45] = directional_plus45_spline(c_i , mask);
[edge_v, out_v] = vertical_spline(c_i, mask);
[edge_h, out_h] = horiz_spline(c_i, mask);
% out_2d = spline_2D(c_i, mask);

%%
out_m = c_i; 

%% 2D_psnr
% c_i2 = c_i+out_2d;
% for i=1:i_no
%     aa = c_i2(i,:,:);
%     aa = squeeze(aa);
%     bb = i1(i,:,:);
%     bb = squeeze(bb);
%     p_2d(i) = psnr(aa,bb,255);
%     s_2d(i) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);title('2D');
% end
% 
% 
% %% horiz_psnr
% c_i2 = c_i+out_h;
% for i=1:i_no
%     aa = c_i2(i,:,:);
%     aa = squeeze(aa);
%     bb = i1(i,:,:);
%     bb = squeeze(bb);
%     p_h(i) = psnr(aa,bb,255);
%     s_h(i) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);title('h');
% end
% 
% %% vertical_psnr
% c_i2 = c_i+out_v;
% for i=1:i_no
%     aa = c_i2(i,:,:);
%     aa = squeeze(aa);
%     bb = i1(i,:,:);
%     bb = squeeze(bb);
%     p_v(i) = psnr(aa,bb,255);
%     s_v(i) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);title('v');
% end
% 
% %% dia_mins45_psnr
% c_i2 = c_i+out_di_min45;
% for i=1:i_no
%     aa = c_i2(i,:,:);
%     aa = squeeze(aa);
%     bb = i1(i,:,:);
%     bb = squeeze(bb);
%     p_min45(i) = psnr(aa,bb,255);
%     s_min45(i) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);title('135');
% end
% 
% %% dia_plus45_psnr
% c_i2 = c_i+out_di_plus45;
% for i=1:i_no
%     aa = c_i2(i,:,:);
%     aa = squeeze(aa);
%     bb = i1(i,:,:);
%     bb = squeeze(bb);
%     p_plus45(i) = psnr(aa,bb,255);
%     s_plus45(i) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);title('45');
% end
% 
% % [X,Y] = meshgrid(1:r,c:-1:1);
% % 
% % for i = 1: i_no
% %     [mask_grad_x(i,:,:) ,mask_grad_y(i,:,:)] = gradient(double(squeeze(c_i(i,:,:))));
% %     figure();%contour(X,Y,double(squeeze(c_i(i,:,:))));
% % hold on
% % quiver(X,Y,squeeze(mask_grad_x(i,:,:)),squeeze(mask_grad_y(i,:,:)));
% % % colormap hsv
% % grid off
% % hold off
% % end
%%
ind_th = 1;
for thresh =35:35

cor_pixels = find(mask==255);
for k = 1:i_no
    for i=1:numel(cor_pixels)
%         vec = [out_h(k,cor_pixels(i)) , out_v(k,cor_pixels(i)), out_di_min45(k,cor_pixels(i)), out_di_plus45(k,cor_pixels(i)),out_2d(k,cor_pixels(i))]; 
        vec = [out_h(k,cor_pixels(i)) , out_v(k,cor_pixels(i)), out_di_min45(k,cor_pixels(i)), out_di_plus45(k,cor_pixels(i))];
        edge_vec = [edge_h(k,cor_pixels(i)), edge_v(k,cor_pixels(i))];%,edge_135(k,cor_pixels(i)), edge_di45(k,cor_pixels(i))];
        [f_val, f_ind] = find(edge_vec < thresh);
        edge_vec_tmp = edge_vec;
        edge_vec(f_ind) = [];
        [sort_vec ,sort_ind] = sort(vec);
        if numel(edge_vec)==0
            dif_vec = (diff(sort_vec))';
            if dif_vec(1) == max(dif_vec)
                sel_vec(i,k) = sum(sort_vec(2:end))/(numel(sort_vec)-1);
            elseif dif_vec(numel(sort_vec)-1) == max(dif_vec)
                sel_vec(i,k) = sum(sort_vec(1:end-1))/(numel(sort_vec)-1);
            else
                sel_vec(i,k) = mean(sort_vec);
            end
        else
            [~,ind] = max(edge_vec_tmp);
            sel_vec(i,k) = vec(ind);
        end
    end
    out_m(k,cor_pixels)=sel_vec(:,k);
end
% out_m = out_m + c_i;
for i=1:i_no
    aa = out_m(i,:,:);
    aa = squeeze(aa);
    bb = i1(i,:,:);
    bb = squeeze(bb);
    p_f(i,ind_th) = psnr(aa,bb,255);
    s_f(i,ind_th) = ssim(aa,bb);
    e = double(aa)-double(bb);
%     figure,imshow(abs(e),[]);
end
ind_th =ind_th +1;
end
toc
disp('fin')
%     for i= 1:r
%         for j = 1:c
%             vec = [out_h(k,i,j) , out_v(k,i,j), out_di_min45(k,i,j), out_di_plus45(k,i,j)];
%             [sort_vec ,sort_ind] = sort(vec);
%             dif_vec(k,:,:) = diff(sort_vec);
%         end
%     end
% end