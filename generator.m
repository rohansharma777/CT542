K = input('Enter value of K: ');

fprintf('Enter the %d bits you want to send: ', K);

msgarr = input('\n(Use [] to enter the bits) ');


sqK = sqrt(K);

N = (sqK+1)^2;

gen = zeros(N, K);

pos = 1; 
i = sqK+1;
m = 2;

for itr = 1:K+sqK-1
        if mod(itr, sqK+1) ~= 0 
                gen(itr:itr, pos:pos) = 1;
                pos = pos+1;
        end
end
     

si = 1;

start_index = K+sqK+1;
end_index = N-1;

for itr = start_index:end_index
    mat1 = gen(si:si,:);
    for i = 1:sqK-1
        mat1 = [mat1; gen(si+i*(sqK+1):si+i*(sqK+1),:)];
    end
    si = si+1;
    gen(itr:itr,:) = mod(sum(mat1),2);
end
 



for itr = 1:N
    if mod(itr,sqK+1) == 0
        mat = gen(itr-sqK:itr-1,:);
        gen(itr:itr,:) = mod(sum(mat), 2);
    end
end

codeword = mod(gen*msgarr', 2);

codeword = codeword';

disp('The encoded bits are: ');

disp(codeword);

disp('The parity check matrix is: ');

h = parity_check(N, K);

disp('To check if generated H is correct or not: ');
disp('H*Codeword: ');

disp(mod(h*codeword',2));

disp('Sending through the channel ... ');

perror = input('\nEnter the value of perror: ');

code_with_noise = bec(codeword, perror);

code_with_noise = code_with_noise + codeword;

disp('Code after going through the channel: ');

disp(code_with_noise);

disp('\nDecoding Using Tanner Graph (Message Passing) ... ');

dec_code = tanner(code_with_noise, N, K);
