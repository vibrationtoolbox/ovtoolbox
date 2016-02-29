try
    pkg load vtoolbox
end

if exist('vtb1_1.m') == 2
    pkg uninstall vtoolbox
end

[s, success, message]=urlwrite('https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip','vtoolbox.zip')
pkg install vtoolbox.zip
delete('vtoolbox.zip')
;
