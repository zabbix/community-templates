' ==============================================================================
' Speedtest to Zabbix - Silent Background Execution Wrapper
' Runs PowerShell without displaying any console window (eliminates 1-ms popup flicker)
' ==============================================================================
Option Explicit

Dim objShell, strCommand, i, strSysRoot, strPsExe
Set objShell = CreateObject("WScript.Shell")

' Resolve absolute path to Windows built-in PowerShell to prevent 0x80070002 errors
strSysRoot = objShell.ExpandEnvironmentStrings("%SystemRoot%")
strPsExe = strSysRoot & "\System32\WindowsPowerShell\v1.0\powershell.exe"

strCommand = """" & strPsExe & """ -NoProfile -ExecutionPolicy Bypass"

' Append all passed arguments safely
For i = 0 To WScript.Arguments.Count - 1
    strCommand = strCommand & " """ & WScript.Arguments(i) & """"
Next

' Run completely hidden: 0 = SW_HIDE, True = wait for completion
objShell.Run strCommand, 0, True
