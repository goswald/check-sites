# CloudBleed Site Checker
A simple executable for Windows (and a simple shell for \*nix) to check against Pirate's list of sites impacted by "CloudBleed."  It comes packaged with a copy of GnuWin's Grep, located [here](http://gnuwin32.sourceforge.net/).  This is only required for Windows (as grep isn't a native command-line utility for Windows).

Haven't heard of CloudBleed?  Please take a look at [this article](http://gizmodo.com/cloudbleed-password-memory-leak-cloudflare-1792709635), [this article](http://gizmodo.com/everything-you-need-to-know-about-cloudbleed-the-lates-1792710616), and [CloudFlare's official blog post](https://blog.cloudflare.com/incident-report-on-memory-leak-caused-by-cloudflare-parser-bug/) regarding the issue.  

In short, sites that were making use of CloudFlare's services were subject to a bug that caused a buffer overflow resulting in some private user data (such as private messages, images, video frames, session tokens, etc) being exposed to the open Internet and cached by search engines such as Google.  This bug has been present since as early as September 2016, and was patched on Friday, February 17th, 2017.  It is difficult to tell the extent of data that was exposed, or if any malicious parties got a hold of the data.  However, it is in your best interests to cover your bases, identify which of your frequented websites were impacted, change your passwords, and enable two-factor authentication everywhere possible.

That's where this tool comes in.  Pirate's list is comprehensive - over 4 million entries.  While there are command line tools, such as grep, to search on a site-by-site basis, if you log in to many sites, this can be tedious and time consuming.  These scripts utilize these tools and check an entire list of sites you specify against Pirate's list to reveal any matches to you.

Ultimately, I would like to make this tool into a web application, but for now, they are executables to run locally.

## Instructions:

### All Users:

+ Download the .zip file hosted in this repository, and extract it so that the contents are in one folder.
+ Open 'mysites.txt' and list the domains for each of the websites you log into, separated by spaces.  For instance, if you have accounts with Amazon, Discord, and Google, your file would look like this:

amazon.com google.com discordapp.com

+ Save the file.

### Windows Users
+ Run 'check-sites.exe.'

### \*nix Users
+ Set 'check-sites.sh' to be executable.
+ Execute 'check-sites.sh.'

### All Users (Again)

+ Watch the text output for status.  The output is a little messy, but it will tell you when it's done and what it's found.
+ A text copy of the results will be located in the folder that the executables are in, titled 'compromised_sites.txt.'

Once you have your list of compromised sites, I highly recommend going through and updating your passwords for those sites.  **PLEASE NOTE:** The list is actively being updated by Pirate as he receives additional information.  More sites may be added, and some may be removed.  It wouldn't hurt to periodically check for sites that are reporting to be 

## Advanced Users:

If you would prefer to download the PowerShell script and run it as a script (rather than an executable), please keep in mind the following:
+ The Windows version relies on GnuWin32's Grep, linked above.  It is referenced as .\bin\grep.exe
+ Please keep in mind that GnuWin's Grep has its own dependencies.  The information about that can be found [here](http://gnuwin32.sourceforge.net/packages/grep.htm).
+ Linux Users: Since grep is generally packaged as a command line utility, you should be able to run the shell file without any additional headache, as long as you have 'mysites.txt' in the same directory as the script and in the proper format.

If you have any questions, comments, or concerns, please feel free to reach out to me.
