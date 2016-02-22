Updates to Engineering Vibration Toolbox after 1/1/98
========================================================

Run vtbud to compare your version to the most current one.

More information is available at the `Engineering Vibration Toolbox <http://vibrationtoolbox.github.io>`_
website.



========= =============== ===============================================
  Date       code/s                change
--------- --------------- -----------------------------------------------

02/22/16    readme10        Deleted (extraneous)
02/22/16    vtoolbox        Deleted (extraneous)
02/22/16    vtb6_5          Breakdown phase plot by mode.
02/22/16    vtbud           Now installs easily from github
02/22/16    NA              Turned into a formal Octave Package
            numerous        Octave compatibility fixes
04/02/15    vtb1_4          Fixed 22 year old spelling error in the help. 
04/02/15    vtb1_1          Remove __gnuplot_set__ nokey as it doesn't apply to all 
            vtb2_1                      graphics methods.
            vtb2_2
            vtb2_3
            vtb2_4
            vtb2_5
            vtb3_2
            vtb3_4
            vtb5_1
            vtb5_5
            vtb6_3
            vtb10_1
04/14/14    vtb7_5          Fix automated upper bound on FRF frequency for calculations.
10/20/11    vtb3_3          Added example illustrating the Gibb's effect. 
05/29/09    vtb4_4          Simulate forced response of MDOF system (uses lsim)
04/13/09    many            Replace clg with clf
04/13/09    vtb2_4          Turn grid on
07/14/08    vtb7_5          Corrected error of calling
                            unavailable function ssit
07/14/08    vtb7_6          New code to find eigenvalues and mode
                            shapes using poer method.
04/15/08    vtb3_1          Fixed aliasing issue
04/15/08    vtb1_4          Added to the help
04/15/08    vtb4            Typo
02/22/08    vtb6_3          Free-free conditions were missing one mode
02/20/08    vtb6_3          Simply supported mode shape was
                                  broken
02/20/08    vtb6_5          bctype was being ignored - fixed
11/23/07    vtb3_5          Improved to more easily handle even/odd differences
09/02/07    vtb6_3          Made 'Animation of modes' work
            all rel .m      Changed gset to __gnuplot_set__
            vtb6_3          Modified behavior to enable vtb6_5
            vtb6_5          NEW! FRF of Euler Beam between any 2
                            points for any BCs
06/25/07    vtb1            Corrected description of vtb1_3
            vtb1_3          No longer needs external file
11/20/06    vtb4_1          Reported wrong modes
11/17/06    vtb3_5          Added: plot Fourier Series
10/20/06    all .m          Case in function calls switched to
                                  lower case
10/20/06    vtb1_3          Help corrected to read vtb1_3ex
10/20/06    vtb1_3ex        Included. Had been left out
06/12/06    vtb4_1          Incorporated Cholesky Decomposition
10/30/00    vtb8_1          Fixed no longer available 'i' plot type.
            vtb8_3          Fixed no longer available 'i' plot type.
            vtb8            Updated documentation file name. 
07/24/00    vtb1_3          Corrected help (vtb9_3 -> vtb1_3) and 
                                  spelling error
05/09/00    vtb7_4          Curve fitting is much more robust,
                                  much less likely to fail.
04/28/00    vtb2_3          Corrected phase plot
04/28/00    numerous        Replaced greek names with greek characters
                                  and made subscripts show up properly
04/24/00    vtb2_4          Added plotting options.
04/24/00    vtb2_3          Added plotting options.
04/21/00    vtb2_3          Added legend & default values
04/21/00    vtb2_4          Added default values
04/20/00    vtb2_4          Now allows a list of values of zeta
03/21/00    vtb1_5          Calls the old vtb2_6. vtb2_6 has been 
                            grandfathered.
            vtb1_2          Is the old vtb9_2. vtb9_2 has been
                            grandfathered.
            vtb1_3          Is the old vtb9_3. vtb9_3 has been
                            grandfathered.
            vtb1_3ex        Is the old vtb9_3ex. vtb9_3ex has been
                            grandfathered.
            vtb1_4          Is the old vtb9_4. vtb9_4 has been
                            grandfathered.
            vtb4_3          Is the old vtb9_1. vtb9_1 has been 
                            grandfathered
02/29/00    vtb3_3          Can now run with no arguments.
02/28/00    vtb2_3          Can now take a list of values for zeta. 
02/04/00    vtb7			  Added references to vtb7_4 and vtb7_5
01/13/00    numerous        Removed GUI buttons for printing since
                                 recent version of Matlab enable such 
                                 GUI capabilities on all platforms.
                                 Also, removed a number of figure 
                                 commands. This will allow the user to 
                                 invoke the hold command and plot 
                                 multiple graphics on a single figure.
01/13/00    readme.txt      Updated version of toolbox to 5 to represent 
            Contents.m           dropping of support for version 4 of 
                                 Matlab in future releases.
11/08/99    vtb7_4          Improved robustness of curve fitting with
                                 the addition of a few checks.
                                 Note: This code does not fit 
                                 simultaneous FRFs. Thus the results
                                 for MDOF systems can vary.
10/07/99    vtb7_4          Added. Now FRF curve fitting can be 
                                 performed to ID damping, natural
                                 frequencies, and even mode shapes.
                                 There is enough there to perform a 
                                 complete modal analysis.
10/07/99    vtb7_5          Added. Now FRFs of computational models
                                 can be obtained, viewed, or used in 
                                 vtb7_4. Includes receptance, 
                                 mobility, and inertance, along with 
                                 output of the corresponding frequency 
                                 vector.
11/20/98    readme.txt      Updated to clarify installation 
                                 instructions
11/11/98    vtbud           Modified URL for web page to use shorter
                                 (~) link.
11/11/98    vtb3_3          Modified example to match default
                                 function (Example 3.3.1, T=1)
04/03/98    vtbud           Running vtbud automatically displays
                                 the most recent vtb updates in
                                 your web browser
04/03/98    vtb,vtoolbox    Added error response when called without 
                                 help
03/30/98    Contents        Added reference to web page
03/30/98    Readme          Corrected reference to new web page
03/30/98    vtb             Added reference to web page
03/17/98    vtb4_2          Incorrect matrix exponential fixed
========= =============== ===============================================


Run vtbud to compare your version to the most current one.

More information is available at the `Engineering Vibration Toolbox <http://vibrationtoolbox.github.io>`_
website.



























































