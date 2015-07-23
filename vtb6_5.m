function [fout,H]=vtb6_5(xin, xout,fmin,fmax,beamparams,bctype,zeta)
%VTB6_5(XIN,XOUT,FMIN,FMAX,BEAMPARAMS,BCTYPE,ZETA) plots the frequency response
%of an Euler beam between 2 points.
%See vtb6_3 for BCTYPE values
%BEAMPARAMS=[E I rho A L]; 
%ZETA us a uniform damping ratio for all modes. The default value is 0.01.
%[F,H]=VTB6_5(XIN,XOUT,FMIN,FMAX,BEAMPARAMS,BCTYPE,ZETA); returns the frequency
%response function in H with the frequency vector F
%
% Example: 40 cm long aluminum beam with h=1.5 cm, b=3 cm,
% cantilever, excitation at 22 cm, response at 32 cm.
%
% E=7.31e10;
% I=1/12*.03*.015^3;
% rho=2747;
% A=.015*.03;
% L=0.4;
% vtb6_5(.22,.32,0,1000,[E I rho A L],2)
%

% Copyright Joseph C. Slater 2007
if fmin==0
	fmin=fmax/3000;
end

%wn=0;
i=0;
w=(fmin:(fmax-fmin)/3000:fmax)'*2*pi;

E=beamparams(1);
I=beamparams(2);
rho=beamparams(3);
A=beamparams(4);
L=beamparams(5);
if min([xin xout])<0|max([xin xout])>L
	disp('One or both locations are not on the beam.')
	return
end

wn=0;


if nargin==6
	zeta=0.01;
end
pfunc='plot(';
i;
while wn<1.3*(fmax*2*pi)%Including contributions of mode with frequencies 5x the max
    i=i+1;
    if i>1;
        pfunc=[pfunc ','];
    end
    %legtext{i+1}=['Contribution of mode ' num2str(i)];
    %3
    %whos
    clear wn xx U
    [wn,xx,U]=vtb6_3(i,bctype,beamparams,5000);
    %4
    %wn%wn=wn(i);
    %xx=xx(:,i);
    %whos
	%wn/2/pi
        %xx,U,xin
        %plot(xx,U)
	Uin=spline(xx,U,xin);
	Uout=spline(xx,U,xout);
        %        pause
	%plot(xx,U,xin,Uin,'*',xout,Uout,'o'),pause
    %modeint=sum(U)*L;
    %1
    a(:,i)=rho *A*Uin*Uout./(wn^2-w.^2+2*zeta*wn*w*sqrt(-1));
    %2
    f(i)=wn/2/pi;
    %i
    pfunc=[pfunc  'w/2/pi,20*log10(abs(a(:,' num2str(i) ['))),"-;' ...
                        'Contribution of mode ']  num2str(i)  ';"'];
    
end
%3
%size(a)
pfunc=[pfunc  ',w/2/pi,20*log10(abs(sum(a,2))),"-;Total FRF;"'];
    


%size(a)
subplot(2,1,1)
eval([pfunc ')'])
axis
%plot(w/2/pi,20*log10(abs(sum(a,2))))
%hold on
%plot(w/2/pi,20*log10(abs(a)))
%pause
grid on
xlabel('Frequency (Hz)')
ylabel('FRF (dB)')
%legtext{1}='Total Frequency Response Function';
%legend(legtext)
%hold off
subplot(2,1,2)
%size(sum(a,2))
%pause
aa=unwrap(angle(sum(a,2)))/pi*180;
plot(w/2/pi,aa,'-;Total Phase;')
%size(w)
grid on
xlabel('Frequency (Hz)')
ylabel('Phase (deg)')
%whos;
if nargout~=0
	fout=w/2/pi;
	H=sum(a,2);
end
