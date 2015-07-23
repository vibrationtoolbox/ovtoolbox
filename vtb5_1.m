function vtb5_1(m,c,k)
%VTB5_1 Transmissibility ratio of a SDOF system.
%  VTB5_1(m,c,k) plots the tranmissibility ratio for the system
%  described by the mass m, damping coefficient c, and stiffness k.
%  VTB5_1(zeta,w) plots the transmissibility ratio for the system
%  described by the damping ratio zeta and undamped natural
%  frequency w.
clf
if nargin==2
   z=m;
   w=c;
else
   w=sqrt(k/m);
   z=c/(2*m*w);
end
r=([0:.001:2])';
%Calculate various parts of equation 5.7 for TR
TR1=ones(size(r))+(2*z.*r).^2;
TR2=(ones(size(r))-r.^2).^2+(2*z.*r).^2;
TR=sqrt(TR1./TR2);

aa=version;ll=length(aa);


title(['Transmissibility plot for \zeta = ',num2str(z),', \omega = ',num2str(w),' rad/s'])
grid('on')
ylabel('Transmissibility Ratio')
xlabel('Dimensionless Frequency') 
plot(r,TR)

