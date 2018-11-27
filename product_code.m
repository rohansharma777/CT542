K = input('Enter value of K: ');

fprintf('Enter the %d bits you want to send: ', K);

msgarr = input('\nUse [] to enter the bits: ');

sqK = sqrt(K);

N = (sqK+1)^2;

msgarr = reshape(msgarr, [sqK sqK]);

msgarr = msgarr';

colsum = mod(sum(msgarr),2);

msgarr = [msgarr; colsum];

rowsum = mod(sum(msgarr, 2),2);

msgarr = [msgarr rowsum];

msgarr = reshape(msgarr', [ 1, length(rowsum)^2]);

disp('The encoded bits are: ');

disp(msgarr);

disp('The parity check matrix is: ');

parity_check(N, K);

