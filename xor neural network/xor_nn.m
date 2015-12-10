# function to calculate and learn XOR solution

function [L1W_new, L2W_new] = xor_nn(XOR, L1_weights, L2_weights, init_w=0, learn=0, alpha=0.01)
  # first see if this is an initialze run
  if (init_w == 1)
     L1_weights = 2*rand(2,3) - 1;
     L2_weights = 2*rand(1,3) - 1;
  endif
  
  # accumulators for the partial derivatives
  L1_delta_acc = zeros(size(L1_weights));
  L2_delta_acc = zeros(size(L2_weights));
  
  # run through the training set
  m = 0;
  
  # cost function value
  J = 0.0;
  
  #disp('NN output ');
  
  for i = 1:rows(XOR)
    # do the forward propagation
    L1_outputs = [1; XOR(i,1:2)'];
    
    L2_inputs = L1_weights * L1_outputs;
    
    L2_outputs = [1; sigmoid(L2_inputs)];
    
    L3_inputs = L2_weights * L2_outputs;
    
    L3_outputs = sigmoid(L3_inputs);
    
    J = J + ( XOR(i,3) * log(L3_outputs) ) + ( (1 - XOR(i,3)) * log(1 - L3_outputs) );
    
    m = m + 1;

    # now update the deltas if we have to learn from this case
    if (learn == 1)
      L3_delta = L3_outputs - XOR(i,3);
      
      L2_delta = ((L2_weights' * L3_delta) .* (L2_outputs .* (1 - L2_outputs)))(2:end);
      
      # is no L1 delta :)
      
      # add the deltas for this training example to the accumulators
      L2_delta_acc = L2_delta_acc + (L3_delta * L2_outputs');
      L1_delta_acc = L1_delta_acc + (L2_delta * L1_outputs');
    else
      disp(L3_outputs);
    endif
  endfor
  
  J = J / -m;
  
  if (learn==1)
    L1_weights = L1_weights - (alpha * (L1_delta_acc / m));
    L2_weights = L2_weights - (alpha * (L2_delta_acc / m));
  else
    disp('J: '), disp(J);
  endif
  
  L1W_new = L1_weights;
  L2W_new = L2_weights;
  
endfunction
      
    
    
    