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

Windows Installation
**********************************


The availability of a simple `Octave installer for Windows <octave.org>`__ has been
sporadic. At the moment (30-March-2016) there is one available. I do
recommend that path when available, but when it's not, `Cygwin
<cygwin.com>`__ is a reliable alternative.


1. Download and install `Cygwin <cygwin.com>`__.

2. You may have to run setup multiple times to install the parts you
   need. Install, at minimum:

   a. ``Octave`` (Math section- octave: GNU Octave language...)

   b. ``xinit`` (X11 section)

   c. ``unzip``

3. Go to the Windows Menu. In ``Cygwin-X`` run ``XWin Server``

4. A green X should appear on the dock. You should be able to bring up
   a menu to launch ``Octave``

5. `Click on this
   <https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip>`__
   to download the vibration toolbox to your Downloads folder.

Copy and paste this into your Octave window

.. code-block:: octave

		system('curl -4 -L https://raw.githubusercontent.com/vibrationtoolbox/ovtoolbox/master/inst/vtbud.m>vtbud.m')
		vtbud
		delete('vtbud.m')

..
   Here you will see a list of users on your computer. You need to figure
   out which one is you. For me, it's `Joseph C. Slater`. So for my
   installation  I continue
   with (note the single quotes)

   .. code-block:: octave

		   cd 'Joseph C. Slater'

   You should be able to copy and paste the rest of this into Octave to
   complete the process.

   .. code-block:: octave

		   cd Downloads
		   rename('ovtoolbox-master.zip','vtoolbox.zip')
		   pkg install vtoolbox.zip
		   delete('vtoolbox.zip')
		   ;


Linux and Mac Installation
*****************************


1. Run `Octave`_.

2. Copy and paste this into `Octave`_.

.. code-block:: octave

   [s, success, message]=urlwrite('https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip','vtoolbox.zip')
   pkg install vtoolbox.zip
   delete('vtoolbox.zip')
   vtb
   ;

Alternatively, you can also download ``vtbud.m`` and run it to perform
the install for you

.. code-block:: octave

		system('curl -4 -L https://raw.githubusercontent.com/vibrationtoolbox/ovtoolbox/master/inst/vtbud.m>vtbud.m')
		vtbud
		delete('vtbud.m')

**Note**: If you use the Download button on `github <github.com>`__, you **must** rename
the downloaded file to :code:`vtoolbox.zip` and manually use
:code:`pkg install vtoolbox.zip`.

To update:
-------------
To update, run :code:`vtbud` in `Octave`_ if you have updated since Feb 23, 2016.

Otherwise, run `Octave`_ and paste the following to the prompt:

.. code-block:: octave

   pkg uninstall vtoolbox
   [s, success, message]=urlwrite('https://github.com/vibrationtoolbox/ovtoolbox/archive/master.zip','vtoolbox.zip')
   pkg install vtoolbox.zip
   delete('vtoolbox.zip')
   ;


To remove:
------------
In `Octave`_

.. code-block:: octave

   pkg uninstall vtoolbox
   ;

*Why the semi-colons?* It's my way of making sure you don't leave the
last command unexecuted.


Troubleshooting installation:
-------------------------------

``vtbud`` was initially buggy and is still quite new. If ``vtbud``
isn't working, please perform a clean install with the following

.. code-block::octave

   pkg uninstall vtoolbox
   delete('vtbud.m')
   system('curl -4 -L https://raw.githubusercontent.com/vibrationtoolbox/ovtoolbox/master/inst/vtbud.m>vtbud.m')
   vtbud
   delete('vtbud.m')

The first delete is to make sure you aren't able to run an old version
of ``vtbud``. The second to make sure it is updated in the future.


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



.. _`Engineering Vibration Toolbox web page`: https://vibrationtoolbox.github.io
.. _`email me`: mailto:joseph.c.slater@gmail.com
.. _`Octave`: http://www.octave.org
.. _`Engineering Vibration Toolbox website`: https://vibrationtoolbox.github.io
