function vtb2_4(z,rmin,rmax,opt)
%VTB2_4 Displacement transmissibility ratio and force transmissibility
% ratio of a single degree of freedom damped system.
% VTB2_4(zeta,rmin,rmax) plots the displacement transmissibility 
% and force transmissibility of a single degree of freedom damped 
% system (with damping ratio zeta) between the frequency ratios 
% rmin and rmax. zeta can be a list of values.
% VTB2_4(zeta,rmin,rmax,opt) allows plotting of Displacement %
% Transmissibility (opt=1), Force Transmissibility (opt=2), or 
% both (opt=3, default).
%
% Example:
% vtb2_4([.0:.2:2],0,2,3)

clf
hold('off')
if nargin==0|nargin==1
	if nargin==1
		opt=z;
	else
		opt=3;
	end
	z=[.01:.1:.51];
	rmin=0;
	rmax=2;
	disp('Demo mode. Type ''help vtb2_4'' to learn how to enter values.')
end
if nargin==3
	opt=3;
end

r=rmin:(rmax-rmin)/1000:rmax;
if z(1)==0
	z(1)=eps;
end


if length(z)>1
	for i=1:length(z)
	    DT(i,:)=sqrt((1+(2*z(i)*r).^2)./((1-r.^2).^2+(2*z(i)*r).^2));%(2.41)
	    FT(i,:)=(r.^2).*DT(i,:);%(2.47)
%		a{i}=['\zeta = ' num2str(z(i))];
	end
	else
	DT=sqrt((1+(2*z*r).^2)./((1-r.^2).^2+(2*z*r).^2));%(2.41)
	FT=(r.^2).*DT;%(2.47)
end

grid('on')
if opt==3 
  subplot(2,1,1)
end
if opt ~=2
  xlabel('Frequency Ratio (r)')
  ylabel('Displacement Transmissibility Ratio (dB)')
  title('Displacement Transmissibility Ratio versus Frequency Ratio (X/Y)')
  plot(r,20*log10(DT)*1+0*DT)
  grid on
end

if opt==3
  subplot(2,1,2)
end
if opt ~=1
  if rmin<=-1
    FT=FT(:,2:length(r));
    r=r(1,2:length(r));
  end
  axis("auto")
  xlabel('Frequency Ratio (r)')
  ylabel('Force Transmissibility Ratio (dB)')
  title('Force Transmissibility Ratio versus Frequency Ratio (F_T/kY)')

  axis("auto")
  ax=axis;
  axis([rmin rmax min(20*log10(FT(:,5))) 20*log10(max(max(FT)))*1.1]);
  plot(r,20*log10(FT))
  grid on
end
