$Pausefor2 = "Start-Sleep 2"
$Pausefor5 = "Start-Sleep 5"


 $Services =
 @("AJRouter - AllJoyn Router Service.","AJRouter"),
  ("ALG - Application Layer Gateway Service.","ALG"),
  ("AppMgmt - Application Management.","AppMgmt"),
  ("BITS - Background Intelligent Transfer Service.","BITS"),
  ("bthserv - Bluetooth Support Service.","bthserv"),
  ("DPS - Diagnostic Policy Service.","DPS"),
  ("WdiServiceHost - Diagnostic Service Host.","WdiServiceHost"),
  ("WdiSystemHost - Diagnostic System Host.","WdiSystemHost"),
  ("DiagTrack - Connected User Experiences and Telemetry [Diagnostics Tracking Service].","DiagTrack"),
  ("dmwappushservice - dmwappushsvc.","dmwappushservice"),
  ("MapsBroker - Downloaded Maps Manager.","MapsBroker"),
  ("EFS - Encrypting File System [EFS].","EFS"),
  ("Eaphost - Extensible Authentication Protocol.","Eaphost"),
  ("FDResPub - Function Discovery Resource Publication.","FDResPub"),
  ("lfsvc - Geolocation Service.","lfsvc"),
  ("SharedAccess - Internet Connection Sharing [ICS].","SharedAccess"),
  ("iphlpsvc - IP Helper.","iphlpsvc"),
  ("lltdsvc - Link-Layer Topology Discovery Mapper.","lltdsvc"),
  ("diagnosticshub.standardcollector.service - Microsoft [R] Diagnostics Hub Standard Collector Service.","diagnosticshub.standardcollector.service"),
  ("wlidsvc - Microsoft Account Sign-in Assistant.","wlidsvc"),
  ("MSiSCSI - Microsoft iSCSI Initiator Service.","MSiSCSI"),
  ("NcbService - Network Connection Broker.","NcbService"),
  ("NcaSvc - Network Connectivity Assistant.","NcaSvc"),
  ("defragsvc - Optimize drives.","defragsvc"),
  ("wercplsupport - Problem Reports and Solutions Control Panel.","wercplsupport"),
  ("PcaSvc - Program Compatibility Assistant Service.","PcaSvc"),
  ("QWAVE - Quality Windows Audio Video Experience.","QWAVE"),
  ("RmSvc - Radio Management Service.","RmSvc"),
  ("RasMan - Remote Access Connection Manager.","RasMan"),
  ("SstpSvc - Secure Socket Tunneling Protocol Service.","SstpSvc"),
  ("SensorDataService - Sensor Data Service.","SensorDataService"),
  ("SensrSvc - Sensor Monitoring Service.","SensrSvc"),
  ("SensorService - Sensor Service.","SensorService"),
  ("SNMPTRAP - SNMP Trap.","SNMPTRAP"),
  ("sacsvr - Special Administration Console Helper.","sacsvr"),
  ("svsvc - Spot Verifier.","svsvc"),
  ("SSDPSRV - SSDP Discovery.","SSDPSRV"),
  ("TieringEngineService - Storage Tiers Management.","TieringEngineService"),
  ("SysMain - Superfetch.","SysMain"),
  ("TapiSrv - Telephony.","TapiSrv"),
  ("UALSVC - User Access Logging Service.","UALSVC"),
  ("Wcmsvc - Windows Connection Manager.","Wcmsvc"),
  ("WerSvc - Windows Error Reporting Service.","WerSvc"),
  ("wisvc - Windows Insider Service.","wisvc"),
  ("icssvc - Windows Mobile Hotspot Service.","icssvc"),
  ("wuauserv - Windows Update.","wuauserv"),
  ("dot3svc - Wired AutoConfig.","dot3svc")

 #Array of scheduled task objects that will be set to disabled
 $ScheduledTasks = 
 @("'AD RMS Rights Policy Template Management (Manual)'","'\Microsoft\Windows\Active Directory Rights Management Services Client'"),
  ("'EDP Policy Manager'","'\Microsoft\Windows\AppID'"),
  ("'Microsoft Compatibility Appraiser'","'\Microsoft\Windows\Application Experience'"),
  ("ProgramDataUpdater","'\Microsoft\Windows\Application Experience'"),
  ("StartupAppTask","'\Microsoft\Windows\Application Experience'"),
  ("CleanupTemporaryState","\Microsoft\Windows\ApplicationData"),
  ("DsSvcCleanup","\Microsoft\Windows\ApplicationData"),
  ("Proxy","'\Microsoft\Windows\Autochk'"),
  ("UninstallDeviceTask","\Microsoft\Windows\Bluetooth"),
  ("AikCertEnrollTask","\Microsoft\Windows\CertificateServicesClient"),
  ("CryptoPolicyTask","\Microsoft\Windows\CertificateServicesClient"),
  ("KeyPreGenTask","\Microsoft\Windows\CertificateServicesClient"),
  ("ProactiveScan","\Microsoft\Windows\Chkdsk"),
  ("CreateObjectTask","\Microsoft\Windows\CloudExperienceHost"),
  ("Consolidator","'\Microsoft\Windows\Customer Experience Improvement Program'"),
  ("UsbCeip","'\Microsoft\Windows\Customer Experience Improvement Program'"),
  ("'Data Integrity Scan'","'\Microsoft\Windows\Data Integrity Scan'"),
  ("'Data Integrity Scan for Crash Recovery'","'\Microsoft\Windows\Data Integrity Scan'"),
  ("ScheduledDefrag","\Microsoft\Windows\Defrag"),
  ("Device","'\Microsoft\Windows\Device Information'"),
  ("Scheduled","\Microsoft\Windows\Diagnosis"),
  ("SilentCleanup","\Microsoft\Windows\DiskCleanup"),
  ("Microsoft-Windows-DiskDiagnosticDataCollector","\Microsoft\Windows\DiskDiagnostic"),
  ("Notifications","\Microsoft\Windows\Location"),
  ("WindowsActionDialog","\Microsoft\Windows\Location"),
  ("WinSAT","\Microsoft\Windows\Maintenance"),
  ("MapsToastTask","\Microsoft\Windows\Maps"),
  ("'MNO Metadata Parser'","'\Microsoft\Windows\Mobile Broadband Accounts'"),
  ("LPRemove","\Microsoft\Windows\MUI"),
  ("GatherNetworkInfo","\Microsoft\Windows\NetTrace"),
  ("Secure-Boot-Update","\Microsoft\Windows\PI"),
  ("Sqm-Tasks","\Microsoft\Windows\PI"),
  ("AnalyzeSystem","'\Microsoft\Windows\Power Efficiency Diagnostics'"),
  ("MobilityManager","\Microsoft\Windows\Ras"),
  ("VerifyWinRE","\Microsoft\Windows\RecoveryEnvironment"),
  ("RegIdleBackup","\Microsoft\Windows\Registry"),
  ("CleanupOldPerfLogs","'\Microsoft\Windows\Server Manager'"),
  ("StartComponentCleanup","\Microsoft\Windows\Servicing"),
  ("IndexerAutomaticMaintenance","\Microsoft\Windows\Shell"),
  ("Configuration","'\Microsoft\Windows\Software Inventory Logging'"),
  ("SpaceAgentTask","\Microsoft\Windows\SpacePort"),
  ("SpaceManagerTask","\Microsoft\Windows\SpacePort"),
  ("SpeechModelDownloadTask","\Microsoft\Windows\Speech"),
  ("'Storage Tiers Management Initialization'","'\Microsoft\Windows\Storage Tiers Management'"),
  ("Tpm-HASCertRetr","\Microsoft\Windows\TPM"),
  ("Tpm-Maintenance","'\Microsoft\Windows\TPM'"),
  ("ResolutionHost","\Microsoft\Windows\WDI"),
  ("QueueReporting","'\Microsoft\Windows\Windows Error Reporting'"),
  ("BfeOnServiceStartTypeChange","'\Microsoft\Windows\Windows Filtering Platform'")

 # Disabling services that are not required
 foreach ($ServiceObject in $Services) {
    Write-Host Disabling service $ServiceObject[0] -ForegroundColor Cyan
    Invoke-Expression ("Set-Service " + $ServiceObject[1] +  " -StartupType Disabled")
    Invoke-Expression $Pausefor2
    }


 # Disabling Scheduled Tasks
 foreach ($ScheduledTaskObject in $ScheduledTasks) {
    Write-Host Disabling scheduled task $ScheduledTaskObject[0] -ForegroundColor Cyan
    Invoke-Expression ("Disable-ScheduledTask -TaskName " + $ScheduledTaskObject[0] + ' -TaskPath ' + $ScheduledTaskObject[1])
    Invoke-Expression $Pausefor2
    }