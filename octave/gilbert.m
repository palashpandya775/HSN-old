#fixed d = 4, d1 = 2, d2 = 2
#input: rho_0 being the state to test
#input: rho_1 beint the sep state to start with
#output: css closest seperable state found
function css = gilbert(rho_0, rho_1)
  tic;
  CT_MAX = 1000;
  h = 0.01;
  D_vals = [];
  
  #disp("step 1");
  cs = 0;
  ct = 0;
  for ct = [1:CT_MAX]
    A = randn(2,1) + randn(2,1)*i;
    B = randn(2,1) + randn(2,1)*i;
    
    A = A / norm(A);
    B = B / norm(B);      
    
    A = A * A';
    B = B * B';
    
    rho_2 = kron(A,B);
    
    previous_d = trace((rho_0 - rho_1)^2);
    
    #disp("step 2");
    pre_crit = trace((rho_2 - rho_1)*(rho_0 - rho_1));
    if(pre_crit <= 0)
      continue;
    endif
    
    #disp("step 3");
    #this step is skipped in this basic implementation
    
    #disp("step 4");
    p = 0;
    min_p = trace((rho_0 - p*rho_1 - (1-p)*rho_2)^2);
    for p = [0:h:1]
      found_p = trace((rho_0 - p*rho_1 - (1-p)*rho_2)^2);
      if(found_p < min_p)
        min_p = found_p;
      endif
    endfor
  
    #disp("step 5");
    p = min_p;
    rho_1_candidate = p*rho_1 + (1-p)*rho_2;
    result_d = trace((rho_0 - rho_1_candidate)^2);
    if(result_d < previous_d)
      rho_1 = rho_1_candidate;
      D_vals(end+1) = trace((rho_0 - rho_1)^2);
      cs = cs + 1;
      
      printf("%d\t%f\n", cs, D_vals(end));
      fflush(stdout);
    endif
    
  #disp("step 6");
  endfor
  css = rho_1;
  
  printf("\ntrace(css) = %f\n", trace(css));
  printf("eig(css) = %f\n", transpose(eig(css)));
  printf("\n");
  toc
endfunction
