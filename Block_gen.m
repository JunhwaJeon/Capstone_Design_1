%% Block_gen 함수 : Modulation type에 따라 Block length만큼의 symbol으로 구성된 block 생성
function [B,mod_order]=Block_gen(mod_type, block_length)
switch mod_type
    case {'BPSK', 'bpsk'}
        s=[1 ;-1];
        c=[0; 1];
        mod_order=1;
    case {'QPSK','qpsk'}
        s=[1 ;1j ;-1 ;-1j ];
        c=[0 0;1 0;1 1;0 1];
        mod_order=2;
    case {'8-PSK','8PSK','8psk','8-psk'}
        s=[1;sqrt(1/2)*(1+1j);1j;sqrt(1/2)*(-1+1j);-1;sqrt(1/2)*(-1-1j);-1j;sqrt(1/2)*(1-1j)];
        c=[0 0 0; 0 0 1; 1 0 1; 1 0 0; 1 1 0;  1 1 1; 0 1 1; 0 1 0];
        mod_order=3;
    case {'16-QAM','16QAM','16-qam','16qam'}
        s=[sqrt(1/10)*(1+1j); sqrt(1/10)*(3+1j); sqrt(1/10)*(3+3j); sqrt(1/10)*(1+3j);sqrt(1/10)*(-1+1j); sqrt(1/10)*(-3+1j); sqrt(1/10)*(-3+3j); sqrt(1/10)*(-1+3j);...
            sqrt(1/10)*(-1-1j); sqrt(1/10)*(-3-1j); sqrt(1/10)*(-3-3j); sqrt(1/10)*(-1-3j);sqrt(1/10)*(1-1j); sqrt(1/10)*(3-1j); sqrt(1/10)*(3-3j); sqrt(1/10)*(1-3j)];
        c=[1 1 1 1; 1 0 1 1; 1 0 1 0; 1 1 1 0;...
           0 1 1 1; 0 0 1 1; 0 0 1 0; 0 1 1 0;...
           0 1 0 1; 0 0 0 1; 0 0 0 0; 0 1 0 0;...
           1 1 0 1; 1 0 0 1; 1 0 0 0; 1 1 0 0];
        mod_order=4;
end
B=zeros(block_length,1+mod_order);
for i=1:block_length
    index=randi(2^mod_order);
    B(i,1)=s(index);
    for j=1:mod_order
        B(i,j+1)=c(index,j);
    end
end
end