# Script to define regional settings on Azure Virtual Machines deployed from WVD custom image for Singapore
# Author: Harold Chong
#
######################################

#variables
$regionalsettingsURL = "https://raw.githubusercontent.com/sep3digital/Azure/master/101-ServerBuild/SGRegion.xml"
$RegionalSettings = "D:\SGRegion.xml"


#download regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
# Set-WinSystemLocale en-AU
# Set-WinUserLanguageList -LanguageList en-AU -Force
# Set-Culture -CultureInfo en-AU
# Set-WinHomeLocation -GeoId 12
# Set-TimeZone -Name "E. Australia Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
# Start-sleep -Seconds 40
# Restart-Computer
