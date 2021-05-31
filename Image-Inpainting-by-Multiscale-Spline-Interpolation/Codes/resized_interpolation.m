function img_resized = resized_interpolation(img , mask , ratio)
[i_no , lr , lc] = size(img);
des_img = zeros(i_no,  lr , lc);
des_img_r = zeros(i_no, ceil(lr*ratio), ceil(lc*ratio));
img_resized = zeros(i_no,  lr , lc);
mask_r = imresize(mask, ratio,'nearest');
for i = 1 : i_no
    des_img(i,:,:) = squeeze(img(i,:,:)).* double(~mask);
    des_img_r(i,:,:) = imresize(squeeze(des_img(i,:,:)), ratio,'nearest');
end

[edge_135_r, out_di_min45_r] = directional_min45_spline(des_img_r , mask_r);
[edge_di45_0, out_di_plus45_r] = directional_plus45_spline(des_img_r , mask_r);
[edge_v_r, out_v_r] = vertical_spline(des_img_r, mask_r);
[edge_h_r, out_h_r] = horiz_spline(des_img_r, mask_r);
% out_2d_r = spline_2D(des_img_r, mask);

out_m_r = des_img_r;

% edge_cnt_0 = 0;
thresh = 25;
cor_pixels = find(mask_r==255);
for k = 1:i_no
    for i=1:numel(cor_pixels)
        vec = [out_h_r(k,cor_pixels(i)) , out_v_r(k,cor_pixels(i)), out_di_min45_r(k,cor_pixels(i)), out_di_plus45_r(k,cor_pixels(i))];
        edge_vec = [edge_h_r(k,cor_pixels(i)), edge_v_r(k,cor_pixels(i))];%,edge_135(k,cor_pixels(i)), edge_di45(k,cor_pixels(i))];
        [f_val, f_ind] = find(edge_vec < thresh);
        edge_vec_tmp = edge_vec;
        edge_vec(f_ind) = [];
        [sort_vec ,sort_ind] = sort(vec);
        if numel(edge_vec)==0
            dif_vec = (diff(sort_vec))';
            if dif_vec(1) == max(dif_vec)
                sel_vec_r(i,k) = sum(sort_vec(2:end))/(numel(sort_vec)-1);
            elseif dif_vec(numel(sort_vec)-1) == max(dif_vec)
                sel_vec_r(i,k) = sum(sort_vec(1:end-1))/(numel(sort_vec)-1);
            else
                sel_vec_r(i,k) = mean(sort_vec);
            end
        else
%             edge_cnt_0 = edge_cnt_0 + 1;
            [~,ind] = max(edge_vec_tmp);
            sel_vec_r(i,k) = vec(ind);
        end
    end
    out_m_r(k,cor_pixels)=sel_vec_r(:,k);
    img_resized(k,:,:) = imresize(squeeze(out_m_r(k,:,:)), [lr , lc]);
end



% for i=1:i_no
%     aa = out_m_r(i,:,:);
%     aa = squeeze(aa);
%     bb = img(i,:,:);
%     bb = squeeze(bb);
%     p_f0(i,ind_th) = psnr(aa,bb,255);
%     s_f0(i,ind_th) = ssim(aa,bb);
%     e = double(aa)-double(bb);
% %     figure,imshow(abs(e),[]);
% end
end