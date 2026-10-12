function vtb8_1
% VTB8_1  Graphical preprocessor for VTB8_2.
%   VTB8_1 interactively builds the model (nodes, elements, concentrated
%   masses, boundary conditions and loads), and saves the variables
%   node, ncon, zero, force and conm in a .con file that VTB8_2 can read.
%   Nodes are entered by typing coordinates; all other items are picked
%   with the mouse (the node nearest the click is used).
%   See VTB8_2 for the meaning of the variables.
%
%   NOTE: This is a very dated graphical interface. By modern standards
%   it is likely easier to define the model directly (see the example
%   script vtb8_e1.m) and call VTB8_2 yourself. Modern finite element
%   software has also progressed to be easy to use and freely available.
% I suggest you print the file vtb8read.

%	Joseph C. Slater, 6-17-90
%	Copyright (c) 1990-94 by Joseph C. Slater

%       11 Nov 94 -- fixed graphics to work with Matlab 4.0
%       2026      -- updated to work in Octave

figure
clf
grid on
hold on

% Entering nodes
node=[];
loc=input('Enter x and y location of node 1 (eg.: [x y]) ');
while numel(loc)~=2
  loc=input('Enter x and y location as [x y]: ');
end
node(1,:)=loc(:)';
redraw(node)
for i=2:1000
  loc=input(sprintf('Enter x and y location of node %d (ie. [x y]) or 0 to end. ',i));
  if isequal(loc,0) || isempty(loc),break,end
  if numel(loc)~=2
    disp('Please enter [x y].')
    continue
  end
  node(i,:)=loc(:)';
  redraw(node)
end
nn=size(node,1);

% Connecting nodes with elements
disp(' Pick nodes to connect with elements.')
disp(' (Use the mouse: click the first node, then the second.)')
ncon=[];
for i=1:1000
  nodenum1=picknode(node);
  mark(node,nodenum1,'or')
  nodenum2=picknode(node);
  mark(node,nodenum2,'or')
  plot([node(nodenum1,1) node(nodenum2,1)],[node(nodenum1,2) node(nodenum2,2)],'-b')
  plot(node([nodenum1 nodenum2],1),node([nodenum1 nodenum2],2),'*b')

  if i==1
    answer2='n';
  else
    answer2=input(' Same properties as previous element? (y/n) ','s');
  end
  if ~strcmp(answer2,'y')
    E=input(' Enter the modulus of elasticity of the member. ');
    G=input(' Enter the shear modulus of the member (zero for EB beam). ');
    I=input(' Enter the moment of area of the member. ');
    A=input(' Enter the cross sectional area of the member. ');
    Rho=input(' Enter the density per unit length of the member. ');
  end
  ncon(i,:)=[nodenum1 nodenum2 E A I G Rho];
  answer=input(' Enter another element? (y/n) ','s');
  if ~strcmp(answer,'y'),break,end
end

% Adding concentrated masses and inertias
conm=[];
answer=input(' Add concentrated masses and rotational inertias? (y/n) ','s');
i=0;
while strcmp(answer,'y')
  disp(' Pick node to add mass/rotational inertia to.')
  nodenum=picknode(node);
  mark(node,nodenum,'xr')
  answer=input(' Add mass or rotational inertia? (m,i) ','s');
  massval=input(' Enter magnitude of mass/inertia. ');
  i=i+1;
  conm(i,:)=[nodenum 0 0];
  if strcmp(answer,'m')
    conm(i,2)=massval;
  elseif strcmp(answer,'i')
    conm(i,3)=massval;
  end
  mark(node,nodenum,'*b')
  answer=input(' Add more concentrated masses and rotational inertias? (y/n) ','s');
end

% Zeroing of displacements
zero=[];
ij=0;
answer=input(' Add boundary conditions? (y/n) ','s');
while strcmp(answer,'y')
  disp(' Pick node to zero')
  nodenum=picknode(node);
  mark(node,nodenum,'xr')
  disp(' Zero which displacement(s)? (x,y,t(heta),n(one))')
  answern=input(' (ie xt for x and theta) ','s');
  for ii=1:length(answern)
    dof=find(answern(ii)=='xyt');
    if ~isempty(dof)
      ij=ij+1;
      zero(ij,:)=[nodenum dof];
    end
  end
  mark(node,nodenum,'*b')
  answer=input(' Zero another displacement? (y/n) ','s');
end

% Adding loads
force=[];
i=0;
answer=input(' Add loads? (y/n) ','s');
while strcmp(answer,'y')
  disp(' Pick node to load')
  nodenum=picknode(node);
  mark(node,nodenum,'xr')
  answer=input(' Load which displacement? (x,y,t(heta),n(one)) ','s');
  dof=find(strcmp(answer,{'x','y','t'}));
  if ~isempty(dof)
    loadval=input(' Enter magnitude of load. ');
    i=i+1;
    force(i,:)=[nodenum dof loadval];
  end
  mark(node,nodenum,'*b')
  answer=input(' Load another node? (y/n) ','s');
end

answer=input(' Save configuration file (Else all will have been in vain)? (y/n) ','s');
if strcmp(answer,'y')
  [filename,pathname]=uiputfile('projectname.con','Save as:');
  if isequal(filename,0)
    disp(' Not saved.')
    return
  end
  [~,projectname]=fileparts(filename);
  filename=fullfile(pathname,[projectname '.con']);
  save('-mat',filename,'node','ncon','zero','force','conm');
  disp([' Saved ' filename])
  answer=input(' Run analysis? (y/n) ','s');
  if strcmp(answer,'y')
    cd(pathname)
    vtb8_2(projectname);
  end
end

end

function redraw(node)
% Replot nodes with numbers, keeping a golden-ratio aspect.
  cla
  plot(node(:,1),node(:,2),'*b')
  hold on
  xlo=min(node(:,1)); xho=max(node(:,1));
  ylo=min(node(:,2)); yho=max(node(:,2));
  xsp=max(xho-xlo,eps); ysp=max(yho-ylo,eps);
  if .618*xsp > ysp
    xh=xho+.1*xsp; xl=xlo-.1*xsp;
    yh=(yho+ylo)/2+(xh-xl)*.618/2; yl=(yho+ylo)/2-(xh-xl)*.618/2;
  else
    yh=yho+.1*ysp; yl=ylo-.1*ysp;
    xh=(xho+xlo)/2+.5*(yh-yl)/.618; xl=(xho+xlo)/2-.5*(yh-yl)/.618;
  end
  dx=.01*(xh-xl); dy=.035*(yh-yl);
  for j=1:size(node,1)
    text(node(j,1)+dx,node(j,2)+dy,num2str(j))
  end
  axis([xl xh yl yh])
  axis('image')
  grid on
  drawnow
end

function nodenum=picknode(node)
% Return the number of the node nearest the point clicked.
  [x,y]=ginput(1);
  [~,nodenum]=min((node(:,1)-x).^2+(node(:,2)-y).^2);
end

function mark(node,nodenum,style)
  plot(node(nodenum,1),node(nodenum,2),style)
  drawnow
end
