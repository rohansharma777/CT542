function [dec_code] = tanner(code_with_noise, N, K)


N = 9;
K = 4;

CN = {};
CN_num = N-K;
sqK = sqrt(K);
sqN = sqrt(N);

VN = code_with_noise;

i = 1;
k = 1-sqK;

flag = 0;

while flag == 0
    for itr = 1:CN_num
        if itr <= sqK
            CN{itr} = [VN(1:1, i:i+sqN-1); i:i+sqN-1];
            i = i + sqN;
        else
            j = k;
            arr = [];
         while(j<=N)
             a = [VN(1:1, j:j); j];
             arr = [arr a] ;
           j = j+sqN;
         end
         CN{itr} = arr;
        end
        k = k+1;
        fprintf('\nMessage to CN%d', itr);
        mat = cell2mat(CN(itr));
        disp(mat(1:1,:));
    end

   for itr = 1: CN_num
       m = cell2mat(CN(itr));
       if size(find(isnan(m(1:1,:))), 2) > 1
           continue;
       else
           ind = find(isnan(m(1:1,:)));
           i = m(2:2, ind:ind);
           VN(1:1, i:i) = mod(sum(~isnan(m(1:1,:))),2);
       end
   end
           
   if isempty(VN(isnan(VN)))
       flag = 1;
   end
end   
    
dec_code = VN;      
        