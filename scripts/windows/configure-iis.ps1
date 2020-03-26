Import-Module WebAdministration

# Set IIS log defaults
mkdir d:\IISLogs
mkdir d:\IISWeb
Set-WebConfigurationProperty "/system.applicationHost/sites/siteDefaults" -name logfile.directory -value d:\IISLogs