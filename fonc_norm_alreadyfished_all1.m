function Z_fen_group = fonc_norm_alreadyfished_all1(Z_fen_group)

%Z_fen_group = Z_fen_group;


        for i = 5:5:85
            Z_fen_group(23,1:i) = Z_fen_group(23,1:i)/(mean(Z_fen_group(23-1:23+1,i))); % 12 is 13
            Z_fen_group(23,i+1:i+5) = Z_fen_group(23,i+1:i+5)/(mean(Z_fen_group(23-1:23+1,i+1)));
        end
        % manual part of the normalisation because the trancon has only 4 captors
        
            
        Z_fen_group(23,1:90) = Z_fen_group(23,1:90)/(mean(Z_fen_group(23-1:23+1,90))); 
        Z_fen_group(23,91:93) = Z_fen_group(23,91:93)/(mean(Z_fen_group(23-1:23+1,91)));  
        Z_fen_group(23,1:93) = Z_fen_group(23,1:93)/(mean(Z_fen_group(23-1:23+1,93))); 




end