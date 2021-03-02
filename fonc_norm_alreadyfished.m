function Z_fen_group = fonc_norm_alreadyfished(Z_fen_group)

c_fen = Z_fen_group;


        for i = 5:5:85
            Z_fen_group(23,1:i) = Z_fen_group(23,1:i)/(mean(c_fen(23-2:23+2,i))); % 12 is 13
            Z_fen_group(23,i+1:i+5) = Z_fen_group(23,i+1:i+5)/(mean(c_fen(23-2:23+2,i+1)));
        end
        % manual part of the normalisation because the trancon has only 4 captors
        
            
        Z_fen_group(23,1:90) = Z_fen_group(23,1:90)/(mean(c_fen(23-2:23+2,90))); 
        Z_fen_group(23,91:93) = Z_fen_group(23,91:93)/(mean(c_fen(23-2:23+2,91)));  
        Z_fen_group(23,1:93) = Z_fen_group(23,1:93)/(mean(c_fen(23-2:23+2,93))); 




end