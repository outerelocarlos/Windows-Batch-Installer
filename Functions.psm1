##########
#
# Windows Batch Installer - Main functions
# Primary Author: Carlos Outerelo <outerelocarlos@gmail.com>
# Primary Author Source: https://github.com/outerelocarlos/Windows-Batch-Installer
#
##########

Function InstallChocolatey {
	Write-Output "Installing Chocolatey..."
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco install chocolatey-core.extension -y
}

Function InstallWinget {
	Write-Host "Checking if WinGet is already installed..."
	if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
		'WinGet is already installed, moving on...'
	}  
	else{
		Write-Host "WinGet not found, installing WinGet..."
		
		Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
		Wait-Process -Id (Get-Process AppInstaller).Id
		Write-Host "WinGet installed, moving on..."
		
		while(!(Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe)) {
			Start-Sleep -Milliseconds 50
		}

		Write-Host "Closing the AppInstaller window..."
		Get-Process AppInstaller | Stop-Process

		<# $namespaceName = "root\cimv2\mdm\dmmap"
		$className = "MDM_EnterpriseModernAppManagement_AppManagement01"
		$wmiObj = Get-WmiObject -Namespace $namespaceName -Class $className
		Write-Host "Preparing the system for an update..."
		$result = $wmiObj.UpdateScanMethod()

		Write-Host "Updating some system components, this might take a few minutes..."

		while(!(Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe)) {
			Start-Sleep -Milliseconds 50
		}
		
		Write-Host "WinGet installed, moving on..." #>
	}
}

Function WingetSourceUpdate {
	Write-Host "Updating WinGet sources..."
	winget source update msstore
	winget source update winget	
}

Function WingetLogCleanup {
	$taskName = "WinGet Log Cleanup"
	$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }

	If(!$taskExists) {
		Write-Host "Creating a scheduled task to clean WinGet logs older than a week..."
		
	   	$action = New-ScheduledTaskAction -Execute 'forfiles.exe' -Argument '/P %LocalAppData%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\DiagOutputDir /S /M *.log /D -7 /C "cmd /c del @file"'
	
		$trigger =  @(
			#$(New-ScheduledTaskTrigger -Daily -At 5:00AM),
			$(New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30)
		)
				
		Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskName
	}
}

Function WingetAutoUpdate {
	$taskName = "WinGet Automatic Update"
	$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }

	If(!$taskExists) {
		Write-Host "Creating a scheduled task so that WinGet applications automatically update at system startup..."
		
	   	$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle Hidden -Noninteractive -NoProfile -NoLogo winget upgrade --silent --all'
	
	
		$trigger =  @(
			#$(New-ScheduledTaskTrigger -Daily -At 5:00AM),
			$(New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30)
		)
				
		Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskName
	}
}

Function ChocolateyAutoUpdate {
	$taskName = "Chocolatey Automatic Update"
	$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }

	If(!$taskExists) {
		Write-Host "Creating a scheduled task so that Chocolatey applications automatically update at system startup..."
		
	   	$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle Hidden -Noninteractive -NoProfile -NoLogo choco upgrade all -y'	
	
		$trigger =  @(
			#$(New-ScheduledTaskTrigger -Daily -At 5:00AM),
			$(New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30)
		)
				
		Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskName
	}
}

##########
#region Software Tweaks
##########

Function BetterFirefox_Standard {
	If (Test-Path $env:APPDATA\Mozilla\Firefox\Profiles) {
		Write-Host "Changing Firefox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\Firefox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Waterfox\Profiles) {
		Write-Host "Changing Waterfox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Waterfox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Mozilla\icecat\Profiles) {
		Write-Host "Changing Icecat settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\icecat\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Basilisk\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Basilisk\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\LibreWolf\Profiles) {
		Write-Host "Changing LibreWolf settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\LibreWolf\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\K-Meleon") {
		Write-Host "Changing K-Meleon settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\K-Meleon"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Standard/*.png -Recurse -Force
		Remove-Item Better-Firefox/Standard/*.md -Recurse -Force
		Remove-Item Better-Firefox/Standard/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Standard/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}
}

Function BetterFirefox_Advanced {
	If (Test-Path $env:APPDATA\Mozilla\Firefox\Profiles) {
		Write-Host "Changing Firefox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\Firefox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Waterfox\Profiles) {
		Write-Host "Changing Waterfox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Waterfox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Mozilla\icecat\Profiles) {
		Write-Host "Changing Icecat settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\icecat\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Basilisk\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Basilisk\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\LibreWolf\Profiles) {
		Write-Host "Changing LibreWolf settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\LibreWolf\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\K-Meleon") {
		Write-Host "Changing K-Meleon settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\K-Meleon"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Advanced/*.png -Recurse -Force
		Remove-Item Better-Firefox/Advanced/*.md -Recurse -Force
		Remove-Item Better-Firefox/Advanced/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Advanced/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}
}

Function BetterFirefox_Hardcore {
	If (Test-Path $env:APPDATA\Mozilla\Firefox\Profiles) {
		Write-Host "Changing Firefox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\Firefox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Waterfox\Profiles) {
		Write-Host "Changing Waterfox settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Waterfox\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\Mozilla\icecat\Profiles) {
		Write-Host "Changing Icecat settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\Mozilla\icecat\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Basilisk\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Basilisk\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles") {
		Write-Host "Changing Basilisk settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\Moonchild Productions\Pale Moon\Profiles"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path $env:APPDATA\LibreWolf\Profiles) {
		Write-Host "Changing LibreWolf settings to enhance the privacy and user experience of basic users..."
		set-location $env:APPDATA\LibreWolf\Profiles
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}

	If (Test-Path "$env:APPDATA\K-Meleon") {
		Write-Host "Changing K-Meleon settings to enhance the privacy and user experience of basic users..."
		set-location "$env:APPDATA\K-Meleon"
		$dirs = Get-ChildItem -Path . -Directory | Where-Object Name -notlike "Better-Firefox"
		git clone https://github.com/outerelocarlos/Better-Firefox.git
		Remove-Item Better-Firefox/Hardcore/*.png -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/*.md -Recurse -Force
		Remove-Item Better-Firefox/Hardcore/setup -Recurse -Force
		$source = Get-Item Better-Firefox/Hardcore/*
		foreach ($dir in $dirs){Copy-Item $source $dir.FullName -Recurse -Force}
		Remove-Item Better-Firefox -Recurse -Force
	}
}

# WIP
Function BetterOBS {
	If (Test-Path "C:\Program Files\obs-studio") {
		Write-Host "Installing OBS add-ons to expand upon OBS' default functionalities..."
		$dir = "C:\Program Files\obs-studio"
		set-location $dir
		git clone https://github.com/outerelocarlos/Better-OBS.git
		Remove-Item Better-OBS/*.md -Recurse -Force
		Remove-Item Better-OBS/.git -Recurse -Force
		Remove-Item Better-OBS/.gitattributes -Recurse -Force
		Remove-Item Better-OBS/setup -Recurse -Force
		$source = Get-Item Better-OBS/*
		Copy-Item $source $dir.FullName -Recurse -Force
		Remove-Item Better-OBS -Recurse -Force
	}
}

# WIP
Function VSCodeContextMenu {
	If (Test-Path "$env:LOCALAPPDATA\Programs\Microsoft VS Code") {
		Write-Host "Enabling the context menu item for Visual Studio Code..."
		New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

		If (!(Test-Path "HKCR:\*\shell\Open with VS Code")) {
			New-Item -Path "HKCR:\*\shell\Open with VS Code" -Value 'Edit with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\*\shell\Open with VS Code\command" -Value '"$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\*\shell\Open with VS Code" -Name "Icon" -Value '"$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\shell")) {
			New-Item -Path "HKCR:\Directory\shell" -Value 'Open folder with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\shell\command" -Value '"$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\shell" -Name "Icon" -Value '"$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\Background\shell")) {
			New-Item -Path "HKCR:\Directory\Background\shell" -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\Background\shell\vscode" -Value 'Open folder with VS Code' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\Background\shell\vscode" -Name "Icon" -Value '"$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe",0'
		
	} ElseIf (Test-Path "C:\Program Files\Microsoft VS Code") {
		Write-Host "Enabling the context menu item for Visual Studio Code..."
		New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

				If (!(Test-Path "HKCR:\*\shell\Open with VS Code")) {
			New-Item -Path "HKCR:\*\shell\Open with VS Code" -Value 'Edit with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\*\shell\Open with VS Code\command" -Value '"C:\Program Files\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\*\shell\Open with VS Code" -Name "Icon" -Value '"C:\Program Files\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\shell")) {
			New-Item -Path "HKCR:\Directory\shell" -Value 'Open folder with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\shell\command" -Value '"C:\Program Files\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\shell" -Name "Icon" -Value '"C:\Program Files\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\Background\shell")) {
			New-Item -Path "HKCR:\Directory\Background\shell" -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\Background\shell\vscode" -Value 'Open folder with VS Code' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\Background\shell\vscode" -Name "Icon" -Value '"C:\Program Files\Microsoft VS Code\Code.exe",0'

	} ElseIf (Test-Path "C:\Program Files (x86)\Microsoft VS Code") {
		Write-Host "Enabling the context menu item for Visual Studio Code..."
		New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

				If (!(Test-Path "HKCR:\*\shell\Open with VS Code")) {
			New-Item -Path "HKCR:\*\shell\Open with VS Code" -Value 'Edit with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\*\shell\Open with VS Code\command" -Value '"C:\Program Files (x86)\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\*\shell\Open with VS Code" -Name "Icon" -Value '"C:\Program Files (x86)\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\shell")) {
			New-Item -Path "HKCR:\Directory\shell" -Value 'Open folder with VS Code' -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\shell\command" -Value '"C:\Program Files (x86)\Microsoft VS Code\Code.exe" "%1"' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\shell" -Name "Icon" -Value '"C:\Program Files (x86)\Microsoft VS Code\Code.exe",0'

		If (!(Test-Path "HKCR:\Directory\Background\shell")) {
			New-Item -Path "HKCR:\Directory\Background\shell" -Force | Out-Null
		}
		
		New-Item -Path "HKCR:\Directory\Background\shell\vscode" -Value 'Open folder with VS Code' -Force | Out-Null
		Set-ItemProperty -Path "HKCR:\Directory\Background\shell\vscode" -Name "Icon" -Value '"C:\Program Files (x86)\Microsoft VS Code\Code.exe",0'
	}
}

##########
#endregion Software Tweaks
##########



##########
#region Auxiliary Functions
##########

Function CreateRestorePoint {
  Write-Output "Creating Restore Point"
  Enable-ComputerRestore -Drive "C:\"
  Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"
}

# Wait for key press
Function WaitForKey {
	Write-Output "Press any key to continue..."
	[Console]::ReadKey($true) | Out-Null
}

# Wait for key press
Function WaitForY {
	Write-Output "Do you want to restart now? If not, remember to do it later (Y/N)"
	do {
		$key = [Console]::ReadKey($true)
		$value = $key.KeyChar

		switch($value) {
			y { $y = Write-Output "Waiting for restart..."}
			n { $n = exit}
		}
	}	
	while ($value -notmatch 'y|n')
}

# Restart computer
Function Restart {
	Write-Output "Restarting..."
	Restart-Computer
}

##########
#endregion Auxiliary Functions
##########



##########
#region Testing Functions
##########

Function Download-AppxPackage {
	[CmdletBinding()]
	param (
	  [string]$Uri,
	  [string]$Path = "."
	)
   
	process {
		echo ""
		$StopWatch = [system.diagnostics.stopwatch]::startnew()
		$Path = (Resolve-Path $Path).Path
		#Get Urls to download
		Write-Host -ForegroundColor Yellow "Processing $Uri"
		$WebResponse = Invoke-WebRequest -UseBasicParsing -Method 'POST' -Uri 'https://store.rg-adguard.net/api/GetFiles' -Body "type=url&url=$Uri&ring=Retail" -ContentType 'application/x-www-form-urlencoded'
		$LinksMatch = ($WebResponse.Links | where {$_ -like '*.appx*'} | where {$_ -like '*_neutral_*' -or $_ -like "*_"+$env:PROCESSOR_ARCHITECTURE.Replace("AMD","X").Replace("IA","X")+"_*"} | Select-String -Pattern '(?<=a href=").+(?=" r)').matches.value
		$Files = ($WebResponse.Links | where {$_ -like '*.appx*'} | where {$_ -like '*_neutral_*' -or $_ -like "*_"+$env:PROCESSOR_ARCHITECTURE.Replace("AMD","X").Replace("IA","X")+"_*"} | where {$_ } | Select-String -Pattern '(?<=noreferrer">).+(?=</a>)').matches.value
		#Create array of links and filenames
		$DownloadLinks = @()
		for($i = 0;$i -lt $LinksMatch.Count; $i++){
			$Array += ,@($LinksMatch[$i],$Files[$i])
		}
		#Sort by filename descending
		$Array = $Array | sort-object @{Expression={$_[1]}; Descending=$True}
		$LastFile = "temp123"
		for($i = 0;$i -lt $LinksMatch.Count; $i++){
			$CurrentFile = $Array[$i][1]
			$CurrentUrl = $Array[$i][0]
			#Find first number index of current and last processed filename
			if ($CurrentFile -match "(?<number>\d)"){}
			$FileIndex = $CurrentFile.indexof($Matches.number)
			if ($LastFile -match "(?<number>\d)"){}
			$LastFileIndex = $LastFile.indexof($Matches.number)

			#If current filename product not equal to last filename product
			if (($CurrentFile.SubString(0,$FileIndex-1)) -ne ($LastFile.SubString(0,$LastFileIndex-1))) {
				#If file not already downloaded, add to the download queue
				if (-Not (Test-Path "$Path\$CurrentFile")) {
					"Downloading $Path\$CurrentFile"
					$FilePath = "$Path\$CurrentFile"
					$FileRequest = Invoke-WebRequest -Uri $CurrentUrl -UseBasicParsing #-Method Head
					[System.IO.File]::WriteAllBytes($FilePath, $FileRequest.content)
				}
			#Delete file outdated and already exist
			}elseif ((Test-Path "$Path\$CurrentFile")) {
				Remove-Item "$Path\$CurrentFile"
				"Removing $Path\$CurrentFile"
			}
			$LastFile = $CurrentFile
		}
		"Time to process: "+$StopWatch.ElapsedMilliseconds
	}
}

##########
#endregion Testing Functions
##########



# Export functions
Export-ModuleMember -Function *