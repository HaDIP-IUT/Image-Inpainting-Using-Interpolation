function out_2d = spline_2D (c_i, mask)
[ir,ic] = find(mask==255);
[i_no,r,c] = size(c_i);

out_2d = zeros([i_no,r,c]);
for j=1:i_no
    for i=1:length(ir)
    
    %%% number of horizontal missed pixels around current missed pixel
        %%
        h_2 = 0;
        while mask(ir(i),ic(i)-h_2) > 0 
            h_2 = h_2+1;
            if ic(i) - h_2 < 1
                break
            end
        end
        %%
        h_1 = 0;
        while mask(ir(i),ic(i)+h_1) > 0 
            h_1 = h_1+1;
            if ic(i)+h_1 > c
                break
            end
        end
        
    %%% number of vetrical missed pixels around current missed pixel
        %%
        v_2 = 0;
        while mask(ir(i)-v_2,ic(i)) > 0 
            v_2 = v_2+1;
            if ir(i) - v_2 < 1
                break
            end
        end
        %%
        v_1 = 0;
        while mask(ir(i)+v_1,ic(i)) > 0 
            v_1 = v_1+1;
            if ir(i)+v_1 > r
                break
            end
        end


    %%% number of 135-degree dimentionql missed pixels around current missed pixel
        %%
        di135_2 = 0;
        while mask(ir(i)-di135_2,ic(i)-di135_2) > 0 
            di135_2 = di135_2+1;
            if ic(i) - di135_2 < 1 || ir(i) - di135_2 < 1
                break
            end
        end
        %%
        di135_1 = 0;
        while mask(ir(i)+di135_1,ic(i)+di135_1) > 0 
            di135_1 = di135_1+1;
            if ic(i)+di135_1 > c || ir(i)+di135_1 > r 
                break
            end
        end
        
    %%% number of 45-degree dimentionql missed pixels around current missed pixel
        %%
        di45_2 = 0;
        while mask(ir(i)+di45_2,ic(i)-di45_2) > 0 
            di45_2 = di45_2+1;
            if ic(i) - di45_2 < 1 || ir(i) + di45_2 > r
                break
            end
        end
        %%
        di45_1 = 0;
        while mask(ir(i)-di45_1,ic(i)+di45_1) > 0 
            di45_1 = di45_1+1;
            if ic(i)+di45_1 > c || ir(i)-di45_1 < 1 
                break
            end
        end
        spline_mat(1,:) = [c_i(j, ir(i)-di45_2-1,ic(i)+di45_2+1), c_i(j, ir(i),ic(i)-h_2-1) ,c_i(j, ir(i)-di135_2-1,ic(i)-di135_2-1), c_i(j, ir(i)-v_2-2,ic(i))];
        spline_mat(2,:) = [c_i(j, ir(i)-di45_2,ic(i)+di45_2), c_i(j, ir(i),ic(i)-h_2) ,c_i(j, ir(i)-di135_2,ic(i)-di135_2), c_i(j, ir(i)-v_2-1,ic(i))];
        spline_mat(3,:) = [c_i(j, ir(i)+di45_1,ic(i)-di45_1), c_i(j, ir(i),ic(i)+h_1) ,c_i(j, ir(i)+di135_1,ic(i)+di135_1), c_i(j, ir(i)+v_1,ic(i))];
        spline_mat(4,:) = [c_i(j, ir(i)+di45_1+1,ic(i)-di45_1-1), c_i(j, ir(i),ic(i)+h_1+1) ,c_i(j, ir(i)+di135_1+1,ic(i)+di135_1+1), c_i(j, ir(i)+v_1+1,ic(i))];
        pred = interpn(double(spline_mat),'cubic');
        out_2d(j,ir(i),ic(i))= pred(4,4);
    end   
end
out_2d = uint8(round(out_2d));
end