The Engineering Vibration Toolbox for Octave
#################################################

About The Engineering Vibration Toolbox
===========================================

The Engineering Vibration Toolbox for `Octave`_ is a set of educational programs 
written in `Octave`_ by Joseph C. Slater. Also included are a number of help files,  
demonstration examples, and data files containing raw experimental data. The 
codes include single degree of freedom response, response spectrum, finite 
elements, numerical integration, and phase plane analysis. 

The most current version, can be obtained via the `Engineering Vibration Toolbox website`_. For more information, please `email me`_ if you have difficulty with this link.

The Engineering Vibration Toolbox codes can be used as 
examples to learn how to program in `Octave`_.

Note To Instructors
=====================

Please send me any problems you've developed for the toolbox, I'd like to begin a 
collection of problems that better take advantage of its capabilities.


Installing The Toolbox
========================

The toolbox can go in any directory as long as the `Octave`_ path to it is 
set properly in the :code:`.octaverc` file in the users home directory.  
It should be named :code:`vtoolbox` for consistency with other installations.  
Like any of the other toolboxes, you should not save personal files inside 
the vtoolbox directory since you may inadvertently lose them when you update 
(i.e. you may decide to delete the directory and replace everything).  

Example:
~~~~~~~~~
On my Mac (which is Unix), my :code:`.octaverc` file contains the command:
:code:`path(LOADPATH,"/Volumes/LaCie/Documents/MyMath/ovtoolbox");`


Be aware that PCs are (often) not case sensitive, Unix machines (including MacOS X) 
are case sensitive. The bottom line is save the vibration toolbox files in 
lower case (including the directory), on UNIX machines, and make sure your 
paths have the correct case. Type the :code:`loadpath`  command  from the `Octave`_ 
prompt to check the case of the directory structure to other toolboxes 
installed on your machine.


Using The Engineering Vibration Toolbox
==========================================

The files on this disk will load/run on all platforms. To load the
data files (the files starting with *v* and ending in something other
than *m*) type :code:`load filename -mat`. 

Typing :code:`help vtoolbox` will provide a table of contents of the toolbox. 
Likewise, typing :code:`help vtb?` will provide a table of contents for the 
files related to chapter *?*. Typing :code:`help codename` will provide help on 
the particular code.  Note that the *filename* is in the format :code:`codename.m`.

Engineering Vibration Toolbox commands can be run by typing them with the 
necessary arguments just as any other Octave/MATLAB commands/functions. For 
instance, :code:`vtb1_1` can be run by typing :code:`vtb1_1(1,.1,1,1,0,10)`. Many 
functions have multiple forms of input. The help for each function shows 
this flexibility.


Contacting The Author
=========================

If you have any difficulty, please email me at `email me`_.

Please visit the `Engineering Vibration Toolbox website`_


Acknowledgments
=====================

Support for the Engineering Vibration Toolbox has come from a number of 
sources. First and foremost, Daniel J. Inman, who initially tasked myself 
and Donald J. Leo to write version 3 of the software for his text 
"Engineering Vibration" by Dr. Daniel J. Inman (Prentice Hall, 1994). I 
also thank the Department of Mechanical and Materials Engineering and the 
College of Engineering and Computer Science at Wright State University for 
providing the computer resources for developing the MATLAB 4 version of 
the software. Perhaps the people who have given the most are my students 
who painfully experienced every piece of beta code, often at the least 
opportune times. Thanks is also given to Dr. Maurice Petyt and Robert C. 
Chiroux for their patience in testing numerous 4.0 beta versions of this 
software. Finally, John W. Eaton and others for writing/coordinating/
developing/supporting Octave. Please go to the `Octave`_ website for more 
information on Octave and how you can support its development.


License
===============
The Engineering Vibration Toolbox is licensed free of charge for educational use. 
For professional use, users should contact the Engineering Vibration Toolbox 
author directly.


------------------------------------------------------------------------------------------

MATLAB is a registered trademark of the MathWorks, Inc.
Mac(intosh) is a registered trademark of Apple Computer, Inc.
PostScript is a registered trademark of Adobe Systems, Inc.
Windows is a registered trademark of Microsoft Corp.
Unix is a registered trademark of AT&T.

Joseph C. Slater is the copyright holder of the Engineering Vibration 
Toolbox. Neither the author, Prentice Hall, nor Wright State University 
make any warranty with regard to merchantability or fitness for any given 
purpose with regard to the software. All rights are retained. No 
permission is given to anyone other than myself, the MathWorks and 
Prentice Hall to distribute this software in any manner whatsoever. 



.. _`Engineering Vibration Toolbox web page`: http://vibrationtoolbox.github.io
.. _`email me`: mailto:joseph.c.slater@gmail.com 
.. _`Octave`: http://www.octave.org
