The Engineering Vibration Toolbox for `Octave`_
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


Installing, Updating, and Removing The Toolbox
======================================================

To install:
---------------------

0. Run `Octave`_.

1. Change directories to your download directory. You need to figure
   out the name and location for your machine. For me:

   :code:`[s, success, message]=urlwrite('https://github.com/josephcslater/ovtoolbox/archive/master.zip','vtoolbox.zip')`

**Note**: If you use the Github Download button, you **must** rename
the downloaded file to :code:`vtoolbox.zip`.

3. Install using the :code:`pkg` command in `Octave`_
   
   :code:`pkg install vtoolbox.zip`

4. Delete the zip file (you nave no more use for it).

   :code:`delete('vtoolbox.zip')`

.. code-block:: octave

   [s, success, message]=urlwrite('https://github.com/josephcslater/ovtoolbox/archive/master.zip','vtoolbox.zip')
   pkg install vtoolbox.zip
   delete('vtoolbox.zip')
   pkg list

To update:
-------------
To update, you need to remove and reinstall.

Follow the instructions below to remove it, then to reinstall. 


To remove:
------------
In `Octave`_

:code:`pkg uninstall ovtoolbox`



Using The Engineering Vibration Toolbox
==========================================

The files on this disk will load/run on all platforms. To load the
data files (the files starting with *v* and ending in something other
than *m*) type :code:`load filename -mat`. 

Typing :code:`help vtoolbox` will provide a table of contents of the toolbox. 
Likewise, typing :code:`help vtb#` will provide a table of contents for the 
files related to chapter *#*. Typing :code:`help codename` will provide help on 
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
.. _`Engineering Vibration Toolbox website`: http://vibrationtoolbox.github.io
