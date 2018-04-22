function [sys,x0]=vas_tampon_B(t,x,u,flag)
if abs(flag)==1
A=2;
Kv=1.1;
g=9.81;

Fi=u(1);
hb=x(1);

Fe=Kv*sqrt(g*hb);

dhb=(Fi-Fe)/A;

sys=dhb;

elseif flag==0
    sys=[1 0 1 1 0 0];

    x0=[1];
elseif flag==3
   sys=x 

    else

     sys=[];
end
end