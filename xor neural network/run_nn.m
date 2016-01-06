XOR = [0,0,0; 0,1,1; 1,0,1; 1,1,0];

THETA1 = 0;
THETA2 = 0;

[THETA1, THETA2] = xor_nn(XOR, THETA1, THETA2, 1, 1, 0.01);

for i = 1:100000
  [THETA1, THETA2] = xor_nn(XOR, THETA1, THETA2, 0, 1, 0.01); 

  if (mod(i,1000) == 0)
    disp('Iteration : '), disp(i)
    [THETA1, THETA2] = xor_nn(XOR, THETA1, THETA2);
  endif  
  
endfor