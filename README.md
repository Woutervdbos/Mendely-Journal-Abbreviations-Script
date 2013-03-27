Generates a list of abbreviated journal names based on your Mendeley library .bib file(s).

This was written for and tested on a machine running Ubuntu 11.10, 12.04, 12.10 with a default Mendeley installation by Alex Chubaty (alex.chubaty@gmail.com) and Charles Stevens [2012-02-09]. Updated by Filipe G. Vieira [2013-02-27].

Changed the script to work on Mac, slightly changed instructions. Wouter van den Bos woutervdbos@gmail.com 

see: http://bits-of-information.org/openminded/abbrev-mendeley/ for instructions


Instructions:
To get this working yourself, follow the steps below:

1) Download and save the  masterlist.txt and the mendelyAbbList.pl script to a directory ‘jabbrev‘

2) open a terminal (and keep it open) and type:
cd path/to/jabbrev

3) In Mendeley go to ‘Tools‘ –> ‘Options‘ and select the ‘BibTeX‘ tab.
Check the box ‘Enable BibTeX syncing’ and select either:
‘Create one BibTeX file for my whole library‘ or ‘Create one BibTeX file per collection‘
Set the path to where these BibTeX files will be saved  to path/to/jabbrev
Click ‘Apply‘ and ‘OK‘, wait for Mendeley to generate the files, then exit Mendeley.

4) Switch back to your open terminal window and allow the script to be executed by typing:
chmod a+x mendelyAbbList.pl

Execute the script by typing:
./mendelyAbbList.pl masterlist.txt bibfile1.bib

5) Sit back and wait (it may take a while to run, especially with a large library!).
copy the default.txt file to the journalAbbreviations folder you made earlier (see above)
Open Mendeley back up, go to ‘View‘ –> ‘Citation Style‘ –> ‘More Styles…‘ and select a citation format that uses abbreviated journal names (e.g., Plos One). You should now be able to generate bibliographies in Word and Open(Libre)Office documents with abbrev j names!


==========

added default_cogneuro.txt which is one of my list and should work for you if you work in my nich area of cogneuro.