function [edge_135, out_di] = directional_min45_spline(c_i , mask)
%% directional inpainting
[ir,ic] = find(mask==255);
[i_no,r,c] = size(c_i);
edge_w = 1;
edge_135 = zeros([i_no,r,c]);
out_di = zeros([i_no,r,c]);
for j=1:i_no
    for i=1:c
        ind = find(ic==i);
        le = length(ind);
        if le ~=0
%             tmp = mask(ir(ind),i); 
            for k=1:le
                x1 = [];
                x2 = [];
                i_x1 = 0;
                tt = [];
                tt_plus = [];
                tt_min = [];
                while mask(ir(ind(k))+i_x1,ic(ind(k))+i_x1) == 255 && ir(ind(k))+i_x1<r && ic(ind(k))+i_x1<c
                    tt = [tt mask(ir(ind(k))+i_x1,ic(ind(k))+i_x1)];
%                     x1 = [x1 , c_i(j,ir(ind(k))+x,ic(ind(k))-1)];
%                     x2 = [x2 , c_i(j,ir(ind(k))+x,ic(ind(k))+1)];
                    i_x1 = i_x1+1;
                end
                i_x2 = 0;
                while mask(ir(ind(k))-i_x2,ic(ind(k))-i_x2) == 255 && ir(ind(k))-i_x2 >1 && ic(ind(k))-i_x2 >1
%                     x1 = [x1 , c_i(j,ir(ind(k))-x,ic(ind(k))-1)];
%                     x2 = [x2 , c_i(j,ir(ind(k))-x,ic(ind(k))+1)];
                    i_x2 = i_x2+1;
                end
                
                if ir(ind(k))-(i_x2)-(i_x1)+1 > 0 && ic(ind(k))-(i_x2)-(i_x1)+1 > 0
                    row_x1 = ir(ind(k))-(i_x2)-(i_x1)+1:ir(ind(k))-(i_x2);
                    col_x1 = ic(ind(k))-(i_x2)-(i_x1)+1:ic(ind(k))-(i_x2);
                    indexes = sub2ind([r,c],row_x1,col_x1);
                    x1 = c_i(j,indexes);
                    row_x1 = ir(ind(k))-(i_x2)-(i_x1)+1-edge_w:ir(ind(k))-(i_x2)-edge_w;
                    col_x1 = ic(ind(k))-(i_x2)-(i_x1)+1+edge_w:ic(ind(k))-(i_x2)+edge_w;
                    indexes = sub2ind([r,c],row_x1,col_x1);
                    x1_plus = c_i(j,indexes);%c_i(j,ir(ind(k))-(i_x2)-(i_x1)+1-edge_w:ir(ind(k))-(i_x2)-edge_w,ic(ind(k))-(i_x2)-(i_x1)+1+edge_w:ic(ind(k))-(i_x2)+edge_w);
                    row_x1 = ir(ind(k))-(i_x2)-(i_x1)+1+edge_w:ir(ind(k))-(i_x2)+edge_w;
                    col_x1 = ic(ind(k))-(i_x2)-(i_x1)+1-edge_w:ic(ind(k))-(i_x2)-edge_w;
                    indexes = sub2ind([r,c],row_x1,col_x1);
                    x1_min = c_i(j,indexes);%c_i(j,ir(ind(k))-(i_x2)-(i_x1)+1+edge_w:ir(ind(k))-(i_x2)+edge_w,ic(ind(k))-(i_x2)-(i_x1)+1-edge_w:ic(ind(k))-(i_x2)-edge_w);
%                     x1 = c_i(j,ir(ind(k))-2*(i_x2)+1:ir(ind(k))-(i_x2),ic(ind(k)));
                elseif ir(ind(k))-(i_x2)> 0 || ic(ind(k))-(i_x2)> 0
                    row_x1 = 1:ir(ind(k))-(i_x2);
                    col_x1 = 1:ic(ind(k))-(i_x2);
                    num_r1 = length(row_x1);
                    num_c1 = length(col_x1);
                    num_x1 = min(num_r1, num_c1);
                    col_x1 = ic(ind(k))-(i_x2)-num_x1+1:ic(ind(k))-(i_x2);
                    row_x1 = ir(ind(k))-(i_x2) - num_x1+1:ir(ind(k))-(i_x2);
                    indexes = sub2ind([r,c],row_x1,col_x1);
                    x1 = c_i(j,indexes);
%                     x1 = c_i(j,1:ir(ind(k))-(i_x2),ic(ind(k))); 
%                 elseif ic(ind(k))-(i_x2)> 0
%                     col_x1 = 1:ic(ind(k))-(i_x2);
%                     
%                     
%                     indexes = sub2ind([r,c],row_x1,col_x1);
%                     x1 = c_i(indexes);
%                     x1 = c_i(j,ir(ind(k)),1:ic(ind(k)-(i_x2))); 
                else
                    x1 = 128; 
                    x1_plus = 128;
                    x1_min = 128;
                end
                
                x1 = double(squeeze(x1));
                
                if ir(ind(k))+(i_x1)+(i_x2) < r+1 && ic(ind(k))+(i_x1)+(i_x2) < c+1
                    row_x2 = ir(ind(k))+i_x1:ir(ind(k))+(i_x1)+(i_x2)-1;
                    col_x2 = ic(ind(k))+i_x1:ic(ind(k))+(i_x1)+(i_x2)-1;
                    indexes = sub2ind([r,c],row_x2,col_x2);
                    x2 = c_i(j,indexes);
                    row_x2 = ir(ind(k))+i_x1-edge_w:ir(ind(k))+(i_x1)+(i_x2)-1-edge_w;
                    col_x2 = ic(ind(k))+i_x1+edge_w:ic(ind(k))+(i_x1)+(i_x2)-1+edge_w;
                    indexes = sub2ind([r,c],row_x2,col_x2);
                    x2_plus = c_i(j,indexes);%c_i(j,ir(ind(k))+i_x1-edge_w:ir(ind(k))+(i_x1)+(i_x2)-1-edge_w,ic(ind(k))+i_x1+edge_w:ic(ind(k))+(i_x1)+(i_x2)-1+edge_w);
                    row_x2 = ir(ind(k))+i_x1+edge_w:ir(ind(k))+(i_x1)+(i_x2)-1+edge_w;
                    col_x2 = ic(ind(k))+i_x1-edge_w:ic(ind(k))+(i_x1)+(i_x2)-1-edge_w;
                    indexes = sub2ind([r,c],row_x2,col_x2);
                    x2_min = c_i(j,indexes);%c_i(j,ir(ind(k))+i_x1+edge_w:ir(ind(k))+(i_x1)+(i_x2)-1+edge_w,ic(ind(k))+i_x1-edge_w:ic(ind(k))+(i_x1)+(i_x2)-1-edge_w);
%                     x2 = c_i(j,ir(ind(k))+i_x1+1:ir(ind(k))+(i_x1)+(i_x2),ic(ind(k)));
                elseif ir(ind(k))+i_x1< r+1 || ic(ind(k))+i_x1< c+1
                    row_x2 = ir(ind(k))+i_x1:r;
                    col_x2 = ic(ind(k))+i_x1:c;
                    num_r2 = length(row_x2);
                    num_c2 = length(col_x2);
                    num_x2 = min(num_r2 , num_c2);
                    col_x2 = ic(ind(k))+i_x1:ic(ind(k))+(i_x1)+num_x2-1;
                    row_x2 = ir(ind(k))+i_x1:ir(ind(k))+i_x1+num_x2-1;
                    indexes = sub2ind([r,c],row_x2,col_x2);
                    x2 = c_i(j,indexes);
%                     x2 = c_i(j,ir(ind(k))+i_x1+1:r,ic(ind(k)));
%                 elseif 
%                     
%                     num_x2 = length(row_x2);
%                     
%                     indexes = sub2ind([r,c],row_x2,col_x1);
%                     x2 = c_i(indexes);
%                     x2 = c_i(j,ir(ind(k))+i_x1+1:r,ic(ind(k)));
                else
                    x2 = 128; 
                    x2_plus = 128;
                    x2_min = 128;
                end
                x2 = double(squeeze(x2));
                
                x2_plus = (squeeze(x2_plus));
                x2_min = (squeeze(x2_min));
                x1_plus = (squeeze(x1_plus));
                x1_min = (squeeze(x1_min));
                
                i_x2 = length(x1);
                i_x1 = length(x2);
                tt = double([x1 x2]);
                tt_plus = double([x1_plus x2_plus ]);
                tt_min = double([x1_min x2_min ]);
                
                
%                 edge_135(j,ir(ind(k)),ic(ind(k))) = (abs(mean(x1) - mean(x2)));
                t1 = 1:i_x2;
                t2 = i_x2+2:i_x2+i_x1+1;
                yh = interp1([t1 t2],tt,i_x2+1,'pchip');
                ind1 = find((tt_plus==0)|(tt_min==0));
                tt(ind1) = [];
                tt_plus(ind1) = [];
                tt_min(ind1) = [];
                edge_135(j,ir(ind(k)),ic(ind(k))) = max(mean(abs(tt-tt_plus)),mean(abs(tt-tt_min)));
                if isnan(edge_135(j,ir(ind(k)),ic(ind(k))))==1
                    edge_135(j,ir(ind(k)),ic(ind(k))) = 0;
                end
%                 yh = spline([t1 t2],tt,i_x2+1);
%                 x1 = c_i(j,ir(ind(k))-(i_x2),ic(ind(k)));
%                 x2 = c_i(j,ir(ind(k))+(i_x1),ic(ind(k)));
%                 tt = double([x1 x2]);
%                 yh = spline([1 3],tt,2);
                out_di(j,ir(ind(k)),ic(ind(k)))=yh;
            end
        end
    end
end
out_di = uint8(round(out_di));
end