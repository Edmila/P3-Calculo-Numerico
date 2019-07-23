% EXEMPLO 2A: SISTEMA PREDADOR PRESA / METODO DE EULER

%METODO DE EULER
%EDMILA DE MACEDO GOMES
%DATA: 23.07.19
%EXEMPLO DE APLICAÇÃO - SISTEMA PREDADOR X PRESA

%X - TEMPO
%Y - PRESA
% Z - PREDADOR

%clear all, close all, clc,

A=0;    B=15;   H=0.1;  H1=H/2;     % MALHA NO TEMPO
M= (B-A)/H;                         % ITERAÇÕES RK4
X(1)=A; Y(1)=80;    Z(1)=30;        % VALORES INICIAIS

for J=1:M
    Y(J+1)=Y(J)+H*FP(X(J),Y(J),Z(J));
    Z(J+1)=Z(J)+H*GP(X(J),Y(J),Z(J));
    X(J+1)=X(J)+H;
end

%[X' Y' Z']
a=plot(X,Y,'k',X,Z,'b');        set(a,'Linewidth',2);
pause,close
a=plot(Z(1),Y(1),'ro',Z,Y,'b');     set(a,'Linewidth',2);
legend('VALOR INICIAL','PREDADOR X PRESA');
xlabel('PREDADORES'),ylabel('PRESAS')

