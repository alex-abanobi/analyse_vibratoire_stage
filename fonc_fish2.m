function Z_fen_group_fishedin = fonc_fish2(Z_fen_group)
    faulty_captors = [4, 9, 29];
    cdef = 1;
    ccdef = 1;
   
   
      for i = 1:size(Z_fen_group,2)
        if ismember(i, faulty_captors) == 1
            Z_fen_group_fishedout(:,ccdef) = Z_fen_group(:,i);
            ccdef = ccdef + 1;

        else 
            Z_fen_group_fishedin(:,cdef) = Z_fen_group(:,i);
            cdef = cdef + 1;
        end
      end
      
      
    
      
      
      
      
%       for i = 1:size(Z_fen_group,2)
%         if mod(i,6) == 1 && i ~= 1 || ismember(i, faulty_captors) == 1
%             Z_fen_group_fishedout(:,ccdef) = Z_fen_group(:,i);
%             ccdef = ccdef + 1;
% 
%         else 
%             Z_fen_group_fishedin(:,cdef) = Z_fen_group(:,i);
%             cdef = cdef + 1;
%         end
%         
%       end
%       

end