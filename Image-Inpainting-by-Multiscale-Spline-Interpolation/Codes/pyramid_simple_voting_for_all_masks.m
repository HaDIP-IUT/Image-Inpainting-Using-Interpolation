%%% inpainting new
clear; 
kodak_path = 'D:\Inpainting\Kodak\';
temp1 = dir([kodak_path '*.ras']);
i_no = 15;%numel(dir);
ir =  512; ic = 768;
img = zeros(i_no, ir, ic);
for i = 1:i_no
    img(i,:,:) = imread([kodak_path temp1(i).name]);
end
for num = 4:5
    disp('#####################')
    disp('num mask:')
    disp(num)
for m = [1 3 5]
    disp('mask_width:')
    disp(m)
    mask = imread([kodak_path, 'mask_thick_', num2str(m), '_', num2str(num), '.png']);

    for ind_r = 1:8
        for j = 1:ind_r %1:ind_r
    %         img_resized(j,:,:,:) = resized_interpolation(img , mask , 1./(2.^(j-1)));
            img_resized(j,:,:,:) = resized_interpolation(img , mask , 1./j);        
    %         img_resized(1,:,:,:) = resized_interpolation(img , mask , 1./j);        
        end


        out_m = img;
        ind_t = 1;
        % for thresh = 30:5:255
        for i = 1 : i_no
            cor_pixels = find(mask==255);
            for k = 1:numel(cor_pixels)
        %         vec = [out_h_0(i,cor_pixels(k)) , out_v_0(i,cor_pixels(k)), out_di_min45_0(i,cor_pixels(k)), out_di_plus45_0(i,cor_pixels(k))];
        %         edge_vec = [edge_h_0(i,cor_pixels(k)), edge_v_0(i,cor_pixels(k))];%,edge_135_1(i,cor_pixels(k)), edge_di45_1(i,cor_pixels(k))];
        %         [f_val, f_ind] = find(edge_vec < thresh);
        %         edge_vec_tmp = edge_vec;
        %         edge_vec(f_ind) = [];
        %         if numel(edge_vec)==0
                    out_m(i,cor_pixels(k)) = round(mean(img_resized(:,i,cor_pixels(k))));
        %         else
        %             [~,ind] = max(edge_vec_tmp);
        %             sel_vec(i,k) = vec(ind);
        %             out_m(i,cor_pixels(k))=sel_vec(i,k);
        %         end
            end
        end

        %%
        for i=1:i_no
            aa = out_m(i,:,:);
            aa = squeeze(aa);
            bb = img(i,:,:);
            bb = squeeze(bb);
            p_f( i) = psnr(aa,bb,255);
            s_f(i) = ssim(aa,bb);
            e = double(aa)-double(bb);
        %     figure,imshow(abs(e),[]);
        end
        ind_t = ind_t + 1;
        % end
        disp(ind_r)
        disp (mean(p_f))
        clear p_f img_resized
    end
end
end