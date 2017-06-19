function [TranformedIm] = ComputeProjective_YOTAM(Im, H)
H=H.';
[m,n] = size(Im);
HH = inv(H);
TranformedIm = uint8(0);
TranformedIm(m,n) = TranformedIm;
for i=1:m
   for j=1:n
      vec = [i,j,1].';
      vec_trans = HH*vec;
      vec_trans = vec_trans./vec_trans(3);
      x = round(vec_trans(1));
      y = round(vec_trans(2));
      if x<1 || x>m ||y<1 || y>n
          'here1';
          TranformedIm(i,j) = 0;
      else
          TranformedIm(i,j) = Im(x,y);
          TranformedIm(i,j);
      end
%         
%          vec_trans = H*vec;
%          vec_trans = vec_trans./vec_trans(3);
%          [i,j,vec_trans(1),vec_trans(2)]
%         x = uint16(round(vec_trans(1)));
%         y = uint16(round(vec_trans(2)));
%         if x<1 || x>m ||y<1 || y>n
%             'not'
%         else
%             TranformedIm(x,y) = Im(i,j);
%         end
   

   end
end


end

