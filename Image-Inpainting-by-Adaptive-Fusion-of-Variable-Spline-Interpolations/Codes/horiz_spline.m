function [edge_h, out_h] = horiz_spline(c_i, mask)
[ir,ic] = find(mask==255);
[i_no,r,c] = size(c_i);
edge_w = 1;
out_h = zeros([i_no,r,c]);
edge_h = zeros([i_no,r,c]);
for j=1:i_no
    for i=1:r
        ind = find(ir==i);
        le = length(ind);
        if le ~=0
%             tmp = mask(ir(ind),i); 
            for k=1:le
                x1 = [];
                x2 = [];
                i_x1 = 0;
                tt = [];
                while mask(ir(ind(k)),ic(ind(k))+i_x1) == 255 && ic(ind(k))+i_x1<c
                    tt = [tt mask(ir(ind(k)),ic(ind(k))+i_x1)];
%                     x1 = [x1 , c_i(j,ir(ind(k))+x,ic(ind(k))-1)];
%                     x2 = [x2 , c_i(j,ir(ind(k))+x,ic(ind(k))+1)];
                    i_x1 = i_x1+1;
                end
                i_x2 = 0;
                while mask(ir(ind(k)),ic(ind(k))-i_x2) == 255 && ic(ind(k))-i_x2 >1
%                     x1 = [x1 , c_i(j,ir(ind(k))-x,ic(ind(k))-1)];
%                     x2 = [x2 , c_i(j,ir(ind(k))-x,ic(ind(k))+1)];
                    i_x2 = i_x2+1;
                end
                if ic(ind(k))-(i_x2)-(i_x1)+1 > 0
                    x1 = c_i(j,ir(ind(k)),ic(ind(k))-(i_x2)-(i_x1)+1:ic(ind(k))-(i_x2));
                    x1_plus = c_i(j,ir(ind(k))+edge_w,ic(ind(k))-(i_x2)-(i_x1)+1:ic(ind(k))-(i_x2));
                    x1_min = c_i(j,ir(ind(k))-edge_w,ic(ind(k))-(i_x2)-(i_x1)+1:ic(ind(k))-(i_x2));
                elseif ic(ind(k))-(i_x2)> 0
                    x1 = c_i(j,ir(ind(k)),1:ic(ind(k))-(i_x2));
                    x1_plus = c_i(j,ir(ind(k))+edge_w,1:ic(ind(k))-(i_x2));
                    x1_min = c_i(j,ir(ind(k))-edge_w,1:ic(ind(k))-(i_x2));
                else
                    x1 = 128; 
                    x1_plus = 128;
                    x1_min = 128;
                end
                x1 = double(squeeze(x1));
                x1 = x1';
                if ic(ind(k))+(i_x1)+(i_x2) < c+1
                    x2 = c_i(j,ir(ind(k)),ic(ind(k))+i_x1:ic(ind(k))+(i_x1)+(i_x2)-1);
                    x2_plus = c_i(j,ir(ind(k))+edge_w,ic(ind(k))+i_x1:ic(ind(k))+(i_x1)+(i_x2)-1);
                    x2_min = c_i(j,ir(ind(k))-+edge_w,ic(ind(k))+i_x1:ic(ind(k))+(i_x1)+(i_x2)-1);
                elseif ic(ind(k))+i_x1< c+1
                    x2 = c_i(j,ir(ind(k)),ic(ind(k))+i_x1:c);
                    x2_plus = c_i(j,ir(ind(k))+edge_w,ic(ind(k))+i_x1:c);
                    x2_min = c_i(j,ir(ind(k))-+edge_w,ic(ind(k))+i_x1:c);
                else
                    x2 = 128; 
                    x2_plus = 128;
                    x2_min = 128;
                end
                x2 = double(squeeze(x2));
                x2 = x2';
                
                x2_plus = (squeeze(x2_plus))';
                x2_min = (squeeze(x2_min))';
                x1_plus = (squeeze(x1_plus))';
                x1_min = (squeeze(x1_min))';
                
                i_x2 = length(x1);
                i_x1 = length(x2);
                tt = double([x1 x2]);
                tt_plus = double([x1_plus x2_plus ]);
                tt_min = double([x1_min x2_min ]);
                
%                 edge_h(j,ir(ind(k)),ic(ind(k))) = (abs(mean(x1) - mean(x2)));
                t1 = 1:i_x2;
                t2 = i_x2+2:i_x2+i_x1+1;
                yh = interp1([t1 t2],tt,i_x2+1,'pchip');
                ind1 = find((tt_plus==0)|(tt_min==0));
                tt(ind1) = [];
                tt_plus(ind1) = [];
                tt_min(ind1) = [];
                edge_h(j,ir(ind(k)),ic(ind(k))) = max(mean(abs(tt-tt_plus)),mean(abs(tt-tt_min)));
                if isnan(edge_h(j,ir(ind(k)),ic(ind(k))))==1
                    edge_h(j,ir(ind(k)),ic(ind(k))) = 0;
                end
%                 yh = spline([t1 t2],tt,i_x2+1);
%                 x1 = c_i(j,ir(ind(k))-(i_x2),ic(ind(k)));
%                 x2 = c_i(j,ir(ind(k))+(i_x1),ic(ind(k)));
%                 tt = double([x1 x2]);
%                 yh = spline([1 3],tt,2);
                out_h(j,ir(ind(k)),ic(ind(k)))=yh;
            end
        end
    end
end
out_h = uint8(round(out_h));
end