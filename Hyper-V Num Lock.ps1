# Works for turned off machines only
$offMachines = Get-Vm  | Where-Object -Property State -EQ "Off"
$offMachines | Set-VMBios -EnableNumLock
