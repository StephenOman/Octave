XOR = [0,0,0; 0,1,1; 1,0,1; 1,1,0];

L1W = 0;
L2W = 0;

[L1W, L2W] = xor_nn(XOR, L1W, L2W, 1, 1, 0.1);

for i = 1:10000
  [L1W, L2W] = xor_nn(XOR, L1W, L2W, 0, 1, 0.1); 

  if (mod(i,1000) == 0)
    disp('Iteration : '), disp(i);
    [L1W, L2W] = xor_nn(XOR, L1W, L2W);
  endif  
  
endfor