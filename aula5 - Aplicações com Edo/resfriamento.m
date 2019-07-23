%%CEFET-PB/ GTEMA 23/07/2019
%%METODO DE EULER
%%EXEMPLO DE APLICACAO - LEI DE RESFRIAMENTO DE NEWTON
%%t - tempo em minutos
%%T - temperatura do corpo
%%Tamb - temperatura ambiente
%%k - constante experimental

k = 0.0116; Tamb=10; a=0; b=600; h=6; %MALHA
m=(b-a)/h;
t(1)=0;T(1)=30; %VALORES INICIAIS
for j=1:m
    T(j+1)=T(j)+h*(-k*(T(j)-Tamb));
    t(j+1)=t(j)+h;
end
TEXATO=Tamb + (T(1)-Tamb).*exp(-k.*(t-t(1)));
plot(t./60,TEXATO,'K',t./60,T,'b--')
legend('Resposta Exata','Metodo de Euler')
xlabel('tempo, (h)',ylabel('graus Celsius'))