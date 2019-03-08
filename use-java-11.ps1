Try 
{ 
  If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
  {
    # Relaunch as an elevated process:
	Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
    exit
  }

  $jdk="openjdk@1.11.0"
  jabba install $jdk
  jabba use $jdk

  $envRegKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
  $envPath=$envRegKey.GetValue('Path', $null, "DoNotExpandEnvironmentNames").replace('$JAVA_HOME\bin;', '')
  [Environment]::SetEnvironmentVariable('JAVA_HOME', "$(jabba which $(jabba current))", 'Machine')
  [Environment]::SetEnvironmentVariable('PATH', "$(jabba which $(jabba current))/bin;$envPath", 'Machine')
  echo "Switched to $jdk"
}
Catch 
{
  $ErrorMessage = $_.Exception.Message
  Write-Error -Message "$ErrorMessage"
  read-host 'Press Enter to continue...' 
}