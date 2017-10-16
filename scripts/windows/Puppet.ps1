$url = "https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.3.2-x64.msi"
$output = "C:\Windows\Temp\puppet.msi"
Invoke-WebRequest -Uri $url -OutFile $output

$msiexec_args = "/qn /i C:\Windows\Temp\puppet.msi PUPPET_MASTER_SERVER=puppet.local PUPPET_AGENT_ENVIRONMENT=local PUPPET_AGENT_STARTUP_MODE=Disabled /log C:\Windows\Temp\puppet.log"
$msiexec_proc = [System.Diagnostics.Process]::Start("C:\Windows\System32\msiexec.exe", $msiexec_args)
$msiexec_proc.WaitForExit()

