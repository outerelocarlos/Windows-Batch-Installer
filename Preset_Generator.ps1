##########
#
# Windows Batch Installer - Preset Generator
# Primary Author: Carlos Outerelo <outerelocarlos@gmail.com>
# Primary Author Source: https://github.com/outerelocarlos/Windows-Batch-Installer
#
##########

#################### Translator: from "README.md" to the Blank Template ####################

$selectors = @(
	'([#]{3})'
	'  [(*)] [w, c, N, ~, BetterFirefox, WaitForY, Restart]'
	'[*] [*][*][\[]'
)

if (!(Test-Path("- Presets"))) {
	New-Item -Path "- Presets" -ItemType Directory | Out-Null
}

if (!(Test-Path("- Custom Presets"))) {
	New-Item -Path "- Custom Presets" -ItemType Directory | Out-Null
}

(Select-String -Path README.md -Pattern $selectors).Line | Set-Content "- Presets\Blank Template.preset"
sed -i '0,/### Runtimes/d' ".\- Presets\Blank Template.preset"

#" ,;.:-_´¨`^+*!@·#$~%€&¬/='?¡¿\)\(\[\]\{\}"

$transform = @(
	$('Microsoft Edge\]\(https://www.microsoft.com/edge', 'Built-in Microsoft Edge](https://www.microsoft.com/edge'),
	$('([#]{3,4}) (.*)', '
#################### $2 ####################'),
	$('[*] [*][*][.\-\[\]]+', '
### '),
	$('  [*] ', '# '),
	$('~~'),
	$('  #', '#'),
	$("]([(])[a-zA-Z]*([:][/][/])*[a-zA-Z0-9 +-/!#@$%^&=?¿*.,]*([)][*][*][:])[a-zA-Z0-9 _:+-/!#@$%^&~=?¿*`.,;\)\(\[\]'’]*"),
	$("[\[]{2}[0-9][\]\(][a-zA-Z0-9 _:+-/!@$%^&=`?¿*.,)(.\-\)\(\[\]'’]*"),
	$(' \(see \[Development\]\(#development\)\).'),
	$('### Built-in Microsoft Edge', '### Microsoft Edge
# winget install -e --id Microsoft.Edge 
# choco install microsoft-edge -y '),
	$("# Set a given page [a-zA-Z0-9 _:+-/!@$%^&~=?¿*`.,;\)\(\[\]'’]*", "
### MSEdgeRedirect"),
	$('# BetterFirefox_Standard', '
# BetterFirefox_Standard'),
	$('# WaitForY', '
# WaitForY')
)

foreach ($item in $transform) {
	(gc "- Presets\Blank Template.preset") -replace $item | Out-File "- Presets\Blank Template.preset" -Encoding utf8
}

$header = "##########
##
## Windows Batch Installer - Preset
## Primary Author: Carlos Outerelo <outerelocarlos@gmail.com>
## Primary Author Source: https://github.com/outerelocarlos/Windows-Batch-Installer
##
##########"

$header2 = "
#################### Script Setup ####################

RequireAdmin 
# CreateRestorePoint 
# InstallWinget 
# InstallChocolatey 

#################### Script Extras ####################

# WingetSourceUpdate 
# WingetLogCleanup 
# WingetAutoUpdate # NOT RECOMMENDED (some apps misbehave)
# ChocolateyAutoUpdate 

#################### Runtimes ####################"

$($header; $header2; Get-Content "- Presets\Blank Template.preset") | Set-Content "- Presets\Blank Template.preset"
(gc "- Presets\Blank Template.preset") -replace 'Preset', 'Blank Template' | Out-File "- Presets\Blank Template.preset" -Encoding utf8

$cmd = '@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Core.ps1" -include "%~dp0..\Functions.psm1" -preset "%~dpn0.preset" -log "%~dpn0.log"'
$cmd | Set-Content "- Presets\Blank Template.cmd"

#################### Preset Generation ####################

### Preset Generation Function

Function Generator {
	Param($preset, $selection)
	
	Write-Host Building $preset
	
	$file1 = $preset + ".preset"
	$file2 = $preset + ".cmd"
	
	$folder = $preset.Substring(0, $preset.IndexOf("\") + 1)	
	if (!(Test-Path($folder))) {
		New-Item -Path $folder -ItemType Directory | Out-Null
	}
	
	$cmd | Set-Content $file2
	
	if ($folder.Contains("WinGet")) {
		(gc "WinGet Presets\Blank Template.preset") | Out-File $file1 -Encoding utf8
	} elseif ($folder.Contains("Chocolatey")) {
		(gc "Chocolatey Presets\Blank Template.preset") | Out-File $file1 -Encoding utf8
	} else {
		(gc "- Presets\Blank Template.preset") | Out-File $file1 -Encoding utf8
	}
	
	$name = $preset -replace "([a-zA-Z -]*)([\u005C])"
	(gc $file1) -replace 'Blank Template', ($name + ' Preset') | Out-File $file1 -Encoding utf8
	
	$source_agreement = 0;

	foreach ($item in $selection) {
		if ($item.Contains("winget install") -And !$item.Contains('winget install -e --id Microsoft.VC++') -And $source_agreement -eq 0) {
			$replacement = $item + "--accept-source-agreements"
			$source_agreement = 1;
		} elseif ($item.Contains("winget install") -And $item.Contains('winget install -e --id Microsoft.VC++') -And $source_agreement -eq 0) {
			$replacement = $item -replace 'winget install', 'winget install --accept-source-agreements'
			$source_agreement = 1;
		} else {
			$replacement = $item
		}

		if ($item.Contains('winget install -e --id Microsoft.VC++')) {
			(gc $file1) -replace "# winget install -e --id Microsoft.VC\u002B\u002B", $replacement | Out-File $file1 -Encoding utf8
		} elseif ($item.Contains('winget install -e --id Notepad++.Notepad++')) {
			(gc $file1) -replace "# winget install -e --id Notepad\u002B\u002B.Notepad\u002B\u002B", $replacement | Out-File $file1 -Encoding utf8
		} elseif ($item.Contains('winget install -e --name "Disney+"')) {
			(gc $file1) -replace "# winget install -e --name Disney\u002B", $replacement | Out-File $file1 -Encoding utf8
		} else {
			(gc $file1) -replace ("# " + $item), $replacement | Out-File $file1 -Encoding utf8
		}
	}
}

### Package Selection

$minimum = @(
	'CreateRestorePoint'
	'InstallWinget'
	'InstallChocolatey'
	'WingetSourceUpdate'
	'ChocolateyAutoUpdate'

	'winget install -e --id Oracle.JavaRuntimeEnvironment '
	'winget install -e --id Microsoft.VC++'

	'winget install -e --id 9NCTDW2W1BH8 '
	'winget install -e --id 9PMMSR1CGPWG '
	'winget install -e --id 9NMZlZ57R3T7 '
	'winget install -e --id 9MVZQVXJBQ9V '
	'winget install -e --id 9N95Q1ZZPMH4 '

	'winget install -e --id 7zip.7zip '
	'winget install -e --id Adobe.Acrobat.Reader.32-bit '

	'winget install -e --id VideoLAN.VLC '

	'winget install -e --id AdrienAllard.FileConverter '

	'WaitForY '
	'Restart '
)

$basic = $minimum + @(
	'winget install -e --id Git.Git '
	'winget install -e --id Mozilla.Firefox '
	'BetterFirefox_Standard '
	'winget install -e --id ONLYOFFICE.DesktopEditors '
)

$recommended = $basic + @(
	'winget install -e --id GnuWin32.Wget '
	'choco install adwcleaner -y '
	'winget install -e --id Notepad++.Notepad++ '
	'winget install -e --id ShareX.ShareX '
	'winget install -e --id voidtools.Everything '
)

$advanced = $recommended + @(
	'choco install sed -y '
	'winget install -e --id REALiX.HWiNFO '
	'winget install -e --id qBittorrent.qBittorrent '
	'winget install -e --id Microsoft.PowerToys '
)

$outerelocarlos = @(
	'CreateRestorePoint'
	'InstallWinget'
	'WingetSourceUpdate'

	'InstallChocolatey'
	'ChocolateyAutoUpdate'

	'winget install -e --id Oracle.JavaRuntimeEnvironment '
	'winget install -e --id Microsoft.VC++'	

	'winget install -e --id 9NCTDW2W1BH8 '
	'winget install -e --id 9PMMSR1CGPWG '
	'winget install -e --id 9NMZlZ57R3T7 '
	'winget install -e --id 9MVZQVXJBQ9V '
	'winget install -e --id 9N95Q1ZZPMH4 '

	'winget install -e --id Git.Git '
	'winget install -e --id GnuWin32.Wget '
	'choco install sed -y '
	'choco install ffmpeg-full -y '
	'choco install nircmd -y '

	'winget install -e --id CPUID.CPU-Z '
	'winget install -e --id TechPowerUp.GPU-Z '
	'winget install -e --id REALiX.HWiNFO '
	'choco install msiafterburner -y '
	'winget install -e --id 9PGZKJC81Q7 '
	'choco install prime95 -y '
	'winget install -e --id FinalWire.AIDA64.Extreme '
  	'winget install -e --id FinalWire.AIDA64.Engineer '
	'winget install -e --id Geeks3D.MSIKombustor '

	'choco install adwcleaner -y '
	'winget install -e --id BiniSoft.WindowsFirewallControl '
	'winget install -e --id Klocman.BulkCrapUninstaller '
	'choco install ddu -y '
	'winget install -e --id BleachBit.BleachBit '
	'winget install -e --id Piriform.Recuva '

	'winget install -e --id Mozilla.Firefox '
	'BetterFirefox_Advanced '
	'winget install -e --id TorProject.TorBrowser '
	'winget install -e --id rcmaehl.MSEdgeRedirect '
	'winget install -e --id BraveSoftware.BraveBrowser '
	'winget install -e --id PaulFrazee.BeakerBrowser '

	'winget install -e --id qBittorrent.qBittorrent '
	'winget install -e --id AppWork.JDownloader '
	
	'winget install -e --id Foundry376.Mailspring '

	'winget install -e --id 7zip.7zip '

	'winget install -e --id Notepad++.Notepad++ '

	'choco install office-tool -y '
	'winget install -e --id ONLYOFFICE.DesktopEditors '

	'winget install -e --id geeksoftwareGmbH.PDF24Creator '
	
	'choco install photogimp -y '

	'winget install -e --id ShareX.ShareX '

	'winget install -e --id VideoLAN.VLC '

	'winget install -e --id Plex.Plex '
	'winget install -e --id Jellyfin.JellyfinMediaPlayer '
	'winget install -e --id XBMCFoundation.Kodi '

	'winget install -e --id OBSProject.OBSStudio '	
	'winget install -e --id Avidemux.Avidemux '
	'winget install -e --id HandBrake.HandBrake '
	'winget install -e --id MKVToolNix.MKVToolNix '

	'winget install -e --id Plex.Plexamp '

	'winget install -e --id VB-Audio.Voicemeeter.Banana '
	'winget install -e --id Cockos.REAPER '

	'winget install -e --id BlenderFoundation.Blender '

	'winget install -e --id Discord.Discord '

	'winget install -e --id Telegram.TelegramDesktop '
	'winget install -e --id WhatsApp.WhatsApp '

	'winget install -e --id TeamViewer.TeamViewer '

	'winget install -e --id Playnite.Playnite '
	'winget install -e --id Valve.Steam '
	'winget install -e --id EpicGames.EpicGamesLauncher '
	'winget install -e --id GOG.Galaxy '
	'winget install -e --id Ubisoft.Connect '
	'winget install -e --id Amazon.Games '

	'winget install -e --id Parsec.Parsec '
	'winget install -e --id MoonlightGameStreamingProject.Moonlight '
	'winget install -e --id NexusMods.Vortex '
	'winget install -e --id Codeusa.BorderlessGaming '
	'winget install -e --id SideQuestVR.SideQuest '

	'winget install -e --id Microsoft.VisualStudioCode '
	'winget install -e --id Microsoft.VisualStudio.2022.Community '
	'winget install -e --id GitHub.GitHubDesktop '
	'winget install -e --id JetBrains.Toolbox '
	'winget install -e --id Google.AndroidStudio '
	'winget install -e --id UnityTechnologies.UnityHub '
	'winget install -e --id RProject.R '
	'winget install -e --id RStudio.RStudio.OpenSource '
	'winget install -e --id RProject.Rtools '
	'winget install -e --id Python.Python.3 '
	'winget install -e --id Anaconda.Anaconda3 '
	'winget install -e --id Spyder.Spyder '

	'winget install -e --id Microsoft.dotNetFramework '
	'winget install -e --id Kitware.CMake '
	'winget install -e --id Docker.DockerDesktop '
	'winget install -e --id OpenJS.NodeJS '
	'winget install -e --id NSIS.NSIS '
	'winget install -e --id WinMerge.WinMerge '
	'winget install -e --id ApacheFriends.Xampp '

	'winget install -e --id Zotero.Zotero '

	'winget install -e --id Microsoft.PowerToys '
	'winget install -e --id xanderfrangos.twinkletray '

	'winget install -e --id AdrienAllard.FileConverter '
	'winget install -e --id MediaArea.MediaInfo '
	'winget install -e --id HermannSchinagl.LinkShellExtension '

	'winget install -e --id voidtools.Everything '
	'winget install -e --id Wox.Wox '

	'winget install -e --id VMware.WorkstationPlayer '

	'winget install -e --id Lexikos.AutoHotkey '
	'choco install hxd -y '
	'choco install rufus -y '
	'choco install ventoy -y '
	'winget install -e --id HulubuluSoftware.AdvancedRenamer '
	'winget install -e --id DupeGuru.DupeGuru '

	'winget install -e --id Nvidia.GeForceExperience '
	'winget install -e --id Corsair.iCUE.4 '
	'winget install -e --id Logitech.GHUB '

	'WaitForY'
	'Restart'
)

$mywindowsmediaserver = $outerelocarlos -ne @(
	'winget install -e --id Nvidia.GeForceExperience '
)

$mywindowsmediaserver = $mywindowsmediaserver + @(
	'winget install -e --id Plex.PlexMediaServer '
	'winget install -e --id Jellyfin.JellyfinServer '

	'winget install -e --id TeamSonarr.Sonarr '
	'winget install -e --id TeamLidarr.Lidarr '
	'winget install -e --id TeamRadarr.Radarr '
)

### Preset Generation Process

Generator -preset "- Presets\Minimum" -selection $minimum
Generator -preset "- Presets\Basic" -selection $basic
Generator -preset "- Presets\Recommended" -selection $recommended
Generator -preset "- Presets\Advanced" -selection $advanced
Generator -preset "- Custom Presets\outerelocarlos" -selection $outerelocarlos
Generator -preset "- Custom Presets\mywindowsmediaserver" -selection $mywindowsmediaserver

### Function Tester

(gc "- Presets\Blank Template.preset") -replace "# " | Out-File "- Custom Presets\Tester.preset" -Encoding utf8
$cmd | Set-Content "- Custom Presets\Tester.cmd"

#################### Translator: from the global Blank Template to winget's own Blank Template ####################

$selectors = @(
	'
([#]{3}) '
	'([#]{20})'
	'winget install'
	'BetterFirefox'
	'WaitForY'
	'Restart'
)

if (!(Test-Path("WinGet Presets"))) {
	New-Item -Path "WinGet Presets" -ItemType Directory | Out-Null
}
(Select-String -Path "- Presets\Blank Template.preset" -Pattern $selectors).Line | Set-Content "WinGet Presets\Blank Template.preset"

$transform = @(
	$('
([#]{3}) (.*)'),
	$(' ([#]{20})'),
	$('([#]{20}) ', '
### '),
	$('### Script Setup', '### Script Setup
RequireAdmin
# CreateRestorePoint
# InstallWinget'),
	$('### Script Extras', '### Script Extras
# WingetSourceUpdate
# WingetLogCleanup
# WingetAutoUpdate # NOT RECOMMENDED (some apps misbehave)')
)

foreach ($item in $transform) {
	(gc "WinGet Presets\Blank Template.preset") -replace $item | Out-File "WinGet Presets\Blank Template.preset" -Encoding utf8
}

$($header; Get-Content "WinGet Presets\Blank Template.preset") | Set-Content "WinGet Presets\Blank Template.preset"
(gc "WinGet Presets\Blank Template.preset") -replace 'Preset', 'WinGet Blank Template' | Out-File "WinGet Presets\Blank Template.preset" -Encoding utf8
$cmd | Set-Content "WinGet Presets\Blank Template.cmd"

#################### WinGet Preset Generation ###################

$minimum_winget = @(
	'CreateRestorePoint'
	'InstallWinget'
	'WingetSourceUpdate'
	
	'winget install -e --id Oracle.JavaRuntimeEnvironment '
	'winget install -e --id Microsoft.VC++'	

	'winget install -e --name "Raw Image Extension" --source msstore '
	'winget install -e --name "HEIF Image Extensions" --source msstore '
	'winget install -e --name "HEVC Video Extensions" --source msstore '
	'winget install -e --name "AV1 Video Extensions" --source msstore '
	'winget install -e --name "MPEG-2 Video Extensions" --source msstore '

	'winget install -e --id 7zip.7zip '
	'winget install -e --id Adobe.Acrobat.Reader.32-bit '
	
	'winget install -e --id VideoLAN.VLC '
	'winget install -e --id AdrienAllard.FileConverter '
	
	'WaitForY'
	'Restart'
)

$basic_winget = $minimum_winget + @(
	'winget install -e --id Git.Git '
	'winget install -e --id Mozilla.Firefox '
	'BetterFirefox_Standard '
	'winget install -e --id ONLYOFFICE.DesktopEditors '
)

$recommended_winget = $basic_winget + @(
	'winget install -e --id GnuWin32.Wget '
	'winget install -e --id Notepad++.Notepad++ '
	'winget install -e --id ShareX.ShareX '
	'winget install -e --id voidtools.Everything '
)

$advanced_winget = $recommended_winget + @(
	'winget install -e --id REALiX.HWiNFO '
	'winget install -e --id qBittorrent.qBittorrent '
	'winget install -e --id Microsoft.PowerToys '
)

$outerelocarlos_winget = $outerelocarlos -ne @(
	'choco install javaruntime -y '
	'choco install ffmpeg-full -y '
	'choco install nircmd -y '
	'choco install msiafterburner -y '
	'choco install prime95 -y '
	'choco install adwcleaner -y '
	'choco install ddu -y '
	'choco install office-tool -y '
	'choco install photogimp -y '
	'choco install hxd -y '
	'choco install rufus -y '
	'choco install ventoy -y '
)

$outerelocarlos = $outerelocarlos + @(
	'winget install -e --id Oracle.JavaRuntimeEnvironment '
)

$mywindowsmediaserver_winget = $mywindowsmediaserver -ne @(
	'choco install javaruntime -y '
	'choco install ffmpeg-full -y '
	'choco install nircmd -y '
	'choco install msiafterburner -y '
	'choco install prime95 -y '
	'choco install adwcleaner -y '
	'choco install ddu -y '
	'choco install office-tool -y '
	'choco install photogimp -y '
	'choco install hxd -y '
	'choco install rufus -y '
	'choco install ventoy -y '
)

$mywindowsmediaserver_winget = $mywindowsmediaserver + @(
	'winget install -e --id Oracle.JavaRuntimeEnvironment '
)

### Preset Generation Process

Generator -preset "WinGet Presets\Minimum" -selection $minimum_winget
Generator -preset "WinGet Presets\Basic" -selection $basic_winget
Generator -preset "WinGet Presets\Recommended" -selection $recommended_winget
Generator -preset "WinGet Presets\Advanced" -selection $advanced_winget
Generator -preset "WinGet Custom Presets\outerelocarlos" -selection $outerelocarlos_winget
Generator -preset "WinGet Custom Presets\mywindowsmediaserver" -selection $mywindowsmediaserver_winget

### Function Tester

if (!(Test-Path("WinGet Custom Presets"))) {
	New-Item -Path "WinGet Custom Presets" -ItemType Directory | Out-Null
}
(gc "WinGet Presets\Blank Template.preset") -replace "# " | Out-File "WinGet Custom Presets\Tester.preset" -Encoding utf8
$cmd | Set-Content "WinGet Custom Presets\Tester.cmd"

#################### Translator: from the global Blank Template to Chocolatey's own Blank Template ####################

$selectors = @(
	'
([#]{3}) '
	'([#]{20})'
	'choco install'
	'BetterFirefox'
	'WaitForY'
	'Restart'
)

if (!(Test-Path("Chocolatey Presets"))) {
	New-Item -Path "Chocolatey Presets" -ItemType Directory | Out-Null
}
(Select-String -Path "- Presets\Blank Template.preset" -Pattern $selectors).Line | Set-Content "Chocolatey Presets\Blank Template.preset"

$transform = @(
	$('
([#]{3}) (.*)'),
	$(' ([#]{20})'),
	$('([#]{20}) ', '
### '),
	$('### Script Setup', '### Script Setup
RequireAdmin
# CreateRestorePoint
# InstallChocolatey
# ChocolateyAutoUpdate')
)

foreach ($item in $transform) {
	(gc "Chocolatey Presets\Blank Template.preset") -replace $item | Out-File "Chocolatey Presets\Blank Template.preset" -Encoding utf8
}

$($header; Get-Content "Chocolatey Presets\Blank Template.preset") | Set-Content "Chocolatey Presets\Blank Template.preset"
(gc "Chocolatey Presets\Blank Template.preset") -replace 'Preset', 'Chocolatey Blank Template' | Out-File "Chocolatey Presets\Blank Template.preset" -Encoding utf8
$cmd | Set-Content "Chocolatey Presets\Blank Template.cmd"

#################### Chocolatey Preset Generation ###################

$minimum_chocolatey = @(
	'CreateRestorePoint'
	'InstallChocolatey'
	'ChocolateyAutoUpdate'
	
	'choco install javaruntime -y'
	'choco install vcredist-all -y'

	'choco install 7zip -y'
	'choco install adobereader -y'
	
	'choco install vlc -y'
	'choco install file-converter -y'
	
	'WaitForY'
	'Restart'
)

$basic_chocolatey = $minimum_chocolatey + @(
	'choco install git -y'
	'choco install firefox -y'
	'BetterFirefox_Standard'
	'choco install onlyoffice -y'
)

$recommended_chocolatey = $basic_chocolatey + @(
	'choco install wget -y'
	'choco install adwcleaner -y'
	'choco install notepadplusplus -y'
	'choco install sharex -y'
	'choco install everything -y'
)

$advanced_chocolatey = $recommended_chocolatey + @(
	'choco install sed -y '
	'choco install hwinfo -y'
	'choco install qbittorrent -y'
	'choco install powertoys -y'
)

### Preset Generation Process

Generator -preset "Chocolatey Presets\Minimum" -selection $minimum_chocolatey
Generator -preset "Chocolatey Presets\Basic" -selection $basic_chocolatey
Generator -preset "Chocolatey Presets\Recommended" -selection $recommended_chocolatey
Generator -preset "Chocolatey Presets\Advanced" -selection $advanced_chocolatey

### Function Tester

if (!(Test-Path("Chocolatey Custom Presets"))) {
	New-Item -Path "Chocolatey Custom Presets" -ItemType Directory | Out-Null
}
(gc "Chocolatey Presets\Blank Template.preset") -replace "# " | Out-File "Chocolatey Custom Presets\Tester.preset" -Encoding utf8
$cmd | Set-Content "Chocolatey Custom Presets\Tester.cmd"

#################### Software Tweaks Generation ###################

$cmd_tweaks = '@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Core.ps1" -include "%~dp0..\Functions.psm1" -log "%~dpn0.log"'

$cmd_tweaks + " BetterFirefox_Standard" | Set-Content "Software Tweaks\BetterFirefox - Standard.cmd"
$cmd_tweaks + " BetterFirefox_Advanced" | Set-Content "Software Tweaks\BetterFirefox - Advanced.cmd"
$cmd_tweaks + " BetterFirefox_Hardcore" | Set-Content "Software Tweaks\BetterFirefox - Hardcore.cmd"