function [h] = parity_check(N, K)
h = zeros(N-K, N);
sqK = sqrt(K);
sqN = sqrt(N);
i = 1; k = 1-sqK;

for itr = 1:N-K
    if itr <= sqK
        h(itr:itr, i:i+sqN-1) = 1;
        i = i + sqN;
    else
        j = k;
        while(j<=N)
         h(itr:itr, j:j) = 1;
         j = j+sqN;
       end
    end
    k = k+1;
end
  

disp(h);