function Z_fen_group = fonc_norm_ordinary(Z_fen_group)
        for i = 6:6:102
            Z_fen_group(:,1:i) = bsxfun(@rdivide,Z_fen_group(:,1:i),Z_fen_group(:,i)); %Z_fen_group(:,1:i)./(Z_fen_group(:,i)); % 12 is 13
            Z_fen_group(:,i+1:i+6) = bsxfun(@rdivide,Z_fen_group(:,i+1:i+6),Z_fen_group(:,i+1)); %Z_fen_group(:,i+1:i+6)./(Z_fen_group(:,i+1));
        end

        Z_fen_group(:,1:108) = bsxfun(@rdivide,Z_fen_group(:,1:108),Z_fen_group(:,108)); % Z_fen_group(:,1:108)./(Z_fen_group(:,108)); 
        Z_fen_group(:,109:112) = bsxfun(@rdivide,Z_fen_group(:,109:112),Z_fen_group(:,109)); %Z_fen_group(:,109:112)./(Z_fen_group(:,109));

        Z_fen_group(:,1:112) = bsxfun(@rdivide,Z_fen_group(:,1:112),Z_fen_group(:,112)); %Z_fen_group(:,1:112)./(Z_fen_group(:,112)); 

% 
%         figure
%         plot(flip(Z_fen_group(:,1:112)))


        %smode1y = flip(Z_fen_group(:,1:112));
end