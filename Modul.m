%% Modul 함수 : Modulation type에 따라 심볼 생성
function [x,code]=Modul(mod_type)
switch mod_type
    case mod_type=='BPSK' | mod_type=='bpsk'
        s=[1 ;-1];
        c=[0; 1];
        index=randi(2);
        x=s(index); code=c(index,:);
    case mod_type=='QPSK' | mod_type=='qpsk'
        s=[1 ;1j ;-1 ;-1j ];
        c=[0 0;1 0;1 1;0 1];
        index=randi(4);
        x=s(index); code=c(index,:);
    case mod_type=='8-PSK' | mod_type=='8PSK' | mod_type=='8psk' | mod_type=='8-psk'
        s=[1;sqrt(1/2)*(1+1j);1j;sqrt(1/2)*(-1+1j);-1; ...
            sqrt(1/2)*(-1-1j);-1j,sqrt(1/2)*(1-1j)];
        c=[0 0 0; 0 0 1; 1 0 1; 1 0 0; 1 1 0; ...
           1 1 1; 0 1 1; 0 1 0];
        index=randi(8);
        x=s(index); code=c(index,:);
    case mod_type=='16-QAM' | mod_type=='16QAM' | mod_type=='16-qam' | mod_type=='16qam'
        s=[sqrt(1/10)*(1+1j); sqrt(1/10)*(3+1j); sqrt(1/10)*(3+3j); sqrt(1/10)*(1+3j);...
            sqrt(1/10)*(-1+1j); sqrt(1/10)*(-3+1j); sqrt(1/10)*(-3+3j); sqrt(1/10)*(-1+3j);...
            sqrt(1/10)*(-1-1j); sqrt(1/10)*(-3-1j); sqrt(1/10)*(-3-3j); sqrt(1/10)*(-1-3j);...
            sqrt(1/10)*(1-1j); sqrt(1/10)*(3-1j); sqrt(1/10)*(3-3j); sqrt(1/10)*(1-3j)];
        c=[1 1 1 1; 1 0 1 1; 1 0 1 0; 1 1 1 0;...
           0 1 1 1; 0 0 1 1; 0 0 1 0; 0 1 1 0;...
           0 1 0 1; 0 0 0 1; 0 0 0 0; 0 1 0 0;...
           1 1 0 1; 1 0 0 1; 1 0 0 0; 1 1 0 0];
        index=randi(16);
        x=s(index); code=c(index,:);
end
end

