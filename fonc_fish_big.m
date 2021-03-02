function Z_fen_group_fishedin = fonc_fish_big(Z_fen_group)
    faulty_captors = [4, 10, 16, 21, 29, 32, 38, 46, 52, 56, 64, 68, 76, 82, 88, 92, 100, 106, 112];
    cdef = 1;
    ccdef = 1;
    
    capp = 1;
    faulty_captors_xyz = zeros(length(faulty_captors)*3,1);
    for iii = 1:length(faulty_captors)
        faulty_captors_xyz(capp) = (faulty_captors(iii)*3) - 2;
        capp = capp + 1;
        
        faulty_captors_xyz(capp) = (faulty_captors(iii)*3) - 1;
        capp = capp + 1;
        
        faulty_captors_xyz(capp) = (faulty_captors(iii)*3);
        capp = capp + 1;
    end
    
   
      for i = 1:size(Z_fen_group,2)
        if ismember(i, faulty_captors_xyz) == 1
            Z_fen_group_fishedout(:,ccdef) = Z_fen_group(:,i);
            ccdef = ccdef + 1;

        else 
            Z_fen_group_fishedin(:,cdef) = Z_fen_group(:,i);
            cdef = cdef + 1;
        end
        
      end
      
      
      disp(faulty_captors_xyz);
      % I HAVE HAD TO REMOVE THE FAULTY CAPTORS BEFORE NORMALISATION
      % BECAUSE THE FAULTY CAPTORS WILL AFFECT THE NORMALISATION PROCESS
      
      
      
      
      
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