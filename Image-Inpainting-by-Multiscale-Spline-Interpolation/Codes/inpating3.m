% function [ masklabel,output] = inpating3( input,mask )
function [ p,output] = inpating3( input,ii,mask )
% ii = input;
[Rows,Cols,n]=size(mask);

input = padarray(input,[2 2],'both');
mask = padarray(mask,[2 2],'both');



for i=3:Rows+2
    for j=3:Cols+2
       
        if(mask(i,j)==1 )
             Xq=i;
             Yq=j;
             
             
             
             Rcounter=0;
             Lcounter=0;
            
             while(mask(i,j)==1 )
             j=j-1;
             Lcounter=Lcounter+1;
            
             end   
             
             R=input(i,j);
             X4i=i;
             X4j=j;
             rj=j;
             ri=i;
             j=j-1;
             
             
             while(mask(i,j))
             j=j-1;
             end
             Q=input(i,j);
             X10i=i;
             X10j=j;
             qj=j;
             qi=i;
             
             
      
             
             
             
             
             
             
             
             
             
             j=Yq;
               while(mask(i,j) )
               j=j+1;
               Rcounter=Rcounter+1;
               end
             
             S=input(i,j);
             X5i=i;
             X5j=j;
             sj=j;
             si=i;
             j=j+1;
             
              while(mask(i,j) )
               j=j+1;
               
              end
             T=input(i,j);
             X13i=i;
             X13j=j;
       
             tj=j;
             ti=i;
             
               
             
                  %%%%%%%%%%%%%%%%%%%%%%%%Bicubic
             
              x = [1 2 3 4];
              
           
              % Y=[qi ri si ti];
              v = [input(qi,qj,1)  input(ri,rj,1)  input(si,sj,1)  input(ti,tj,1)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              rvq1=Vq;
              
              x = [1 2 3 4];
              % Y=[qi ri si ti];
             v = [input(qi,qj,2)  input(ri,rj,2)  input(si,sj,2)  input(ti,tj,2)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              gvq1=Vq;
            
             
              
                 x = [1 2 3 4];
              % Y=[qi ri si ti];
              v =  [input(qi,qj,3)  input(ri,rj,3)  input(si,sj,3)  input(ti,tj,3)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              bvq1=Vq;
              
              
              
             
              i=Xq;
              j=Yq;
             Rcounter=0;
             Lcounter=0;
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             
             while(mask(i,j))
             j=j-1;
             i=i-1;
             Lcounter=Lcounter+1;
             end   
             
             R=input(i,j);
             X6i=i;
             X6j=j;
             rj=j;
             ri=i;
             
             j=j-1;
             i=i-1;
             
             
             while(mask(i,j) )
             j=j-1;
             i=i-1;
             end
             Q=input(i,j);
             X11i=i;
             X11j=j;
             qj=j;
             qi=i;
             
             
      
             
             
             
             
             
             
             
             
             
             j=Yq;
             i=Xq;
               while(mask(i,j))
             j=j+1;
             i=i+1;
             Rcounter=Rcounter+1;
               end
             
             S=input(i,j);
             X3i=i;
             X3j=j;
             sj=j;
             si=i;
             
             j=j+1;
             i=i+1;
             
              while(mask(i,j) )
             j=j+1;
             i=i+1;
              end
             T=input(i,j);
             X12i=i;
             X12j=j;
             tj=j;
             ti=i;
             
               
             
                  %%%%%%%%%%%%%%%%%%%%%%%%Bicubic
         
              x = [1 2 3 4];
              % Y=[qi ri si ti];
              v = [input(qi,qj,1)  input(ri,rj,1)  input(si,sj,1)  input(ti,tj,1)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              rvq2=Vq;
              
              x = [1 2 3 4];
              % Y=[qi ri si ti];
             v = [input(qi,qj,2)  input(ri,rj,2)  input(si,sj,2)  input(ti,tj,2)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              gvq2=Vq;
            
             
              
                 x = [1 2 3 4];
              % Y=[qi ri si ti];
              v =  [input(qi,qj,3)  input(ri,rj,3)  input(si,sj,3)  input(ti,tj,3)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              bvq2=Vq;
             
              
               
            
              
              
              
              
              
              
              i=Xq;
              j=Yq;
              Rcounter=0;
              Lcounter=0;
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             
             while(mask(i,j) )
             j=j+1;
             i=i-1;
             Lcounter= Lcounter+1;
             end   
             
             R=input(i,j);
             X1i=i;
             X1j=j;
             rj=j;
             ri=i;
             
             j=j+1;
             i=i-1;
             
             
             while(mask(i,j) )
             j=j+1;
             i=i-1;
           
             end
             Q=input(i,j);
             X9i=i;
             X9j=j;
             qj=j;
             qi=i;
             
             
      
             
             
             
             
             
             
             
             
             
             j=Yq;
             i=Xq;
               while(mask(i,j))
             j=j-1;
             i=i+1;
             Rcounter=Rcounter+1;
               end
             
             S=input(i,j);
             X8i=i;
             X8j=j;
             sj=j;
             si=i;
             
             j=j-1;
             i=i+1;
             
              while(mask(i,j))
             j=j-1;
             i=i+1;
              end
             T=input(i,j);
             X14i=i;
             X14j=j;
             tj=j;
             ti=i;
             
               
        
                  %%%%%%%%%%%%%%%%%%%%%%%%Bicubic
             
              x = [1 2 3 4];
              % Y=[qi ri si ti];
              v = [input(qi,qj,1)  input(ri,rj,1)  input(si,sj,1)  input(ti,tj,1)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              rvq3=Vq;
              
              x = [1 2 3 4];
              % Y=[qi ri si ti];
             v = [input(qi,qj,2)  input(ri,rj,2)  input(si,sj,2)  input(ti,tj,2)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              gvq3=Vq;
            
             
              
                 x = [1 2 3 4];
              % Y=[qi ri si ti];
              v =  [input(qi,qj,3)  input(ri,rj,3)  input(si,sj,3)  input(ti,tj,3)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
               bvq3=Vq;
             
               
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               
               
              i=Xq;
              j=Yq;
              Rcounter=0;
              Lcounter=0;
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             
             while(mask(i,j) )
             i=i-1;
             j=j;
             Lcounter=Lcounter+1;
             end   
             
             R=input(i,j);
             X7i=i;
             X7j=j;
             rj=j;
             ri=i;
             
             i=i-1;
             j=j;
             
             
             while(mask(i,j))
             i=i-1;
             j=j;
             end
             Q=input(i,j);
             X15i=i;
             X15j=j;
             qj=j;
             qi=i;
             
             
      
             
             
             
             
             
             
             
             
             
             j=Yq;
             i=Xq;
               while(mask(i,j))
             i=i+1;
             j=j;
             Rcounter=Rcounter+1;
               end
             
             S=input(i,j);
             X2i=i;
             X2j=j;
             sj=j;
             si=i;
             
             i=i+1;
             j=j;
             
              while(mask(i,j))
             i=i+1;
             j=j;
              end
             T=input(i,j);
             X16i=i;
             X16j=j;
             tj=j;
             ti=i;
             
               
             
                  %%%%%%%%%%%%%%%%%%%%%%%%Bicubic
             
           
              x = [1 2 3 4];
              % Y=[qi ri si ti];
              v = [input(qi,qj,1)  input(ri,rj,1)  input(si,sj,1)  input(ti,tj,1)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              rvq4=Vq;
              
              x = [1 2 3 4];
              % Y=[qi ri si ti];
             v = [input(qi,qj,2)  input(ri,rj,2)  input(si,sj,2)  input(ti,tj,2)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
              gvq4=Vq;
            
             
              
                 x = [1 2 3 4];
              % Y=[qi ri si ti];
              v =  [input(qi,qj,3)  input(ri,rj,3)  input(si,sj,3)  input(ti,tj,3)];
              Vq = interpn(x,v,2.5,'cubic');
              % Vq = interp2(X,Y,V,Xq,Yq,'cubic');
               
             
               bvq4=Vq;
             
               
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           
               
            %  mask(Xq,Yq,1)=0;
          
            %red
            %3*4
            matris2D_1=[input(X9i,X9j,1) input(X1i,X1j,1)  input(X3i,X3j,1) input(X12i,X12j,1);  input(X10i,X10j,1) input(X4i,X4j,1) input(X5i,X5j,1) input(X13i,X13j,1) ;input(X11i,X11j,1) input(X6i,X6j,1) input(X7i,X7j,1) input(X14i,X14j,1)];
            %4*3
            matris2D_2=[input(X9i,X9j,1) input(X2i,X2j,1)  input(X12i,X12j,1) ;input(X1i,X1j,1)  input(X2i,X2j,1) input(X3i,X3j,1) ;input(X6i,X6j,1) input(X7i,X7j,1) input(X8i,X8j,1); input(X11i,X11j,1) input(X15i,X15j,1) input(X14i,X14j,1)];
       
           Rrq1=interpn( double(matris2D_1),'cubic');
           Rrq2=interpn( double(matris2D_2),'cubic');
           
           
           
             %green
            %3*4
            matris2D_1=[input(X9i,X9j,2) input(X1i,X1j,2)  input(X3i,X3j,2) input(X12i,X12j,2);  input(X10i,X10j,2) input(X4i,X4j,2) input(X5i,X5j,2) input(X13i,X13j,2) ;input(X11i,X11j,2) input(X6i,X6j,2) input(X7i,X7j,2) input(X14i,X14j,2)];
            %4*3
            matris2D_2=[input(X9i,X9j,2) input(X2i,X2j,2)  input(X12i,X12j,2) ;input(X1i,X1j,2)  input(X2i,X2j,2) input(X3i,X3j,2) ;input(X6i,X6j,2) input(X7i,X7j,2) input(X8i,X8j,2); input(X11i,X11j,2) input(X15i,X15j,2) input(X14i,X14j,2)];
       
           Grq1=interpn( double(matris2D_1),'cubic');
           Grq2=interpn( double(matris2D_2),'cubic');
           
           
           
             %blue
            %3*4
            matris2D_1=[input(X9i,X9j,3) input(X1i,X1j,3)  input(X3i,X3j,3) input(X12i,X12j,3);  input(X10i,X10j,3) input(X4i,X4j,3) input(X5i,X5j,3) input(X13i,X13j,3) ;input(X11i,X11j,3) input(X6i,X6j,3) input(X7i,X7j,3) input(X14i,X14j,3)];
            %4*3
            matris2D_2=[input(X9i,X9j,3) input(X2i,X2j,3)  input(X12i,X12j,3) ;input(X1i,X1j,3)  input(X2i,X2j,3) input(X3i,X3j,3) ;input(X6i,X6j,3) input(X7i,X7j,3) input(X8i,X8j,3); input(X11i,X11j,3) input(X15i,X15j,3) input(X14i,X14j,3)];
       
           Brq1=interpn( double(matris2D_1),'cubic');
           Brq2=interpn( double(matris2D_2),'cubic');
          
          A=[rvq1  rvq2 rvq3 rvq4];
          min1=(sum(A)./4);
          if(abs(rvq1-min1)==max([abs(rvq1-min1) abs(rvq2-min1) abs(rvq3-min1) abs(rvq4-min1)]))
          rvq1=(sum([rvq2 rvq3 rvq4])./3);
          
          end
          
          if(abs(rvq2-min1)==max([abs(rvq1-min1) abs(rvq2-min1) abs(rvq3-min1) abs(rvq4-min1)]))
          rvq2=(sum([rvq1 rvq3 rvq4])./3);
          end
          
          if(abs(rvq3-min1)==max([abs(rvq1-min1) abs(rvq2-min1) abs(rvq3-min1) abs(rvq4-min1)]))
          rvq3=(sum([rvq2 rvq1 rvq4])./3);
          end
          
         if(abs(rvq4-min1)==max([abs(rvq1-min1) abs(rvq2-min1) abs(rvq3-min1) abs(rvq4-min1)]))
          rvq4=(sum([rvq2 rvq3 rvq1])./3);
          end
          
          
          B=[gvq1  gvq2 gvq3 gvq4];
          min1=(sum(B)./4);
          if(abs(gvq1-min1)==max([abs(gvq1-min1) abs(gvq2-min1) abs(gvq3-min1) abs(gvq4-min1)]))
          gvq1=(sum([gvq2 gvq3 gvq4])./3);
          end
          
          if(abs(gvq2-min1)==max([abs(gvq1-min1) abs(gvq2-min1) abs(gvq3-min1) abs(gvq4-min1)]))
          gvq2=(sum([gvq1 gvq3 gvq4])./3);
          end
          
          if(abs(gvq3-min1)==max([abs(gvq1-min1) abs(gvq2-min1) abs(gvq3-min1) abs(gvq4-min1)]))
          gvq3=(sum([gvq2 gvq1 gvq4])./3);
          end
          
         if(abs(gvq4-min1)==max([abs(gvq1-min1) abs(gvq2-min1) abs(gvq3-min1) abs(gvq4-min1)]))
          gvq4=(sum([gvq2 gvq3 gvq1])./3);
          end
          
          
          
          
          C=[bvq1  bvq2 bvq3 bvq4];
           min1=(sum(C)./4);
          if(abs(bvq1-min1)==max([abs(bvq1-min1) abs(bvq2-min1) abs(bvq3-min1) abs(bvq4-min1)]))
          bvq1=(sum([bvq2 bvq3 bvq4])./3);
          end
          
          if(abs(bvq2-min1)==max([abs(bvq1-min1) abs(bvq2-min1) abs(bvq3-min1) abs(bvq4-min1)]))
          bvq2=(sum([bvq1 bvq3 bvq4])./3);
          end
          
          if(abs(bvq3-min1)==max([abs(bvq1-min1) abs(bvq2-min1) abs(bvq3-min1) abs(bvq4-min1)]))
          bvq3=(sum([bvq2 bvq1 bvq4])./3);
          end
          
         if(abs(bvq4-min1)==max([abs(bvq1-min1) abs(bvq2-min1) abs(bvq3-min1) abs(bvq4-min1)]))
          bvq4=(sum([bvq2 bvq3 bvq1])./3);
          end
          
          
                % mask(Xq,Yq,1)=0;
               A=[rvq1  rvq2 rvq3 rvq4 Rrq1(3,4) Rrq2(4,3)];
               B=[gvq1  gvq2 gvq3 gvq4 Grq1(3,4) Grq2(4,3) ];
               C=[bvq1  bvq2 bvq3 bvq4 Brq1(3,4)  Brq2(4,3) ];
               input(Xq,Yq,1)=(sum(A)./6);
               input(Xq,Yq,2)=(sum(B)./6);
               input(Xq,Yq,3)=(sum(C)./6);
            
        
             i=Xq;
             j=Yq;
             
              
         end
     end
end
       output=input(3:Rows+2,3:Cols+2,:);
       
%        imwrite((output),'a1.tiff');
       p = psnr(output,ii,255);
%        e = double(output) -double(ii);
%        imshow(output);
      
%       imshow(mask);
        
end


    

