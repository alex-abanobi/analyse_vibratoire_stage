function Z_fen_group = fonc_norm_ordinary5(Z_fen_group)
        
%         c_fen = Z_fen_group;
% 
%         line1 = Z_fen_group(23,:);
%         line2 = Z_fen_group(29,:);
%         line3 = Z_fen_group(32,:);
%         line4 = Z_fen_group(36,:);
%         line5 = Z_fen_group(38,:);
%         line6 = Z_fen_group(42,:);
%         line7 = Z_fen_group(44,:);
%         line8 = Z_fen_group(53,:);
%         line9 = Z_fen_group(57,:);
%         line10 = Z_fen_group(64,:);
%         
%         line = [line1;line2;line3;line4;line5;line6;line7;line8;line9;line10];
%         numb = [23, 29, 32, 36, 38, 42, 44, 53, 57, 64];

        for i = 5:5:85
            Z_fen_group(:,1:i) = bsxfun(@rdivide,Z_fen_group(:,1:i),Z_fen_group(:,i)); %Z_fen_group(:,1:i)./(Z_fen_group(:,i)); % 12 is 13
            Z_fen_group(:,i+1:i+5) = bsxfun(@rdivide,Z_fen_group(:,i+1:i+5),Z_fen_group(:,i+1)); %Z_fen_group(:,i+1:i+6)./(Z_fen_group(:,i+1));
        end

        Z_fen_group(:,1:90) = bsxfun(@rdivide,Z_fen_group(:,1:90),Z_fen_group(:,90)); % Z_fen_group(:,1:108)./(Z_fen_group(:,108)); 
        Z_fen_group(:,91:93) = bsxfun(@rdivide,Z_fen_group(:,91:93),Z_fen_group(:,91)); %Z_fen_group(:,109:112)./(Z_fen_group(:,109));
        Z_fen_group(:,1:93) = bsxfun(@rdivide,Z_fen_group(:,1:93),Z_fen_group(:,93)); %Z_fen_group(:,1:112)./(Z_fen_group(:,112)); 

        %save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZR_CS2_X_used.mat','nfZR_CS2_X');

        
        
% 
%         figure
%         plot(flip(Z_fen_group(:,1:112)))


        %smode1y = flip(Z_fen_group(:,1:112));
        
%         
%         for nb = 1:10
%         
%             for i = 5:5:85
%                 line(nb,1:i) = line(nb,1:i)/(mean(c_fen(numb(nb)-2:numb(nb)+2,i))); % 12 is 13
%                 line(nb,i+1:i+5) = line(nb,i+1:i+5)/(mean(c_fen(numb(nb)-2:numb(nb)+2,i+1)));
%             end
%             % manual part of the normalisation because the trancon has only 4 captors
% 
% 
%             line(nb,1:90) = line(nb,1:90)/(mean(c_fen(numb(nb)-2:numb(nb)+2,90))); 
%             line(nb,91:93) = line(nb,91:93)/(mean(c_fen(numb(nb)-2:numb(nb)+2,91)));  
%             line(nb,1:93) = line(nb,1:93)/(mean(c_fen(numb(nb)-2:numb(nb)+2,93))); 
% 
%         end
%         
%         
        
%           for nb = 1:10
%         
%             for i = 5:5:85
%                 line(nb,1:i) = line(nb,1:i)/((c_fen(numb(nb)-2,i) + c_fen(numb(nb)-1,i) + c_fen(numb(nb)+1,i) + c_fen(numb(nb)+2,i) )/4); % 12 is 13
%                 line(nb,i+1:i+5) = line(nb,i+1:i+5)/((c_fen(numb(nb)-2,i+1) + c_fen(numb(nb)-1,i+1) + c_fen(numb(nb)+1,i+1) + c_fen(numb(nb)+2,i+1) )/4);
%             end
%             % manual part of the normalisation because the trancon has only 4 captors
% 
% 
%             line(nb,1:90) = line(nb,1:90)/((c_fen(numb(nb)-2,90) + c_fen(numb(nb)-1,90) + c_fen(numb(nb)+1,90) + c_fen(numb(nb)+2,90) )/4);
%             line(nb,91:93) = line(nb,91:93)/((c_fen(numb(nb)-2,91) + c_fen(numb(nb)-1,91) + c_fen(numb(nb)+1,91) + c_fen(numb(nb)+2,91) )/4); 
%             line(nb,1:93) = line(nb,1:93)/((c_fen(numb(nb)-2,93) + c_fen(numb(nb)-1,93) + c_fen(numb(nb)+1,93) + c_fen(numb(nb)+2,93) )/4);
% 
%           end
%         
%         
        
        
%         for na = 1:10
%             
%             Z_fen_group(numb(na),:) = line(na,:);
%             
%         end
%         
%         
end