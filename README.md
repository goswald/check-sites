# CloudBleed Site Checker
A simple executable for Windows (and a simple shell for \*nix) to check against Pirate's list of sites impacted by "CloudBleed."  It comes packaged with a copy of GnuWin's Grep, located [here](http://gnuwin32.sourceforge.net/).  This is only required for Windows (as grep isn't a native command-line utility for Windows).

## Instructions:

### All Users:

+ Download the .zip file hosted in this repository, and extract it so that the contents are in one folder.
+ Open 'mysites.txt' and list, one per line, the domain for each website you log into.  For instance, if you have accounts with Amazon and Google, your file would look like this:

amazon.com
<br/>google.com

+ Save the file.

### Windows Users
+ Run 'check-sites.exe.'

### \*nix Users
+ Set 'check-sites.sh' to be executable.
+ Execute 'check-sites.sh.'

### All Users (Again)

+ Watch the text output for status.  The output is a little messy, but it will tell you when it's done and what it's found.
+ A text copy of the results will be located in the folder that the executables are in, titled 'compromised_sites.txt.'

Once you have your list of compromised sites, I highly recommend going through and updating your passwords for those sites.

## Advanced Users:

If you would prefer to download the PowerShell script and run it as a script (rather than an executable), please keep in mind the following:
+ The Windows version relies on GnuWin32's Grep, linked above.  It is referenced as .\bin\grep.exe
+ Please keep in mind that GnuWin's Grep has its own dependencies.  The information about that can be found [here](http://gnuwin32.sourceforge.net/packages/grep.htm).
+ Linux Users: Since grep is generally packaged as a command line utility, you should be able to run the shell file without any additional headache, as long as you have 'mysites.txt' in the same directory as the script and in the proper format.

If you have any questions or concerns, please feel free to reach out to me.
