%MÉTODO DE EULER
%APLICAÇÃO PARA ANALISE NO TEMPO DO FILTRO RC PASSA-BAIXA
% EDMILA DE MACEDO GOMES

clear all , close all,clc , help rclowpass_euler.m
global tal;
for N=10:5:500
    R=1E3; C=1E-6;tal=R*C; fxy='(x-y)./tal';
    a=0;b=7*tal;h=(b-a)/N;
    u=0;y0=0;
    y(1)=y0+h*funcao(u,y0,fxy);
    u=1;j=2;
    for t=a:h:b-h
        y(j)=y(j-1)+ h*funcao(u,y(j-1),fxy);
        j=j+1;
    end
    t=a:h:b;
    t1=a:(b-a)/1000:b;
    yexato=1-exp(-t1/tal);
    disp([t 'y']);
    t=t.*1000;t1=t1.*1000;
    set(gcf,'Position',[1 29 800 504],'Color',[1 1 1]);
    axs=axes;
    p=plot(t,y,'k.',t1,yexato,'k');
    set(p,'LineWidth',2);
    xla=xlabel('tempo(ms)');
    yla=ylabel('y(t)(volt)');
    leg=legend('MÉTODO DE EULER','RESPOSTA EXATA');
    txa=text(5,0.2,['N=' num2str(N)]);
    txb=text(5,0.15,['h=(b-a)/N=' num2str(h)]);
    set(axs,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    set(xla,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    set(yla,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    set(leg,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    set(txa,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    set(txb,'FontName','TimesNewRoman','FontSize',12,'FontWeight','Bold');
    pause 
    delete(axs);
end