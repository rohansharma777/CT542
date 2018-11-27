function [] = parity_check(N, K)
h = zeros(N-K, N);
sqK = sqrt(K);
sqN = sqrt(N);
i = 1; k = 1;

for itr = 1:K+1
    if itr <= sqK
        h(itr:itr, i:i+sqN-1) = 1;
        i = i + sqN;
    else
       for j = k:N
         h(itr:itr, j:j) = 1;
         j = j+sqN;
       end
    end
    k = k+1;
end
  

disp(h);