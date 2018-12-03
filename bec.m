function [recv_bits] = bec(codeword, perror)

recv_bits = bsc(codeword, perror);

recv_bits = mod(recv_bits+codeword, 2);

disp('Bits where noise affected: (denoted by 1)');

disp(recv_bits);

recv_bits(recv_bits == 1) = NaN;