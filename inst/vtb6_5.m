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


i=0;
w=(fmin:(fmax-fmin)/3000:fmax)'*2*pi;

E=beamparams(1);
I=beamparams(2);
rho=beamparams(3);
A=beamparams(4);
L=beamparams(5);
if min([xin xout])<0||max([xin xout])>L
	disp('One or both locations are not on the beam.')
	return
end

wn=0;


if nargin==6
	zeta=0.01;
end
pfunc='subplot(2,1,1);plot(';
pphasefunc = 'subplot(2,1,2);plot(';
i;
while wn<1.3*(fmax*2*pi)%Including contributions of mode with frequencies 5x the max
    i=i+1;
    if i>1;
        pfunc=[pfunc ','];
        pphasefunc=[pphasefunc ','];

    end

    clear wn xx U
    [wn,xx,U]=vtb6_3(i,bctype,beamparams,5000);
    Uin=spline(xx,U,xin);
    Uout=spline(xx,U,xout);
    a(:,i)=rho *A*Uin*Uout./(wn^2-w.^2+2*zeta*wn*w*sqrt(-1));

    f(i)=wn/2/pi;

    pfunc=[pfunc  'w/2/pi,20*log10(abs(a(:,' num2str(i) ['))),"-;' ...
                        'Contribution of mode ']  num2str(i)  ';"'];
    pphasefunc=[pphasefunc  'w/2/pi,180/pi*unwrap(angle(a(:,' num2str(i) ['))),"-;' ...
                        'Contribution of mode ']  num2str(i)  ';"'];
    
end

pfunc=[pfunc  ',w/2/pi,20*log10(abs(sum(a,2))),"-;Total Magnitude;"'];
pphasefunc = [pphasefunc  ',w/2/pi,unwrap(angle(sum(a,2))),"-;Total Phase;"'];   


subplot(2,1,1)
eval([pfunc ')'])
grid on
xlabel('Frequency (Hz)')
ylabel('FRF (dB)')
axis
eval([pphasefunc ')'])
xlabel('Frequency (Hz)')
ylabel('Phase (deg)')
grid on
if nargout~=0
	fout=w/2/pi;
	H=sum(a,2);
end
