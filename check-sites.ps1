Write-Host "Initializing..."
Write-Host ""
$userSites = cat mysites.txt; # Importing the user's sites.
$formattedSites = $userSites.Split(" "); # Format the sites so that they will pass into Grep properly.
$outputObjects = new-object System.Collections.ArrayList; # Define an array list for later use.$emptyListProperties = {'Site' = "NONE!"; 'Compromised' = "NONE!"}; # In case no sites are compromised.
$listURL = "https://raw.githubusercontent.com/pirate/sites-using-cloudflare/master/sorted_unique_cf.txt" # Most up to date list of compromised sites.
$listFile = ".\sorted_unique_cf.txt"
$foundSite = $null # Instantiate this variable to be null.



Write-Host "Downloading the most recent list of compromised sites..."

wget -uri $listURL -outfile $listFile

Write-Host "Initialization done."

Write-Host "Checking sites... this may take some time.  Please wait."


foreach ($site in $formattedSites) {
  $foundSite = (.\bin\grep.exe -xc $site $listFile)
  if ($foundSite -gt 0) {
	$object = new-object -Type PSObject; # Custom object for formatting purposes.
	$object | add-member -MemberType NoteProperty -Name Site -Value $site; # Add the site as a property.
	$object | add-member -MemberType NoteProperty -Name Compromised -Value $TRUE; # This site is compromised if it's here.
	$outputObjects.add($object) | Out-Null; # Add the object to the list without spitting out an index number.
  }
}

if ($outputObjects.Count -eq 0) { # If no sites were found, we'll use the empty list defined above.
  $object = new-object -Type PSObject;
  $object | add-member -MemberType NoteProperty -Name Site -Value "NONE"; # If we're here, no sites were compromised.
  $object | add-member -MemberType NoteProperty -Name Compromised -Value $FALSE; # Keeping to above format.
  $outputObjects.add($object) | Out-Null;
}

Write-Host "Done.  Your results are as follows:"

$outputObjects | Format-Table 
$outputObjects | Format-Table | Out-File 'compromised_sites.txt' # Write results to file.

Write-Host "Output saved to:"
Write-Host "$pwd\compromised_sites.txt."

$x = Read-Host "Please hit the 'Enter' key on your keyboard to quit"

Write-Host "Cleaning up files..."

rm ".\sorted_unique_cf.txt"

