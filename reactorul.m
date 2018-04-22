function [sys,x0]=reactorul(t,x,u,flag)
if abs(flag)==1
    %constante numerice
    V=2;%Volumul reactor [m^3]
    ro=1000;%Densitatea masei de reactie [kg/m^3]
    cp=4185;%Caldura specifica a masei de reactie [J/(kg*grd)]
    Ea=17500;%Energia de activare
    A=1.2*10^9;%Factorul pre-exponential [1/s]
    R=2;%Constanta generala a gazelor
    deltaH=-30*10^6;%Caldura de reactie[J/Kmol]
    Vag=0.6;%Volum manta [m^3]
    Fag=4/3600;%Debit agent [m^3/s]
    At=10;%Aria de transfer termic[m^2]
    kt=400;%Coef. de transfer termic
    roag=956;%Densitatea agentului de racire [kg/m^3]
    cpag=3800;%Caldura specifica a agentului de racire [J/(kg*grd)]
    
    %variabile de intrare
    Fi=u(1);
    Ti=u(2);%Temperatura de intrare
    Tagi=u(3);%Temperatura de intrare a agentului
    cA0=u(4);
    %definire variabile
    cA=x(1);
    cB=x(2);
    cC=x(3);
    T=x(4);
    Tag=x(5);
      %ec. algebrice
    k1=A*exp(-Ea/(R*T1));
    k2=A*exp(-Ea/(R*T2));
    Fe=Fi+(0.2*Fe);
    Fr=0.2*Fe;
      %ec.diferentiale
      
      dcA=(Fi*cA0)/V-(Fe*cA)/V-(k1*cA)+(Fr*cA)/V;
      dcB=(-cB*Fe)/V+(k1*cA)-(k2*cB)+(Fr*cB)/V;
      dcC=(Fe*cC)/V+(k2*cB)+(Fr*cC)/V;
      dT=((Fi*Ti)/V-(Fe*T)/V)-(k*cA*deltaH/(ro*cp))-(kt*At*(T-Tag)/(V*ro*cp)+(Fr*T)/(cp*ro*V));
      dTag=Fag/Vag*(Tagi-Tag)+(At*kt*(T-Tag))/(roag*cpag*Vag);
      sys=[dcA; dcB; dcC; dT; dTag];
elseif flag==0
    sys=[5 0 5 4 0 0]; %marimea sistemului
    %3=ec continue, 0=discrete 3=var 1=var intrare
    x0=[50 298 263 5 0]; %3 valori de intrare
elseif flag==3
    sys=x; %atribuim sistemului necunoscutele
else 
    sys=[];%multimea vida
end
      