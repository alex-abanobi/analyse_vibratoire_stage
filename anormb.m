function vecta = anormb(vecta,vectb)

  vecta = vecta * (max(abs(vectb))/max(abs(vecta)));  
  
  %[vv, ind] = max(abs(vecta));
    
  %vecta(ind) = vv;
end