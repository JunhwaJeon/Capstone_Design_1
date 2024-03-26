close all; clear all; clc
%% BLER을 구하고, BLER 이용해 Throughput구하기

% Parameters
b_len=10;
iter=10^5;
m_type=['BPSK', 'QPSK', '8-PSK', '16-QAM'];
c_type=['AWGN','Rayleigh'];
throughput=0;
Blk_err=0;

for chan=1:length(c_type)
for mod=1:length(m_type)
    mod_order=mod;
    for i=1:iter
        Block=Block_gen(m_type(mod),b_len);
        sym_temp=0;
        for j=1:b_len
            sym_temp=Transmit(Block(j),c_type(chan));
        end
    end
end
end