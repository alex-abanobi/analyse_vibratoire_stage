function Z_fen_group = fonc_norm_mode(Z_fen_group)
%Z_fen_group = Z_fen_group;
gg = [23, 29, 32, 36, 38, 42, 44, 53, 57, 64]; % the list of the indices that carry the first 10 natural frequencies
p = 2;

    for ii = 1:10
        cnm = gg(ii);
          for i = 5:5:85
                    Z_fen_group(cnm,1:i) = Z_fen_group(cnm,1:i)/(mean(Z_fen_group(cnm-p:cnm+p,i))); % 12 is 13
                    disp((mean(Z_fen_group(cnm-2:cnm+2,i))));
                    disp(((Z_fen_group(cnm,i))));

                    Z_fen_group(cnm,i+1:i+5) = Z_fen_group(cnm,i+1:i+5)/(mean(Z_fen_group(cnm-p:cnm+p,i+1)));
                    
                    disp((mean(Z_fen_group(cnm-p:cnm+p,i+1))));
                    disp(((Z_fen_group(cnm,i+1))));
          end
                % manual part of the normalisation because the trancon has only 4 captors


                Z_fen_group(cnm,1:90) = Z_fen_group(cnm,1:90)/(mean(Z_fen_group(cnm-p:cnm+p,90))); 
                disp((mean(Z_fen_group(cnm-p:cnm+p,90))));
                    disp(((Z_fen_group(cnm,90))));
                
                Z_fen_group(cnm,91:93) = Z_fen_group(cnm,91:93)/(mean(Z_fen_group(cnm-p:cnm+p,91))); 
                
                 disp((mean(Z_fen_group(cnm-p:cnm+p,91))));
                    disp(((Z_fen_group(cnm,91))));
                    
                Z_fen_group(cnm,1:93) = Z_fen_group(cnm,1:93)/(mean(Z_fen_group(cnm-p:cnm+p,93))); 
                
                 disp((mean(Z_fen_group(cnm-p:cnm+p,93))));
                    disp(((Z_fen_group(cnm,93))));
    end
end