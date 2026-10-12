function vtbud
% usage: vtbud
%
% Update or install the Engineering Vibration Toolbox for Octave from the
% latest GitHub release. Please see https://vibrationtoolbox.github.io
% for more information.

repo = 'vibrationtoolbox/ovtoolbox';
tarurl = ['https://github.com/' repo '/releases/latest/download/vtoolbox.tar.gz'];
apiurl = ['https://api.github.com/repos/' repo '/releases/latest'];
tarfile = fullfile(tempdir, 'vtoolbox.tar.gz');

installed = '';
l = pkg('list', 'vtoolbox');
if ~isempty(l)
  installed = l{1}.version;
end

% Skip the download if the latest release is already installed.
latest = '';
try
  info = jsondecode(webread(apiurl));
  latest = regexprep(info.tag_name, '^v', '');
catch
end
if ~isempty(installed) && ~isempty(latest) && ~newer(latest, installed)
  printf('The Vibration Toolbox %s is already the latest version.\n', installed);
  return
end

success = true;
try
  websave(tarfile, tarurl);
catch
  % Some systems (notably Cygwin) need curl to do the download.
  success = (system(['curl -4 -L -f -o "' tarfile '" ' tarurl]) == 0);
end

if ~success || ~exist(tarfile, 'file')
  disp('Not able to download the toolbox at this time.')
  disp('Either you are not on the internet or are using a Windows machine.')
  disp('Automated installation is, unfortunately, unreliable on Windows.')
  disp(['Please try later or use the download and installation ' ...
        'instructions on vibrationtoolbox.github.io'])
  return
end

if ~isempty(installed)
  pkg('uninstall', 'vtoolbox');
end
pkg('install', tarfile);
delete(tarfile);

if yes_or_no('Would you like the Vibration Toolbox to automatically load when you run Octave? ')
  rcfile = fullfile(getenv('HOME'), '.octaverc');
  txt = '';
  if exist(rcfile, 'file') == 2
    txt = fileread(rcfile);
  end
  if ~isempty(regexp(txt, '^\s*pkg\s+load\s+vtoolbox', 'once', 'lineanchors'))
    disp('vtoolbox is already automatically being loaded at runtime.')
  else
    disp('.octaverc file being updated to automatically load vtoolbox.')
    fid = fopen(rcfile, 'a');
    fputs(fid, "\npkg load vtoolbox\n");
    fclose(fid);
  end
end

end

function tf = newer(a, b)
% True if version string a is newer than version string b.
  va = sscanf(strrep(a, '.', ' '), '%d')';
  vb = sscanf(strrep(b, '.', ' '), '%d')';
  n = max(numel(va), numel(vb));
  va(end+1:n) = 0;
  vb(end+1:n) = 0;
  d = find(va ~= vb, 1);
  tf = ~isempty(d) && va(d) > vb(d);
end
