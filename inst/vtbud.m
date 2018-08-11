## usage: vtbud
##
## Update or install the Engineering Vibration Toolbox for Octave.
## Please see https://vibrationtoolbox.github.io for more information.


try
  pkg load vtoolbox;
end

[s, success, message]=urlwrite('https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip','vtoolbox_temp.zip');

if success == 0
    # Let's try to do this at the system prompt. This seems to be
    # necessary under Cygwin. I'm hoping it simlifies the process.
    system(['curl -4 -L https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip > vtoolbox_temp.zip'])
    svtb = size('vtoolbox_temp.zip');
    try
        if svtb(2) == 17
            success = 1;
        end
    end

end


if success == 1
    if exist('vtb1_1.m') == 2
      pkg uninstall vtoolbox;
    end
    if exist('vtoolbox.zip') == 2
      delete('vtoolbox.zip');
    end
    rename('vtoolbox_temp.zip','vtoolbox.zip');
    pkg install vtoolbox.zip

    auto_load = yes_or_no("Would you like the Vibration Toolbox to automatically load when you run Octave? ")

    if auto_load == 1
      disp("Please add the line:\n")
      disp("  pkg load vtoolbox")
      disp("\nto your .octaverc file.")
      disp("I will open the editor for you. Please don't change where you save it.")
      dummy = input("Hit return to conitinue.")
      edit('~/.octaverc')
    end


else
    if exist('vtb1_1.m') == 2
        disp('Not possible to upgrade at this time.')
    else
        dis('Not able to install at this time.')
    end
    disp(['Either you are not on the internet or are using a Windows ' ...
          'machine.'])
    disp('Automated installation is, unfortunately, unreliable on Windows')
    disp(['Please try later or use the download and installation ' ...
          'instructions on vibtationtoolbox.github.com'])
    disp('Sorry for the inconvenience.')
    disp('You may have to manually uninstall and reinstall.')
end
