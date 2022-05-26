# Windows Batch Installer

PowerShell project to install multiple programs at once using the official [Windows Package Manager (WinGet)](https://docs.microsoft.com/windows/package-manager/) and/or the community-driven [Chocolatey Package Manager](https://chocolatey.org/).

Multiple premade presets were built so that users could choose whichever one fits their needs the most without having to modify files too much or at all. It is also possible (and easy) to edit any of the provided `.preset` files to customize the software selection.

## Contents

* [WinGet vs. Chocolatey](#winget-vs-chocolatey)
* [Users Beware](#users-beware)
* [Presets](#presets)
* [General Documentation](#general-documentation)
* [Software Documentation](#software-documentation)
  
  * [Runtimes](#runtimes)
  * [Additional File Extension Support](#additional-file-extension-support)
  * [Command Line Utilities](#command-line-utilities)
  * [System Monitoring and Control](#system-monitoring-and-control)
  * [System Security, Recovery and Clean-up](#system-security-recovery-and-clean-up)

  * [Web Browsers](#web-browsers)
  * [Cloud Storage](#cloud-storage)
  * [Downloading Tools](#downloading-tools)
  * [Password Managers](#password-managers)
  * [Email Clients](#email-clients)

  * [File Archivers](#file-archivers)
  * [Text Editors](#text-editors)
  * [Office Suites](#office-suites)
  * [PDF Readers/Editors](#pdf-readerseditors)
  * [Book/Comic Readers](#bookcomic-readers)

  * [Image Viewers](#image-viewers)
  * [Image Edition](#image-edition)
  * [Screenshots](#screenshots)

  * [Video Players](#video-players)
  * [Video Streaming](#video-streaming)
  * [Video Streaming Production](#video-streaming-production)
  * [Video Production](#video-production)

  * [Music Players](#music-players)
  * [Music Streaming](#music-streaming)
  * [Audio Production](#audio-production)

  * [3D Production](#3d-production)

  * [Productivity](#productivity)

  * [Audiovisual Communication](#audiovisual-communication)
  * [Text-based Communication](#text-based-communication)
  * [Remote Desktop](#remote-desktop)

  * [Gaming Platforms](#gaming-platforms)
  * [Gaming Emulators](#gaming-emulators)
  * [Gaming Utilities](#gaming-utilities)

  * [Coding](#coding)
  * [Development Tools](#development-tools)
  * [Research Tools](#research-tools)

  * [Windows Desktop Environment](#windows-desktop-environment)
  * [Context Menu Extensions](#context-menu-extensions)
  * [Windows Search Alternatives](#windows-search-alternatives)
  * [Windows Explorer Alternatives](#windows-explorer-alternatives)
  * [File Transfer Alternatives](#file-transfer-alternatives)
  * [Virtual Machine Managers](#virtual-machine-managers)
  * [Miscellaneous Tools](#miscellaneous-tools)

  * [Hardware-specific Tools](#hardware-specific-tools)
  * [The End](#the-end)

<br>

## WinGet vs. Chocolatey

The Windows Package Manager is backed up by Microsoft itself, and its officiality is likely to make of it the [apt](https://en.wikipedia.org/wiki/APT_(software)) of Windows systems. However, at the time of writing, WinGet presents some issues that need to be addressed as soon as possible. The most notorious one, in my experience, happens when running the `winget upgrade` command to update one or multiple programs: certain applications install their most recent version without removing/overwriting the one that is already installed in the system, keeping both installed. As such, **running `winget upgrade --all` to update all software at once is not recommended**.

Each package manager supports a different selection of software. Whereas Chocolatey may be the largest online registry of Windows packages, certain software can only be installed via the Windows Package Manager (particularly Microsoft Store applications, which Chocolatey cannot install). It is also worth noting that Chocolatey packages are maintained by a community of dedicated users who, despite their amazing work (for which I am sincerely grateful), lead to Chocolatey's biggest weakness: it depends on said users to keep its packages functioning and up-to-date. I have seen a handful of Chocolatey packages being abandoned due to their modest popularity, an issue I have not found with WinGet installs.

That aside, Chocolatey works wonderfully to install/uninstall software and, unlike WinGet, it updates software without issue. What's more, Chocolatey works with all Windows versions since Windows Vista (since it depends solely on Powershell) whereas the Windows Package Manager requires Windows 10 1809 (build 17763) or newer at the time of writing. WinGet does not support Windows Server 2019 either (might work on Windows Server 2022 if its dependencies are manually installed).

All in all, both package managers have their own strengths and issues. Both are co-existing now and are likely to so in the near future.

<br>

## Users Beware

If any errors/problems arise please raise an issue via GitHub or drop me a mail at outerelocarlos@gmail.com

Note that WinGet and/or Chocolatey related problems might take place: I have seen installations fail (e.g. due to hashes not matching), installation processes failing to complete and a handful of Chocolatey packages being abandoned due to their modest popularity.  
These issues are out of my scope, but you can notify me of any misbehaving packages so that I may tag them as such.

### Requirements

Having a Windows-based system and Internet connection. Chocolatey works with all Windows versions since Windows Vista (since it depends solely on Powershell) whereas the Windows Package Manager requires Windows 10 1809 (build 17763) or newer at the time of writing. WinGet does not support Windows Server 2019 either (might work on Windows Server 2022 if its dependencies are manually installed).

Make sure your account is a member of the *Administrators* group as the script requires elevated privileges.

Being logged into a Microsoft account is also recommended, since that allows WinGet to install software from the Microsoft Store.

### Sysadmins Beware

The provided premade presets are detailed later on, but beware that any preset using the Windows Package Manager will try to install the tool if not detected. If so, and as of now, users will be prompted with a confirmation window which middles with the project's automated nature.  
Some Windows systems come with WinGet pre-installed or silently install it during a Windows update, but if yours has not and your use-case is affected by this inconvenience then use the Chocolatey-exclusive presets and/or use [the provided Chocolatey-based blank template](/Chocolatey%20Presets/Blank%20Template.preset) to develop your own preset.

### Appreciation

You can show your appreciation via [PayPal](https://paypal.me/outerelocarlos) and/or [Ko-fi](https://ko-fi.com/outerelocarlos).

<br>

## Presets

As previously stated, multiple premade presets were built so that users could choose whichever one fits their needs the most without having to modify files too much or at all. It is also possible (and easy) to edit any of the provided `.preset` files to customize the software selection.  
The presets are stored in the following six folders:

| Folder                                                          | Target                     | Uses WinGet  | Uses Chocolatey |
| --------------------------------------------------------------- | -------------------------- |:------------:|:---------------:|
| [- Custom Presets](/-%20Custom%20Presets)                       | Family, friends and myself | &check;      | &check;         |
| [- Presets](/-%20Presets)                                       | Any/all users              | &check;      | &check;         |
| [Chocolatey Custom Presets](/Chocolatey%20Custom%20Presets)     | Family, friends and myself | &cross;      | &check;         |
| [Chocolatey Presets](/Chocolatey%20Presets)                     | Any/all users              | &cross;      | &check;         |
| [WinGet Custom Presets](/WinGet%20Custom%20Presets)             | Family, friends and myself | &check;      | &cross;         |
| [WinGet Presets](/WinGet%20Presets)                             | Any/all users              | &check;      | &cross;         |

Each of the individual presets is defined by two files:

* A `.cmd` file: this is the one to click upon in order to start the install process.
* A `.preset` file: this is the one that determines which programs to install. Can be edited to one's liking.

The user-oriented presets found in the user-oriented folders are tier-sorted as follows.

### Blank Template

An empty template which is not much of a preset by itself, but works as a mold with which to build one. To do so, edit the `Blank Template.preset` file and uncomment the lines you want to run.  
Beware that installing WinGet and/or Chocolatey packages requires WinGet and/or Chocolatey to be installed (the very first functions of these presets do precisely so, just remember to uncomment them if needed).

### Minimum

The bare minimum install, only including the essential software that I think any computer should have installed, namely:

* **The package manager itself** (WinGet and/or Chocolatey), without which none of this works.
* **Java**: the Java Runtime Environment is required by some applications to function as intended.
* **Microsoft Visual Code C++ Redistributables**: additional runtime libraries, required by many applications built using Microsoft C and C++ tools.
* **7-Zip**: the most popular file archiver for the Windows ecosystem.
* **Adobe Reader**: the most popular PDF reader for the Windows ecosystem.
* **VLC**: the most popular video player for the Windows ecosystem.
* **File Converter**: a simple tool which allows one to convert and compress files using the context menu in Windows Explorer.

This preset also adds support for several file extensions. It does so through several add-ons which are [properly documented later on](#additional-file-extension-support), but beware that they can only be installed if the preset makes use of the Windows Package Manager and if the user is logged into a Microsoft account (since the add-ons are downloaded from the Microsoft Store).

### Basic

A slightly more complete version of the [Minimum preset](#minimum). It aims to build an office-ready system by adding the following software:

* **Git**: a command-line utility designed to manage and handle IT projects. All of the provided presets (besides the [Minimum](#minimum) one) use Git to improve the default Firefox experience based on [another project of mine](https://github.com/outerelocarlos/Better-Firefox).
* **Firefox**: although Edge is good enough these days, I recommend Firefox to avoid Microsoft's telemetry, Google's monopoly (even Edge is based on Chromium now) and also due to [the aforementioned project of mine](https://github.com/outerelocarlos/Better-Firefox) which improves the security, privacy and user experience of the browser.  
Firefox ESR is a bit more stable, but its WinGet install does not properly detect the system language (and the usual version of the software is stable enough).
* **ONLYOFFICE**: a free and open-source Microsoft Office replacement which looks almost identical to it. I chose this office suite due to its good compatibility with Microsoft's proprietary formats.

### Recommended

This preset builds upon the [Basic preset](#basic) with software that is:

* Easy-to-learn and easy-to-use.
* Unintrusive.
* Extremely useful.

The additional programs are the following:

* **Wget**: a command-line utility for retrieving files using HTTP, HTTPS and FTP protocols.
* **adwcleaner**: a standalone tool that removes adware, spyware, PUPs, browser hijackers, and unwanted browser toolbars. Only the presets which make use of the Chocolatey package manager may install this software.
* **Notepad++**: the most popular alternative to the built-in Notepad application.
* **ShareX**: a really powerful yet simple tool to take screenshots and record your screen.
* **Everything**: a really powerful tool that finds everything the Windows Search can not.

### Advanced

This preset builds upon the [Recommended preset](#recommended) with a few utilities aimed towards power users, namely:

* **sed**: a command-line utility to manipulate and transform text/strings. Since it is used by the [`Preset_Generator.ps1`](#Preset_Generator.ps1) and advanced users might want ot make use of that, it is included in this preset.
* **HWiNFO**: the most complete hardware analysis and monitoring tool, also useful to see and share the system' specs.
* **qBittorrent**: the most popular torrent manager.
* **PowerToys**: a really powerful toolset that would require an entire post to detail (research it on your own, but you would doing yourself a favor by using it).

<br>

## General Documentation

### Script Setup

All the provided presets begin with a set of functions that allow its associated script to behave as intended, namely:

* **RequireAdmin**: if the script is run without elevated privileges, this function relaunches it as an administrator.
* **CreateRestorePoint**: creates a restore point (if possible) so that the user can revert the system changes made by the script.
* **InstallWinget**: installs the Windows Package Manager on the system so that WinGet packages can be installed.
* **InstallChocolatey**: installs the Chocolatey Package Manager on the system so that Chocolatey packages can be installed.

A few additional functions have been developed to complement the script setup. These are not essential, although some of them are highly recommended:

* **WingetSourceUpdate**: updates the WinGet sources if needed. Highly recommended and enabled by default in all the presets which make use of the Windows Package Manager.
* **WingetAutoUpdate**: creates a scheduled task to update WinGet packages at system startup. However, updating certain applications installs their most recent version without removing/overwriting the one that is already installed in the system, keeping both installed. As such, this function is **not recommended in the slightest**.  
If, by chance, you have made use of this function and are having issues with its behavior, merely delete its associated scheduled task (type "Task Scheduler" in Windows Search, find the one named "WinGet Automatic Update" and delete it).
* **WingetLogCleanup**: creates a scheduled task to clean WinGet logs older than a week. It is not detrimental but also not really needed.
* **ChocolateyAutoUpdate**: creates a scheduled task so that Chocolatey packages update at system startup. Recommended and enabled by default in all the presets which make use of the Chocolatey package manager.

### Install Arguments

Just like Chocolatey uses `choco` as its command-line interface (CLI), the Windows Package Manager uses the `winget` command line tool to install and manage applications. In both cases the `install` command is the one to use for the matter, although the arguments used to fine-tune the installation depend on the package manager in use.

On one hand, all the Chocolatey installs used throughout this project use the `-y` argument to avoid users being prompted with whether or not they want their software installed, automatically confirming said prompt. On the other, this project uses quite a few more WinGet arguments to properly target the package being installed and to avoid user prompts. These arguments are the following:

* `-e` ensures that the match between the input ID and that of the package is 100% identical.
* `--id <dev.example>` finds and/or installs the software with ID `<dev.example>`
* `--accept-package-agreements` is used to accept the license agreement, and avoid the prompt.
* `--accept-source-agreements` is used to accept the source license agreement, and avoid the prompt.

More information about the `winget install` arguments can be found in [its documentation page](https://docs.microsoft.com/en-us/windows/package-manager/winget/install).

### Preset_Generator.ps1

I have developed `.ps1` file to automatically create/update all of the presets that make up this project. This file (technically speaking, the script within it) goes through this very own documentation (the `README.md` file) and acts as a translator of sorts, understanding which parts of it are unneeded and which ones refer to the installation commands (these are found within the [Software Documentation](#software-documentation) section).  
It does so through the use of [regular expressions](https://en.wikipedia.org/wiki/Regular_expression), and it heavily simplifies the process of updating all of the existing presets at once when new software is to be added (it also makes it easier to add new presets to the project).

### Software Tweaks

This folder contains several tweaks to modify the default behavior and/or experience of selected software. As of now, it only features a collection of settings and add-ons to improve the security, privacy and experience of Gecko/Goanna web browsers and their users (based on [another project of mine](https://github.com/outerelocarlos/Better-Firefox)). To do so, 3 functions/tweaks have been created to target different user profiles:

* **Better Firefox - Standard**: has been developed with the average user in mind and therefore security and usability are prioritized over privacy (e.g. both Widevine and Google safebrowsing are enabled by default).

* **Better Firefox - Advanced**: has been developed with power users in mind, prioritizing usability over privacy (meaning that features like Widevine are enabled by default) but disabling unessential features that track user activity (e.g. Google safebrowsing, malware scan, search suggestions...) since power users do not really need them.

* **Better Firefox - Hardcore**: has been developed with the most privacy-concerned users in mind. Beware that the additional privacy layers could lead to usability issues (e.g. WebGL and Widevine based sites might not work to avoid any sort of fingerprinting).

Note that [Git](https://git-scm.com/) needs to be installed for these functions/tweaks to work.

<br>

## Software Documentation

All the software I have evaluated for this project is detailed in the following paragraphs, with WinGet and Chocolatey commands provided if possible. Some of the packages might have been discontinued and I would like to highlight that where possible, but as of now such task is out of scope (it's been done here and there, but not consistently).

### Runtimes

Runtimes are underlying layers that certain software require in order to work as intended. I highly recommend users to manually install these runtimes using the provided hyperlinks instead of using the WinGet and/or Chocolatey package managers (although most programs bundle any required runtimes within their own installer).

* **[Java Runtime Environment](https://java.com/)**: Java is a programming language and computing platform upon which many services and applications are built (which need Java installed to function as intended).

  * winget install -e --id Oracle.JavaRuntimeEnvironment 
  * choco install javaruntime -y 

* **[Microsoft Visual C++ Redistributables](https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/)**: The Visual C++ Redistributables install Microsoft C and C++ (MSVC) runtime libraries, which are required by many applications built using Microsoft C and C++ tools. There are multiple versions/redistributables, named after their release year, and all of them should be installed since different programs need different redistributables.  
The provided hyperlink allows users to batch install the different versions of the runtime, and so does the provided Chocolatey package. WinGet does not have such a bundle, but running all the winget commands presented down below achieves the same result.

  * winget install -e --id Microsoft.VC++2005Redist-x86 
  * winget install -e --id Microsoft.VC++2005Redist-x64 
  * winget install -e --id Microsoft.VC++2008Redist-x86 
  * winget install -e --id Microsoft.VC++2008Redist-x64 
  * winget install -e --id Microsoft.VC++2010Redist-x86 
  * winget install -e --id Microsoft.VC++2010Redist-x64 
  * winget install -e --id Microsoft.VC++2012Redist-x86 
  * winget install -e --id Microsoft.VC++2012Redist-x64 
  * winget install -e --id Microsoft.VC++2013Redist-x86 
  * winget install -e --id Microsoft.VC++2013Redist-x64 
  * winget install -e --id Microsoft.VC++2015-2022Redist-x86 
  * winget install -e --id Microsoft.VC++2015-2022Redist-x64 
  * choco install vcredist-all -y 

* **[DirectX](https://www.microsoft.com/download/details.aspx?id=35)**: Set of components for the Windows ecosystem that allow certain software, primarily and especially games, to work directly with the system's video and audio hardware.

  * ~~No WinGet package as of now~~ 
  * choco install directx -y 

### Additional File Extension Support

For some unknown reason, some file extensions are not supported natively in Windows. These add-ons aim to fix that.

* **[Raw Image Extension](https://www.microsoft.com/en-us/p/raw-image-extension/9NCTDW2W1BH8)**: A camera raw image file contains minimally processed data from a camera's image sensor, hence its name. There are dozens of raw formats in use by different manufacturers of digital image capture equipment, and this plugin aims to add native viewing support for most of them.

  * winget install -e --id 9NCTDW2W1BH8 --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[HEIF Image Extensions](https://www.microsoft.com/en-us/p/heif-image-extensions/9PMMSR1CGPWG)**: Extends Windows to decode HEIF contained image content.

  * winget install -e --id 9PMMSR1CGPWG --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[HEVC Video Extensions](https://www.microsoft.com/en-US/p/hevc-video-extensions/9NMZlZ57R3T7)**: Extends Windows to play and produce HEVC-encoded image (.heic files, for example) and video content.

  * winget install -e --id 9NMZlZ57R3T7 --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[AV1 Video Extensions](https://www.microsoft.com/en-us/p/av1-video-extension/9MVZQVXJBQ9V)**: Extends Windows to play AV1-encoded video content (avant-garde video coding standard developed by the Alliance for Open Media).

  * winget install -e --id 9MVZQVXJBQ9V --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[MPEG-2 Video Extensions](https://www.microsoft.com/en-us/p/mpeg-2-video-extension/9N95Q1ZZPMH4)**: Extends Windows 10 to play MPEG-1 and MPEG-2 video content. Solves some issues with .mp4, .mkv, .mpeg, .mpg, .ts, .m2ts, .mkv, and .avi file formats.

  * winget install -e --id 9N95Q1ZZPMH4 --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

### Command Line Utilities

* **[Git](https://git-scm.com/)**: A free and open-source (FOSS) control system designed to manage and handle IT projects. It's the underlying layer behind GitHub, and is in fact used by most presets in order to apply [my Better Firefox project](https://github.com/outerelocarlos/Better-Firefox) improving the security, privacy and user experience of the browser and its users.

  * winget install -e --id Git.Git 
  * choco install git -y 

* **[GitHub CLI](https://cli.github.com/)**: The official GitHub command-line interface.

  * winget install -e --id GitHub.cli 
  * choco install gh -y 

* **[Wget](https://www.gnu.org/software/wget/)**: A command-line utility for retrieving files using HTTP, HTTPS and FTP protocols.

  * winget install -e --id GnuWin32.Wget 
  * choco install wget -y 

* **[sed](http://gnuwin32.sourceforge.net/packages/sed.htm)**: A command-line utility typically used for extracting part of a file using pattern matching or substituting multiple occurrences of a string within a file.

  * ~~No WinGet package as of now~~ 
  * choco install sed -y 

* **[Windows Terminal](https://github.com/Microsoft/Terminal)**: A free, open-source and highly customizable multi-tabbed terminal developed by Microsoft with out-of-the-box support for Command Prompt, PowerShell, WSL, SSH, and Azure Cloud Shell Connector.  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id Microsoft.WindowsTerminal 
  * winget install -e --id 9N0DX20HK701 --accept-package-agreements 
  * choco install microsoft-windows-terminal -y 

* **[Windows Terminal Preview](https://github.com/Microsoft/Terminal)**: The Windows Terminal Preview allows users to preview upcoming changes and features before they are rolled-out to the stable version of the software.  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id Microsoft.WindowsTerminal.Preview 
  * winget install -e --id 9N8G5RFZ9XK3 --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[Android Debug Bridge (adb)](https://developer.android.com/studio/command-line/adb)**: A versatile command-line tool to communicate with Android-based devices.

  * No winget package as of now, but can be installed alongside Android Studio (see [Development](#development)) 
  * choco install adb -y 

* **[FFmpeg](https://ffmpeg.org/)**: A cross-platform command-line solution to record, convert and stream audio and video.

  * ~~No WinGet package as of now~~ 
  * choco install ffmpeg-full -y 

* **[Nircmd](https://launcher.nirsoft.net/)**: A command-line utility developed by Nirsoft which allows users to perform (and automate) some basic tasks without the need for an interface. I use it to change my screen's resolution with .bat files, but [its documentation](https://www.nirsoft.net/utils/nircmd.html) showcase many other possibilities.

  * ~~No WinGet package as of now~~ 
  * choco install nircmd -y 

### System Monitoring and Control

* **[CPU-Z (Classic Version)](https://www.cpuid.com/softwares/cpu-z.html)**: CPU (and memory) information software which also includes a very simple CPU benchmark.

  * winget install -e --id CPUID.CPU-Z 
  * choco install cpu-z -y 

* **[CPU-Z (Custom Versions)](https://www.cpuid.com/softwares/cpu-z.html)**: CPU-Z is available in a variety of flavors/themes/skins so that users can pick their poison.

  * winget install -e --id CPUID.CPU-Z.TAICHI 
  * winget install -e --id CPUID.CPU-Z.ROG 
  * winget install -e --id CPUID.CPU-Z.PHANTOM 
  * winget install -e --id CPUID.CPU-Z.MSI 
  * winget install -e --id CPUID.CPU-Z.GBT 
  * winget install -e --id CPUID.CPU-Z.CM 
  * winget install -e --id CPUID.CPU-Z.ASR 
  * winget install -e --id CPUID.CPU-Z.AORUS 
  * ~~No Chocolatey packages as of now~~ 

* **[GPU-Z](https://www.cpuid.com/softwares/cpu-z.html)**: GPU information software (details its architecture, memory, node, etcetera).

  * winget install -e --id TechPowerUp.GPU-Z 
  * choco install gpu-z -y 

* **[PCI-Z](https://www.pci-z.com/)**: A system utility to show PCI information.

  * ~~No WinGet package as of now~~ 
  * choco install pci-z -y 

* **[HWiNFO](https://www.hwinfo.com/)**: The most complete and detailed hardware analysis and monitoring tool.

  * winget install -e --id REALiX.HWiNFO 
  * choco install hwinfo -y 

* **[HWiNFO Portable](https://www.hwinfo.com/)**: HWiNFO but portable.

  * ~~No WinGet package as of now~~ 
  * choco install hwinfo.portable -y 

* **[HWMonitor](https://www.cpuid.com/softwares/hwmonitor.html)**: An alternative hardware monitoring software. There have been issues with its readings in the past with (at the time) new hardware architectures like Zen 2, and therefore I recommend HWiNFO instead.

  * winget install -e --id CPUID.HWMonitor 
  * choco install hwmonitor -y 

* **[AMD Ryzen Master](https://www.amd.com/technologies/ryzen-master)**: AMD developed this software to automatically or manually overclock (or undervolt) Ryzen CPUs as well to give the user a view of important system parameters like the CPU temperature, speed and voltages.

  * winget install -e --id AMD.RyzenMaster 
  * ~~No Chocolatey package as of now~~ 

* **[MSI Afterburner](https://www.msi.com/Landing/afterburner/graphics-cards)**: The most popular GPU control center.

  * ~~No WinGet package as of now~~ 
  * choco install msiafterburner -y 

* **[EVGA Precision X1](https://www.evga.com/precisionx1/)**: An alternative GPU control center.

  * winget install -e --id EVGACorporation.EVGAPrecisionX1 
  * choco install evga-precision-x1 -y 

* **[OCCT](https://www.ocbase.com/)**: A well-rounded software to monitor and test most system components.

  * ~~No WinGet package as of now~~ 
  * choco install occt -y 

* **[Cinebench](https://www.maxon.net/en/cinebench)**: Arguably the most popular CPU benchmarking tool.

  * winget install -e --id 9PGZKJC81Q7J --accept-package-agreements 
  * choco install cinebench -y 

* **[Prime95](https://www.mersenne.org/download/)**: A hardcore stress test for the CPU.

  * ~~No WinGet package as of now~~ 
  * choco install prime95 -y 

* **[Prime95 Portable](https://www.mersenne.org/download/)**: Prime95 but portable.

  * ~~No WinGet package as of now~~ 
  * choco install prime95.portable -y 

* **[AIDA64](https://www.aida64.com/)**: It is not free, but it is still a reliable system diagnostics utility and CPU stress test. There are many flavors with slight differences between them.

  * winget install -e --id FinalWire.AIDA64.Extreme 
  * winget install -e --id FinalWire.AIDA64.Engineer 
  * choco install aida64-extreme -y 
  * choco install aida64-engineer -y 

* **[Furmark](https://www.geeks3d.com/furmark/)**: The GPU benchmarking tool and stress test that I have personally used the most (mainly due to its simple render that makes it easy to spot any visual artifacts).

  * ~~No WinGet package as of now~~ 
  * choco install furmark -y 

* **[MSI Kombustor](https://www.geeks3d.com/furmark/kombustor/)**: A GPU benchmarking tool and stress test by the makers of Furmark.

  * winget install -e --id Geeks3D.MSIKombustor 
  * ~~No Chocolatey package as of now~~ 

* **[Unigine Heaven](https://benchmark.unigine.com/heaven)**: Another GPU benchmarking tool and stress test by Unigine.

  * winget install -e --id Unigine.HeavenBenchmark 
  * choco install heaven-benchmark -y 

* **[Unigine Valley](https://benchmark.unigine.com/valley)**: Another GPU benchmarking tool and stress test by Unigine.

  * winget install -e --id Unigine.ValleyBenchmark 
  * choco install heaven-benchmark -y 

* **[Unigine Superposition](https://benchmark.unigine.com/superposition)**: Another GPU benchmarking tool and stress test by Unigine.

  * winget install -e --id Unigine.SuperpositionBenchmark 
  * choco install superposition-benchmark -y 

* **[Geekbench 5](https://www.geekbench.com/)**: Another popular CPU/GPU benchmarking tool.

  * winget install -e --id PrimateLabs.Geekbench.5 
  * ~~No Chocolatey package as of now~~ 

* **[Geekbench 4](https://www.geekbench.com/geekbench4/)**: Another popular CPU/GPU benchmarking tool.

  * winget install -e --id PrimateLabs.Geekbench.4 
  * ~~No Chocolatey package as of now~~ 

### System Security, Recovery and Clean-up

* **[Malwarebytes](https://www.malwarebytes.com/)**: Windows Defender does its job well enough but, if you want to double-dip on security, I'd go with this free and reliable anti-virus.

  * winget install -e --id Malwarebytes.Malwarebytes 
  * choco install malwarebytes -y 

* **[AdwCleaner](https://www.malwarebytes.com/adwcleaner)**: Malwarebytes' AdwCleaner is a standalone tool that removes adware, spyware, PUPs, browser hijackers, and unwanted browser toolbars. Just run a scan and let it clean your PC of unneeded stuff.

  * ~~No WinGet package as of now~~ 
  * choco install adwcleaner -y 

* **[Windows Firewall Control](https://www.binisoft.org/wfc.php)**: Another free tool by the Malwarebytes team which runs in the system tray and allows the user to easily control and manage the Windows firewall.

  * winget install -e --id BiniSoft.WindowsFirewallControl 
  * choco install windowsfirewallcontrol -y 

* **[Windows Spy Blocker](https://crazymax.dev/WindowsSpyBlocker/)**: A free and [open-source](https://github.com/crazy-max/WindowsSpyBlocker/) tool to block spying and tracking on Windows systems.  
The approach of this project is to capture and interpret network traffic based on a set of tools. Depending on the interactions between services and source or destination of traffic, rules are created and sorted by assignment.

  * ~~No WinGet package as of now~~ 
  * choco install windowsspyblocker -y 

* **[Bulk Crap Uninstaller](https://www.bcuninstaller.com/)**: A free and [open-source](https://github.com/Klocman/Bulk-Crap-Uninstaller) program uninstaller, which allows users to uninstall multiple programs at once as well as removing any residuals those programs might have left behind.

  * winget install -e --id Klocman.BulkCrapUninstaller 
  * choco install bulk-crap-uninstaller -y 

* **[Display Driver Uninstaller (DDU)](https://www.wagnardsoft.com/)**: The one tool to properly uninstall GPU drivers.

  * ~~No WinGet package as of now~~ 
  * choco install ddu -y 

* **[BleachBit](https://www.bleachbit.org/)**: A free and open-source system cleaner for obsolete files, cache, registry tweaks, programs' history...

  * winget install -e --id BleachBit.BleachBit 
  * choco install bleachbit -y 

* **[BleachBit Portable](https://www.bleachbit.org/)**: BleachBit but portable.

  * ~~No WinGet package as of now~~ 
  * choco install bleachbit.portable -y 

* **[CCleaner](https://www.ccleaner.com/)**: The most popular system cleaner, although there have been privacy concerns regarding the software so I'd stick with BleachBit. If using CCleaner, there's a plugin named [CCEnhancer](https://singularlabs.com/software/ccenhancer/) that expands the software capabilities.

  * winget install -e --id Piriform.CCleaner 
  * winget install -e --id SingularLabs.CCEnhancer 
  * choco install ccleaner -y 
  * choco install ccenhancer -y 

* **[CCleaner Portable](https://www.ccleaner.com/ccleaner/builds)**: CCleaner but portable.
  
  * ~~No WinGet package for neither CCleaner nor for CCEnhancer (portable)~~ 
  * choco install ccleaner.portable -y 
  * choco install ccenhancer.portable -y 

* **[Recuva](https://www.ccleaner.com/recuva)**: A file recovery software. Although I don't like Piriform (which are also the developers of CCleaner) and would rather have an open-source alternative, I have to admit that no other software scans for deleted files as well as Recuva does.

  * winget install -e --id Piriform.Recuva 
  * choco install recuva -y 

### Server Software

* **[OpenVPN](https://openvpn.net/)**: A full-featured open-source self-hosted VPN solution.

  * winget install -e --id OpenVPNTechnologies.OpenVPN 
  * choco install openvpn -y 

* **[Plex Media Server](https://www.plex.tv/)**: Plex is the most popular self-hosted media server service. Interface and functionality-wise competes with the subscription-based services, although its freemium nature (Plex Pass is required to access many relevant features) and close-sourced code are not up my alley. I still use it though.

  * winget install -e --id Plex.PlexMediaServer 
  * choco install plexmediaserver -y 

* **[Jellyfin Server](https://jellyfin.org/)**: The open-source media server and arguably the best alternative to Plex. It is a few steps behind Plex in many aspects but it is more than serviceable and probably the best option if  one is not paying for Plex Pass (without which many Plex options are disabled).

  * winget install -e --id Jellyfin.JellyfinServer 
  * choco install jellyfin -y 

* **[Hamachi](https://www.vpn.net/)**: LogMeIn Hamachi is a hosted VPN service that lets users securely extend LAN-like networks to distributed teams. Widely used to host game servers.

  * winget install -e --id LogMeIn.Hamachi 
  * choco install hamachi -y 

* **[TeamSpeak](https://teamspeak.com/)**: A VoIP service where users communicate via audio (exclusively) in user-hosted servers (theoretically better for privacy, although TeamSpeak itself is proprietary and its code is close-sourced). These self-hosted servers follow a similar structure as that of Discord, with each server being a collection of persistent voice chat channels.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### Web Browsers

Web browsers have been divided based on their underlying engine. Gecko/Goanna browsers are recommended to fight Google's monopoly since that would benefit nobody (the Chromium engine is developed and therefore somewhat controlled by them).

Some somewhat relevant links:
* [Wikipedia hosts an extensive list of web browsers classified by their underlying engine.](https://wikipedia.org/wiki/List_of_web_browsers)
* More importantly, [Wikipedia hosts a comparison table of many browsers](https://wikipedia.org/wiki/Comparison_of_web_browsers) clearly showcasing their most meaningful information (besides their feature-set).

#### Gecko-based Browsers

* **[Firefox](https://www.mozilla.org/firefox/new/)**: The most popular Gecko browser, Firefox is a free and open-source web browser developed by the Mozilla Corporation.

  * winget install -e --id Mozilla.Firefox 
  * choco install firefox -y 

* **[Firefox Extended Support Release](https://www.mozilla.org/firefox/enterprise/)**: The most stable edition of the Mozilla browser as new releases only come out every 10 versions of the main browser (with only security patches in between).

  * winget install -e --id Mozilla.Firefox.ESR 
  * ~~No Chocolatey package as of now~~  

* **[Firefox Beta](https://www.mozilla.org/firefox/beta)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the browser. They are generally low risk, so can be viable daily-drivers if the browser itself is up one's alley.

  * winget install -e --id Mozilla.Firefox.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Firefox Developer](https://www.mozilla.org/firefox/beta)**: The developer preview channel is where ideas get tested (and sometimes fail), so it's more up-to-date but also more unstable than both the stable and Beta branches. New features will be available in Firefox Developer 12 weeks before they are available in the regular version of Firefox.

  * winget install -e --id Mozilla.Firefox.DeveloperEdition 
  * ~~No Chocolatey package as of now~~ 

* **[Firefox Nightly](https://www.mozilla.org/firefox/beta)**: The most up-to-date but also the most unstable version of the browser; updated everyday.

  * winget install -e --id Mozilla.Firefox.Nightly 
  * ~~No Chocolatey package as of now~~ 

* **[Waterfox](https://www.waterfox.net/)**: A fork of Firefox ESR but removing trademarked artwork and proprietary components/telemetry. Waterfox offers a similar experience to Firefox but is natively supports Chrome and Opera plugins as well. The only downside is having security updates a bit later than Firefox (due to the browser being based upon its code). A really good choice and my favorite pick for Gecko-based browsers.

  * winget install -e --id Waterfox.Waterfox 
  * choco install waterfox -y 

* **[Waterfox Classic](https://cdn.waterfox.net/releases/)**: Based upon a prior version of Waterfox with support for legacy add-ons (like CookieShield, TabMix Plus or Session Manager) which Firefox does not support anymore (non-classic Waterfox does support legacy extensions but requires an update/modification from them which not all have done). It's less performant and only has partial support for webextensions, so even though it is solid enough I would rather use the current branch unless there's some add-on without which you cannot breathe.

  * winget install -e --id Waterfox.Waterfox.Classic 
  * choco install waterfox-classic -y 

* **[GNU Icecat](https://www.gnu.org/software/gnuzilla/)**: Another fork of Firefox ESR but removing trademarked artwork and proprietary components/telemetry. It is like Waterfox but with less features and not as up-to-date (it has a less active development).

  * ~~No WinGet package as of now~~ 
  * choco install icecat -y 

* **[LibreWolf](https://librewolf.net/)**: A fork of Firefox's stable branch with a focus on security and privacy. It being based upon the stable branch instead of the ESR means that it's slightly more up-to-date feature-wise than Waterfox and Icecat but at the cost of potential vulnerabilities or instabilities (should be pretty safe though). It's basically Firefox with better default settings and bundling a few security and privacy add-ons.

  * winget install -e --id LibreWolf.LibreWolf 
  * choco install librewolf -y 

* **[Tor Browser](https://www.torproject.org/download/)**: This browser consists of a modified Mozilla Firefox ESR web browser plus the TorButton, TorLauncher, NoScript, and HTTPS Everywhere extensions. The Tor Browser automatically starts Tor background processes and routes traffic through the Tor network. Upon termination of a session the browser deletes privacy-sensitive data such as HTTP cookies and the browsing history. The Tor proxy is a topic of its own but, oversimplifying, this browser makes your network traffic untraceable and is the most privacy-centric browser on this list.

  * winget install -e --id TorProject.TorBrowser 
  * choco install tor-browser -y 

* **[Tor Browser (alpha)](https://www.torproject.org/download/alpha/)**: The Tor Browser with the latest experimental features but less stable.

  * ~~No WinGet package as of now~~ 
  * choco install tor-browser-dev -y 

* **[SlimBrowser](https://www.slimbrowser.net/)**: The Gecko version of the Slimjet web browser, and likewise it is close-source and US-based, so I would avoid if possible (hopefully you can find an alternative within this extensive overview).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

#### Goanna-based browser

* **[Basilisk](https://www.basilisk-browser.org/)**: An open-source fork of Firefox that maintains support for XUL/XPCOM extensions. Its interface is based on Firefox 29-56, making of the browser the modernized counterpart to Palemoon.

  * winget install -e --id basilisk.basilisk 
  * choco install basilisk -y 

* **[Palemoon](https://www.palemoon.org/)**: An open-source fork of Firefox that maintains support for XUL/XPCOM extensions and retains the user interface of the Firefox 4-28 era.

  * winget install -e --id MoonchildProductions.PaleMoon 
  * choco install palemoon -y 

* **[K-Meleon](http://kmeleonbrowser.org/)**: An open-source browser based on the Goanna engine. I find it less attractive than Basilisk and Palemoon but it is a fine browser nonetheless.

  * winget install -e --id kmeleonbrowser.K-Meleon 
  * choco install k-meleon -y 

* **[K-Meleon Portable](http://kmeleonbrowser.org/)**: K-Meleon but portable.

  * ~~No WinGet package as of now~~ 
  * choco install k-meleon.portable -y 

### Improving Gecko/Goanna Browsers

The out-of-the-box experience of most browsers can be improved upon. [This repository of mine](https://github.com/outerelocarlos/Better-Firefox) does precisely so, tweaking settings and installing add-ons for the sake of the securiy, privacy and experience of the users. The improvement is compatible with most Gecko/Goanna web browsers and can be easily used alongside this project. To do so, 3 functions have been created to target different user profiles:

* **Better Firefox - Standard**: has been developed with the average user in mind and therefore security and usability are prioritized over privacy (e.g. both Widevine and Google safebrowsing are enabled by default).

  * BetterFirefox_Standard 

* **Better Firefox - Advanced**: has been developed with power users in mind, prioritizing usability over privacy (meaning that features like Widevine are enabled by default) but disabling unessential features that track user activity (e.g. Google safebrowsing, malware scan, search suggestions...) since power users do not really need them.

  * BetterFirefox_Advanced 

* **Better Firefox - Hardcore**: has been developed with the most privacy-concerned users in mind. Beware that the additional privacy layers could lead to usability issues (e.g. WebGL and Widevine based sites might not work to avoid any sort of fingerprinting).

  * BetterFirefox_Hardcore 

Note that [Git](https://git-scm.com/) needs to be installed for these functions to work. These functions can be used within each preset, but have also been provided as standalone scripts within the [Software Tweaks](./Software\ Tweaks) folder.

#### Blink/Chromium-based Browsers

* **[Microsoft Edge](https://www.microsoft.com/edge)**: Microsoft's latest browser is pretty much as good as Google Chrome, with Microsoft's telemetry instead of Google's. Since it cannot be uninstalled, here are some ideas for those users who would rather use another browser instead:

  * Set a given page (e.g. Netflix) as its go-to, transforming Edge into a container for said page (basically a web app). This is what I do at the moment, and it works even better than the streaming service's own app.

  * Use [MSEdgeRedirect](https://github.com/rcmaehl/MSEdgeRedirect) to redirect News, Search, Widgets, Weather and any other potential call to the Edge browser towards your default browser.

    * winget install -e --id rcmaehl.MSEdgeRedirect 
    * ~~No Chocolatey package as of now~~ 

* **[Microsoft Edge Beta](https://www.microsoftedgeinsider.com/download)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the browser. They are generally low risk, so can be viable daily-drivers if the browser itself is up one's alley. It is updated every six weeks, just like the standard Edge.

  * winget install -e --id Microsoft.Edge.Beta 
  * choco install microsoft-edge-insider -y 

* **[Microsoft Edge Dev](https://www.microsoftedgeinsider.com/download)**: The developer preview channel is where ideas get tested (and sometimes fail), so it's more up-to-date but also more unstable than both the stable and Beta branches; updated weekly.

  * winget install -e --id Microsoft.Edge.Dev 
  * choco install microsoft-edge-insider-dev -y 

* **[Microsoft Edge Cannary](https://www.microsoftedgeinsider.com/download)**: The most up-to-date but also the most unstable version of the browser; updated everyday.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Brave](https://brave.com/)**: My personal pick: feels like Chrome, but it is [open-sourced](https://github.com/brave/brave-browser), has a privacy-focused approach to web browsing (and has in fact exposed and fixed several security vulnerabilities within the Chromium source code) and its built-in ad-blocker works wonders and can be disabled on a per-site basis to earn BAT tokens (a crypto currency) which can be transferred to a crypto wallet or gifted within certain platforms (Reddit, Twitter...). A solid and well-rounded choice (I'm obviously biased but still).

  * winget install -e --id BraveSoftware.BraveBrowser 
  * choco install brave -y 

* **[Brave Beta](https://brave.com/download-beta/)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the browser. They are generally low risk, so can be viable daily-drivers if the browser itself is up one's alley.

  * winget install -e --id BraveSoftware.BraveBrowser.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Brave Nightly](https://brave.com/download-nightly/)**: The most up-to-date but also the most unstable version of the browser; updated everyday.

  * winget install -e --id BraveSoftware.BraveBrowser.Nightly 
  * ~~No Chocolatey package as of now~~ 

* **[Brave Portable](https://github.com/portapps/brave-portable)**: Brave but portable (note that this portable version is neither created nor maintained by the Brave team).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Vivaldi](https://vivaldi.com/)**: A browser by the former founder and CEO of Opera, from before the company went south. It feels great and unique, it's feature-rich and highly customizable and despite it not being completely open-source, its developers are pretty transparent about the reasons and highly communicative in its blog. Vivaldi would be my favorite Chromium-based browser if it wasn't for Brave.

  * winget install -e --id VivaldiTechnologies.Vivaldi 
  * choco install vivaldi -y 

* **[Vivaldi Snapshot](https://vivaldi.com/blog/desktop/snapshots/)**: Vivaldi's beta branch. Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the browser. They are generally low risk, so can be viable daily-drivers if the browser itself is up one's alley.

  * winget install -e --id VivaldiTechnologies.Vivaldi.Snapshot 
  * ~~No Chocolatey package as of now~~ 

* **[Google Chrome](https://www.google.com/chrome/)**: Google's own browser. It's full of Google's tracking (choose an alternative if you care about that) but it's nonetheless one of the most popular choices.

  * winget install -e --id Google.Chrome 
  * choco install googlechrome -y 

* **[Google Chrome Beta](https://www.google.com/chrome/beta/)**: Preview upcoming changes and features with low risk before they are rolled-out to the stable branch. Robust enough to be a viable daily-driver; updated weekly.

  * winget install -e --id Google.Chrome.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Google Chrome Dev](https://www.google.com/chrome/dev/)**: The developer preview channel is where ideas get tested (and sometimes fail), so it's more up-to-date but also more unstable than both the stable and Beta branches; updated weekly.

  * winget install -e --id Google.Chrome.Dev 
  * ~~choco install googlechrome.dev -y~~ 

* **[Google Chrome Canary](https://www.google.com/chrome/canary/)**: The most up-to-date but also the most unstable version of the browser; updated everyday.

  * winget install -e --id Google.Chrome.Canary 
  * ~~choco install googlechrome.canary -y~~ 

* **[Chromium](https://www.chromium.org/getting-involved/download-chromium)**: The compiled version of the Chromium engine source code. It can be seen as the open-sourced version of Chrome, which implies that tracking is less intrusive but it's also less polished and performant than its closed-sourced counterpart. It is a solid choice nonetheless.

  * ~~No WinGet package as of now~~ 
  * choco install chromium -y 

* **[Ungoogled Chromium](https://github.com/Eloston/ungoogled-chromium)**: An open-source privacy-focused Chrome alternative. It takes Chromium and aims to eliminate every bit of Google's tracking from within its code, which also means that the user can't sign in to Google (needs some tweaking to enable the option) so neither Google sync nor the Google Chrome Web Store work (extensions have to be manually installed, which sounds like a drag but it's actually quite simple).

  * winget install -e --id eloston.ungoogled-chromium 
  * choco install ungoogled-chromium -y 

* **[Iridium Browser](https://iridiumbrowser.de/)**: An open-source privacy-focused browser very much akin to Ungoogled Chromium since the user is unable to sync and sign in to Google (needs some tweaking to enable the option) due to the developers' standpoint in regards to data privacy, which also implies that extensions have to be manually installed instead of via the Google Chrome Web Store (as already stated, sounds like a drag but it's actually quite simple). Its development is less active than Ungoogled Chromium's so I'd stick with the former, but it's a solid choice nonetheless.

  * ~~No WinGet package as of now~~
  * choco install iridium-browser -y 

* **[Otter Browser](https://otter-browser.org/)**: An open-source browser aiming to recreate classic Opera (12.x) UI using Qt5.

  * winget install -e --id OtterBrowserTeam.OtterBrowser 
  * ~~choco install otter-browser -y~~ 

* **[Opera](https://www.opera.com/)**: A controversial one. Usability-wise it's fine, however there have been privacy issues in the past and fact is that a Chinese consortium owns a lot of the company. However, the company is still formally Norwegian and, because of this, still must obey Norway's privacy laws even if some of the profits are carted off to Asia. Remember: Norway, while not part of the EU, has adopted the EU's strict stance on privacy (they implemented the Data Protection Directive and Personal Data Act in their country). I personally don't like the company since it went public [for many reasons](https://www.androidpolice.com/2020/01/21/opera-predatory-loans/), so I would not recommend this browser and would choose Vivaldi instead (which is pretty similar and comes from Opera's former CEO).

  * winget install -e --id Opera.Opera 
  * choco install opera -y 

* **[Opera GX](https://www.opera.com/gx)**: An alternative version of the Opera browser built specifically to complement gaming. Cons are the same as with Opera, so pick this browser if you don't care about its background and like the look and gaming-related features of this version.

  * winget install -e --id Opera.OperaGX 
  * choco install opera-gx -y 

* **[Opera Neon](https://www.opera.com/computer/neon)**: An alternative version of the Opera browser with a modernized user experience. Cons are the same as with Opera, so pick this browser if you don't care about them and like how Opera Neon feels.

  * ~~No WinGet package as of now~~ 
  * choco install opera-neon -y 

* **[Opera beta](https://www.opera.com/computer/beta)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the browser. They are generally low risk, so can be viable daily-drivers if the browser itself is up one's alley.

  * winget install -e --id Opera.Opera.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Opera developer](https://www.opera.com/computer/beta)**: The developer preview channel is where ideas get tested (and sometimes fail), so it's more up-to-date but also more unstable than both the stable and Beta branches.

  * ~~No WinGet package as of now~~ 
  * choco install opera-developer -y 

* **[Cent Browser](https://www.centbrowser.com/)**: A highly customizable Chrome lookalike very light on resources. Experience-wise it's fine (it even bundles an useful set of features/plugins), but its developers are from China and the browser is close-sourced, so avoid if concerned about that.

  * winget install -e --id CentStudio.CentBrowser 
  * choco install centbrowser -y 

* **[Beaker](https://beakerbrowser.com/)**: An experimental peer-to-peer open-source web browser.

  * winget install -e --id PaulFrazee.BeakerBrowser 
  * choco install beaker -y 

* **[qutebrowser](https://qutebrowser.org/)**: An open-source keyboard-focused browser with a minimal GUI.
  
  * winget install -e --id qutebrowser.qutebrowser 
  * choco install qutebrowser -y 

* **[Vieb](https://github.com/Jelmerro/Vieb)**: An open-source Vim-inspired Electron web browser. A hardcore version of qutebrowser.

  * winget install -e --id Jelmerro.Vieb 
  * choco install vieb -y 

* **[Dooble](https://github.com/textbrowser/dooble/)**: A free and open-source web browser with a privacy-focused standpoint. It is multi-platform and exclusively portable within the Windows ecosystem. It's not widely known but highly regarded by those who do.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Falkon](https://www.falkon.org/)**: An open-source web browser developed by KDE, who are highly regarded due to the many applications developed primarily for the Linux ecosystem (a desktop manager among them). It aims to be a lightweight web browser available through all major platforms.

  * winget install -e --id KDE.Falkon 
  * ~~No Chocolatey package as of now~~ 

* **[Wexond](https://wexond.net/)**: An [open-source](https://github.com/wexond/browser-base) work in progress that is built on top of Electron to avoid using more Chromium components than those strictly required. Integrates a built-in ad-block and is both fast and highly customizable. Biggest downside is that it only has partial support for Chrome extensions via the Chrome Web Store ([here's the link to the issue](https://github.com/wexond/wexond/issues/110)).

  * winget install -e --id wexond.wexond 
  * ~~No Chocolatey package as of now~~ 

* **[Liri Browser](https://liri.io/apps/browser/)**: A lesser known open-source browser designed according to Google's Material Design. It's pretty much like Chromium but with a less active development and a fancy reskin.

  * winget install -e --id liri.liribrowser 
  * ~~No Chocolatey package as of now~~ 

* **[SRWare Iron](https://www.srware.net/iron/)**: A german Chrome lookalike with a self-claimed privacy-focused approach. Being based in the EU means EU regulations are at place (which are more protective of the user and its privacy than US ones), but honestly I wouldn't trust much the privacy claims of a proprietary software based on an open-sourced engine.

  * ~~No WinGet package as of now~~ 
  * choco install srwareiron -y 

* **[Slimjet](https://www.slimjet.com/)**: Another Chrome lookalike with a set of pre-installed proprietary extensions that I personally didn't like. Claims to not send data to Google, but I wouldn't trust the claims of a proprietary software based on an open-sourced engine. Unlike SRWare Iron, this time the developers (FlashPeak) are not even EU-based but rather from the Texas, US.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Epic Browser](https://www.epicbrowser.com/)**: Another closed-sourced self-claimed privacy-focused browser, although this time there's a twist: apparently they block everything from ads to fingerprints, with even the history being deleted after use. Its closed-sourced nature and their dubious website prevent me from trusting this browser (if one doesn't even want to keep one's history then go with Tor).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Ghost Browser](https://ghostbrowser.com/)**: A close-source Chromium-based browser with dedicated workspaces built-in with the browser. These are positioned within a left-side navigation pane which reminds me of Vivaldi and Opera, and there is likely a plugin for those browsers that allow users to do the same. I would avoid due to its close-source nature.

  * winget install -e --id GhostBrowser.GhostBrowser 
  * ~~No Chocolatey package as of now~~ 

* **[Yandex Browser](https://browser.yandex.com/)**: A Russian browser. Most relevant feature is DNSCrypt, which authenticates and encrypts DNS traffic between the user's computer and a selected server. I wouldn't trust it with my data though, [as russian internet companies are required by law to have an FSB black box in their network](https://www.theguardian.com/world/2015/sep/08/red-web-book-russia-internet).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[UC Browser](https://theucbrowser.com/)**: Best known for its mobile application from which it inherits the small size and, most importantly, the data compression technology: it uses proxy servers to compress web pages before sending them to users. This process requires less memory on the user's device and lowers data costs; however, it also poses privacy and security risks as all of the data accessed by the user first runs through a UCWeb server. UCWeb is a subsidiary of the Alibaba Group, one of China's giant multinationals. There has been evidence that it collected user data even when browsing with incognito mode, so I'd avoid it and would rather use an alternative whenever memory optimization is crucial (Cent Browser in a worst case scenario).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### VPNs

VPNs protect one's Internet traffic by masking one's internet protocol (IP) address so that one's online actions are virtually untraceable. However, know that VPN provides will have full access to said traffic, so beware to whom you share your data.

There is [a highly recommended reddit post](https://www.reddit.com/r/VPN/comments/m736zt/vpn_comparison_table/) which sees the discussion of which VPN providers are to be trusted. The author of said post has created [a comparison table](https://docs.google.com/spreadsheets/d/1ijfqfLrJWLUVBfJZ_YalVpstWsjw-JGzkvMd6u2jqEk/) which details and scores many of the most popular options, so I recommend going through it a few times before making a choice.

* **[OpenVPN](https://openvpn.net/)**: A full-featured open-source self-hosted VPN solution.

  * winget install -e --id OpenVPNTechnologies.OpenVPN 
  * choco install openvpn -y 

* **[OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-windows/)**: OpenVPN is a full-featured open-source self-hosted VPN solution. It needs to be installed in a system/server (of your own) to which you communicate via this OpenVPN Connect client.

  * winget install -e --id OpenVPNTechnologies.OpenVPNConnect 
  * choco install openvpn-connect -y 

* **[NordVPN](https://nordvpn.com/)**: One the most popular and recommended VPNs.

  * winget install -e --id NordVPN.NordVPN 
  * choco install nordvpn -y 

* **[Mullvad](https://mullvad.net/)**: Although it might not be as popular as some other VPN providers, it is a highly recommended one.

  * winget install -e --id MullvadVPN.MullvadVPN 
  * choco install mullvad-app -y 

### Cloud Storage

* **[OneDrive](https://www.microsoft.com/microsoft-365/onedrive/online-cloud-storage)**: Microsoft's own file hosting service. As of now, it comes preinstalled with Windows systems which is something I despise. Besides that, its likely the cloud service that best integrates with Windows (unsurprisingly given that both come from Microsoft). 

  * winget install -e --id Microsoft.OneDrive 
  * choco install onedrive -y 

* **[Google Drive](https://www.google.com/drive/download/)**: Google's most recent desktop client for its file hosting service. There's [a bit of history behind it](https://www.youtube.com/watch?v=n15B_E5LxOI), but all in all Google Drive's desktop client allows users to easily back up selected files and folders.

  * winget install -e --id Google.Drive 
  * choco install googledrive -y 

* **[MEGA](https://mega.nz/sync)**: MEGA desktop client, also known as MEGASync. Out of all the cloud services that are not self-hosted, MEGA is the one that offers the most storage for free (up to 50GB). It supports both file synchronization and file streaming.

  * winget install -e --id Mega.MEGASync 
  * choco install megasync -y 

* **[Dropbox](https://www.dropbox.com/desktop)**: Dropbox desktop client.

  * winget install -e --id Dropbox.Dropbox 
  * choco install dropbox -y 

* **[Nextcloud Desktop Client](https://nextcloud.com/clients/)**: Nextcloud is a self-hosted file hosting service. The host itself only runs in Linux, so the only available application for the Windows ecosystem (as of now) is this desktop client.

  * winget install -e --id Nextcloud.NextcloudDesktop 
  * choco install nextcloud-client -y 

* **[Syncthing](https://syncthing.net/)**: A free and open-source peer-to-peer multiplatform file synchronization application. It synchronizes files between two or more computers in real time, with data security and safety built into the design of the software.  
There is a free and open-source utility named **SyncTrayzor**, which hosts and wraps Syncthing so that it looks and behaves more like a native Windows application, for which there are both winget and Chocolatey packages.

  * winget install -e --id SyncTrayzor.SyncTrayzor 
  * choco install synctrayzor -y 

### Downloading Tools

* **[qbittorrent](https://www.qbittorrent.org/)**: The go-to software for torrent distribution.

  * winget install -e --id qBittorrent.qBittorrent 
  * choco install qbittorrent -y 

* **[JDownloader](https://jdownloader.org/jdownloader2)**: The most popular batch direct downloading tool.

  * winget install -e --id AppWork.JDownloader 
  * choco install jdownloader -y 

* **[Sonarr](https://sonarr.tv/)**: [Open-source](https://github.com/Sonarr/Sonarr) tool to automatically download TV shows based on a set of user-defined parameters. Beware that I do not endorse piracy in any way, and you should only download TV shows you legally own.

  * winget install -e --id TeamSonarr.Sonarr 
  * choco install sonarr -y 

* **[Lidarr](https://lidarr.audio/)**: [Open-source](https://github.com/lidarr/Lidarr) tool to automatically download music based on a set of user-defined parameters. Beware that I do not endorse piracy in any way, and you should only download music you legally own.

  * winget install -e --id TeamLidarr.Lidarr 
  * choco install lidarr -y 

* **[Radarr](https://radarr.video/)**: [Open-source fork](https://github.com/Radarr/Radarr) of Sonarr to automatically download movies based on a set of user-defined parameters. Beware that I do not endorse piracy in any way, and you should only download movies you legally own.

  * winget install -e --id TeamRadarr.Radarr 
  * choco install radarr -y 

* **[Spotiflyer](https://shabinder.github.io/SpotiFlyer/)**: An [open-source](https://github.com/Shabinder/SpotiFlyer/) tool to download music from the most popular music providers. Beware that I do not endorse piracy in any way, and you should only download music you legally own.

  * winget install -e --id Shabinder.SpotiFlyer 
  * ~~No Chocolatey package as of now~~ 

### Password Managers

* **[KeePass](https://keepass.info/)**: KeePass Password Safe (not to be confused with KeePassX or KeePassXC) is a free and open-source multiplatform password manager (although most platforms are but wrapped versions/ports of the Windows application, which is the developers' main focus). It stores all the passwords in an encrypted database (that you should back-up properly) which is locked with one master password or key file. It's the ideal choice for Windows-only scenarios, mainly due to its immense plugin library.

  * winget install -e --id DominikReichl.KeePass 
  * choco install keepass -y 

* **[KeePassXC](https://keepassxc.org/)**: KeePassXC is a free and [open-source fork](https://github.com/keepassxreboot/keepassxc) of the KeePass password manager. It stores all the passwords in an encrypted database (that you should back-up properly) which is locked with one master password or key file. Its multiplatform nature is more robust than that of Keepass' since it's built in C++ instead of .NET, so if that is crucial to you then you better go with KeePassXC instead of KeePass.

  * winget install -e --id KeePassXCTeam.KeePassXC 
  * choco install keepassxc -y 

* **[KeePassX](https://www.keepassx.org/)**: KeePassX started as a Linux port of KeePass, which was at that time an open-source but Windows-only password manager. Both are now cross platform and its core behavior is essentially the same, storing all the passwords in an encrypted database (that you should back-up properly) which is locked with one master password or key file. Its development has stalled, so I would stick with KeePass for Windows-only scenarios and KeePassXC otherwise.

  * ~~No WinGet package as of now~~ 
  * choco install keepassx -y 

* **[Bitwarden](https://bitwarden.com/)**: Another free and open-source password manager with a premium subscription option available. Despite locking some of its usefulness behind a paywall, the free and open-sourced version can be used across unlimited devices, and its user-friendly interface and multiplatform nature make it attractive for the average user (more advanced/demanding users would rather use KeePass or its forks since those do not hide features behind a paywall).  
One of Bitwarden's strenghts lies within the possibility of self-hosting the service so that a server system holds all the passwords, which are then accessed via different clients in other systems.

  * winget install -e --id Bitwarden.Bitwarden 
  * ~~No Chocolatey package as of now~~ 

* **[Synology C2 Password](https://c2.synology.com/password/overview)**: A recently released password manager by Synology (a company widely known for their NAS offerings with a great custom OS). It's free up to 10000 items, and there's a paid plan announced with more vaults and additional storage. [It looks quite solid](https://www.androidcentral.com/synology-c2-password-free-password-manager), so might a worthy choice.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[1Password](https://1password.com/)**: A highly regarded password manager. Does not offer a free tier though.

  * winget install -e --id AgileBits.1Password 
  * choco install 1password -y 

* **[Dashlane](https://www.dashlane.com/)**: Another highly regarded password manager. It does offer a free tier although it is quite limited (only one device and 50 passwords).

  * winget install -e --id Dashlane.Dashlane 
  * choco install dashlane -y 

* **[LastPass](https://www.lastpass.com/)**: Might be the most popular password manager despite all of its issues. Use an alternative if possible.

  * winget install -e --id LogMeIn.LastPass 
  * choco install lastpass -y 

### Email Clients

* **[Outlook](https://www.microsoft.com/en-ww/microsoft-365/outlook/email-and-calendar-software-microsoft-outlook)**: Microsoft's email client, neither free nor open-source. Utility-wise it's fine and might be worth it if you don't like the alternatives and were already planning to acquire a Microsoft Office license/subscription. Be aware that Microsoft will most likely have access to your mails.  
There is neither a Chocolatey nor a winget package for Outlook as of now, but it can be installed alongside Microsoft Office (see [Office Suites](#office-suites)).

* **[Thunderbird](https://www.thunderbird.net/)**: The most popular FOSS email client by Mozilla, developers of the Firefox web browser.

  * winget install -e --id Mozilla.Thunderbird 
  * choco install thunderbird -y 

* **[Thunderbird Beta](https://www.thunderbird.net/)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the software. They are generally low risk, so can be viable options if the software itself is up one's alley.

  * winget install -e --id Mozilla.Thunderbird.Beta 
  * choco install thunderbird -y 

* **[Birdtray](https://github.com/gyunaev/birdtray)**: Not an email client in itself but a plugin for Thunderbird which gives it a system tray new mail notification.

  * ~~No WinGet package as of now~~ 
  * choco install birdtray -y 

* **[Mailspring](https://getmailspring.com/)**: A multiplatform free and [open-source](https://github.com/Foundry376/Mailspring) email client with a subscription-based Pro tier (meaning that some of its features are locked behind a paywall) forked from Nylas Mail and maintained by one of its original authors. The FOSS version is solid enough for most users, and its modern look and overall functionality makes it an attractive option for those who find Thunderbird too daunting or too ugly.

  * winget install -e --id Foundry376.Mailspring 
  * choco install mailspring -y 

* **[eM Client](https://www.emclient.com/)**: A Windows and macOS email client for sending and receiving emails, managing calendars, tasks, contacts and notes (with live chat functionality on top of that). Biggest downside to me lies in its closed-sourced nature in a market with solid open-sourced alternatives.

  * winget install -e --id eMClient.eMClient 
  * choco install em-client -y 

### File Archivers

* **[7-Zip](https://www.7-zip.org/)**: The most popular file archive among both power and basic Windows users. It's simple and open-source, and to be honest is the one I like the most.

  * winget install -e --id 7zip.7zip 
  * choco install 7zip -y 

* **[7-Zip Portable](https://www.7-zip.org/)**: 7-Zip but portable.

  * ~~No WinGet package as of now~~ 
  * choco install 7zip.portable -y 

* **[7-Zip ZSTD](https://github.com/mcmilk/7-Zip-zstd/)**: A fork of 7-Zip with support of additional codecs (most users won't notice a difference and should use the standard version instead since its active development is almost guaranteed).

  * winget install -e --id mcmilk.7zip-zstd 
  * choco install 7zip-zstd -y 

* **[NanaZip](https://github.com/M2Team/NanaZip)**: A fork of 7-Zip with additional features: it supports the context menu in both Windows 10 and Windows 11, it supports the additional codecs from 7-Zip ZSTD, etcetera.

  * winget install -e --id M2Team.NanaZip 
  * ~~No Chocolatey package as of now~~ 

* **[PeaZip](https://peazip.github.io/)**: Another open-source alternative. PeaZip is just as good as 7-Zip but with a very different interface and bundling a bunch of additional features which one may or may not need/like. It is the defacto recommendation within the Linux ecosystem, but it is not used as much in Windows albeit it being a solid option.

  * winget install -e --id Giorgiotani.Peazip 
  * choco install peazip -y 

* **[PeaZip Portable](https://peazip.github.io/)**: PeaZip but portable.

  * ~~No WinGet package as of now~~ 
  * choco install peazip.portable -y 

* **[Bandizip](http://www.bandizip.com/)**: A freemium file archiver in a marked dominated by FOSS options. However, it's the only one I could find that allows users to map the double click to a smart folder extraction (which is ideal for very basic users who do not really understand what a compressed file is).

  * winget install -e --id Bandisoft.Bandizip 
  * choco install bandizip -y 

* **[WinRAR](https://www.rarlab.com/)**: A classic. Follows a trialware payment model (of 40 days), after which the user can still use the software but a message pops up from time to time (it gets annoying; I'd rather use 7-Zip, its forks or PeaZip since those are hassle-free and open-sourced, unlike WinRAR).

  * winget install -e --id RARLab.WinRAR 
  * choco install winrar -y 

* **[WinRAR Beta](https://www.rarlab.com/)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the software. They are generally low risk, so can be viable options if the software itself is up one's alley.

  * winget install -e --id RARLab.WinRAR.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[WinZIP](https://www.winzip.com/)**: It follows a trialware payment model (of 21 days) after which the service is to be paid for otherwise it will no longer work. I'd rather use 7-Zip, its forks or PeaZip than to pay for a closed-sourced software in a market dominated by the aforementioned FOSS options.

  * winget install -e --id Corel.WinZip 
  * ~~No Chocolatey package as of now~~ 

### Text Editors

* **[Notepad++](https://notepad-plus-plus.org/)**: An open-source Notepad replacement and code editor with support for several programming languages thanks to it being built upon Scientilla, the most popular FOSS source code editing component.

  * winget install -e --id Notepad++.Notepad++ 
  * choco install notepadplusplus -y 

* **[Notepad2](https://notepad2.com/)**: A streamlined and efficient open-source notepad software that improves upon the Windows default application with syntax highlighting and code auto-completion. Like Notepad++, it is built upon Scientilla. Its development has not been active since 2012, but I don't see that as much of a problem in text editing software.

  * ~~No WinGet package as of now~~ 
  * choco install notepad2 -y 

* **[Notepad2-mod](https://xhmikosr.github.io/notepad2-mod/)**: An [open-sourced](https://github.com/XhmikosR/notepad2-mod) fork of Notepad2 which improves upon said software with code folding, bookmarks, improved syntax highlighting and many other changes (which include a registry tweak that redirects Notepad calls to Notepad2-mod). Its development has not been active since 2017, but I don't see that as much of a problem in text editing software.

  * winget install -e --id Notepad2mod.Notepad2mod 
  * choco install notepad2-mod -y 

* **[Notepad 3](https://www.rizonesoft.com/downloads/notepad3/)**: Another Scintilla-based [open-source](https://github.com/rizonesoft/Notepad3) text editor based upon the code from Notepad2 and Notepad2-mod with extra features and tweaks. The only reasonable downside is the lack of a winget install.

  * ~~No WinGet package as of now~~ 
  * choco install notepad3 -y 

* **[Notepad2-zufuliu](https://github.com/zufuliu/notepad2)**: An [open-sourced](https://github.com/zufuliu/notepad2) fork of Notepad2-mod which improves upon said software with many new features and tweaks. It might be the most recent and complete development branch of Notepad2 and the only reasonable downside is the lack of winget and Chocolatey installs (as of time of writing). Its interface is more akin to Notepad2 (for better or for worse, it is up to personal taste) and its development is slightly more active than Notepad 3's, although it has not made as much of an impact.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Notepads](https://www.notepadsapp.com/)**: A recently released [open-source](https://github.com/JasonStein/Notepads/) text editor with a modernized minimalist design. Fast, lightweight and actively developed, this software is a great choice if you are into its approach and aesthetics.

  * winget install -e --id JackieLiu.NotepadsApp 
  * ~~No Chocolatey package as of now~~ 

* **[Mark Text](https://marktext.app/)**: A simple yet effective [open-source](https://github.com/marktext/marktext) and cross-platform Markdown editor.

  * winget install -e --id MarkText.MarkText 
  * choco install marktext -y 

* **[Mark Text Portable](https://marktext.app/)**: Mark Text but portable.

  * ~~No WinGet package as of now~~ 
  * choco install marktext.portable -y 

### Office Suites

Some somewhat relevant links:
* [This reddit thread](https://www.reddit.com/r/linux/comments/l7ju7s/libreoffice_vs_onlyoffice_vs_freeoffice_vs_wps/) sees a discussion of the most popular free office suites.
* [This reddit post](https://www.reddit.com/r/Technologynewswire/comments/i61w6a/best_free_writing_software_for_writers/) comments on some office suites from a writer's perspective.

I know most people use Microsoft Office. However, and despite the upcoming critizism on the software and its developers, OnlyOffice provides a quite similar experience and is surprisingly compatible with Microsoft proprietary formats.  
OnlyOffice aside, there are plenty free, open-source and robust office suite that users might be missing on.

* **[Microsoft Office](https://www.office.com/)**: The most popular office suite, downsides being that it is neither free nor open-source. Works fine and all, and there are some proprietary formats with which Microsoft Office is basically the only way to ensure format consistency. Installing it is a PIA, but thankfully [someone created an explendid tool to do so](https://github.com/YerongAI/Office-Tool/releases).  
  The winget package installes Office as is, whereas the Chocolatey package installs the aforementioned tool (from which is a bliss to install the Office suite).

  * winget install -e --id Microsoft.Office 
  * choco install office-tool -y 

* **[LibreOffice](https://www.libreoffice.org/)**: The open-source go-to when it comes to office suites. Biggest downside is that it doesn't work that well with some of Microsoft's proprietary formats, but otherwise it is a great multi-platform option.

  * winget install -e --id LibreOffice.LibreOffice 
  * choco install libreoffice -y 

* **[OpenOffice](http://www.openoffice.org/)**: Before LibreOffice became as popular as it is today, OpenOffice was the defacto open-source office suite. The project was discontinued for a while until Apache got their hands on it, and now it's once again actively developed. It is a good alternative to LibreOffice, it comes down to personal preference (and likewise, it doesn't work that well with some of Microsoft's proprietary formats).

  * winget install -e --id Apache.OpenOffice 
  * choco install openoffice -y 

* **[OnlyOffice](https://www.onlyoffice.com/)**: A free office suite by Ascensio System. There is a community edition which is open-source, but [Ascensio tried to remove certain features from it and that bugs me the hell out](https://www.reddit.com/r/selfhosted/comments/fpurk6/stop_recommending_onlyoffice/) (they basically hid those features behind a paywall). There are forks which restore said functionality but fork dependency is complicated (as in, who knows how long said fork is to be maintained). However, out of all the free office suites OnlyOffice proved to be the one that works the best with Microsoft's proprietary formats. What's more is that it is one of the few suites that works within Nextcloud (the alternative, Collabora, runs on the server and streams back to the client whereas OnlyOffice runs on the client's browser and therefore runs smoother and is less dependent on the server).  
Despite my issues, **it is the most solid choice for basic users** due to its interface (which mirrors Microsoft Office) and its overall good compatibility with Microsoft's proprietary formats.

  * winget install -e --id ONLYOFFICE.DesktopEditors 
  * choco install onlyoffice -y 

* **[Google Office](https://docs.google.com/)**: Google has developed its own office suite which, despite not being open-sourced, it's actually a decent option which allows users to easily collaborate between one another. There is not a native Windows application or client, although [there was an open-source project](https://github.com/alexkim205/G-Desktop-Suite) that aimed to wrap the web application so that it behaved more like a desktop-oriented experience (perhaps I'll look into doing it myself in the future).

* **[FreeOffice](https://www.freeoffice.com/)**: An office suite by SoftMaker, a German company. Although the software is free to use, it is not open-source and some of its features are hidden behind a paywall, so I'd pick an alternative unless you really like its UI/UX. Overall [it works fine](https://itsfoss.com/softmaker-office-2021/), but I rather use an open-sourced alternative.

  * ~~No WinGet package as of now~~ 
  * choco install freeoffice -y 

* **[WPS Office](https://www.wps.com/)**: A long-running office suite that works fine but, although it is free to use, it is both closed-sourced and Chinese-backed so should be viewed skeptically. There's a Premium versions meaning that some features are hidden behind a paywall. I rather use an open-sourced alternative.

  * winget install -e --id Kingsoft.WPSOffice 
  * choco install wps-office-free -y 

* **[Calligra](https://calligra.org/)**: A free and open-source office suite by KDE, which obviously implies that Linux comes development comes first. Within Linux-based system the software works just fine, but Windows is not a priority and it shows. As of time of writing  I would not recommend Windows users to use Calligra, there are many better alternatives.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### PDF Readers/Editors

* **[Adobe Acrobat Reader DC](https://get.adobe.com/reader/)**: The staple in PDF readers and the go-to if you want something simple that just works (Adobe developed the format after all). Adobe's kind of monopolistic so if that's a concern for you, look for alternatives down below.  
The software is available for both 32-bit and 64-bit systems. To be honest there is not much of a difference in performance between both versions, and that is why I use the 32-bit version in the provided presets. There also exists a Microsoft Store version of the software, although it is quite recent and as of time of writing it lacks multi-language support (only English is available).

  * winget install -e --id Adobe.Acrobat.Reader.32-bit 
  * winget install -e --id Adobe.Acrobat.Reader.64-bit 
  * winget install -e --id XPDP273C0XHQH2 --accept-package-agreements 
  * choco install adobereader -y 

* **[PDF-XChange Editor](https://pdf-xchange.eu/pdf-xchange-editor/index.htm)**: It looks solid as a PDF reader (with an Office-like interface) but it also doubles down as a free PDF editor. My sample PDF was modified with no problems (I edited the presented text and added a few images on top of that) but when editing a PDF of my father's a watermark appeared (perhaps it has something to do with the PDF size). A suboptimal solution involves exporting the PDF as an image, which loses resolution but avoids watermarking.  
  
  * winget install -e --id TrackerSoftware.PDF-XChangeEditor 
  * choco install pdfxchangeeditor -y 

* **[Foxit Reader](https://www.foxit.com/pdf-reader/)**: Its interface looks a bit more polished than PDF-XChange Editor, both of which mirror Microsoft Office in its design. However, feature-wise it lacks when compared to PDF-XChange Editor and, what's more, it is Chinese-backed so should be viewed skeptically. I wouldn't recommend it.
  
  * winget install -e --id Foxit.FoxitReader 
  * choco install foxitreader -y 

* **[Sumatra PDF](https://www.sumatrapdfreader.org/free-pdf-reader)**: A free and open-source reader which not only works with PDF but also with ebook files (ePub, MOBI...) and comic ones (CBZ, CBR...). It's as simple as it gets, but that's also its point.

  * winget install -e --id SumatraPDF.SumatraPDF 
  * choco install sumatrapdf -y 

* **[Sumatra PDF Portable](https://www.sumatrapdfreader.org/free-pdf-reader)**: Sumatra PDF but portable.

  * ~~No WinGet package as of now~~ 
  * choco install sumatrapdf.portable -y 

* **[PDF24 Creator](https://www.pdf24.org/)**: A multi-function software to manipulate PDFs in more ways than you may probably use or need. Only downside it that, although the software is free to use, it is not open-source.

  * winget install -e --id geeksoftwareGmbH.PDF24Creator 
  * choco install pdf24 -y 

* **[PDFsam Basic](https://pdfsam.org/)**: Open-source software to split, merge and rotate PDF files. It's basically a less complete but [open-sourced](https://github.com/torakiki/pdfsam) PDF24 alternative.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### Book/Comic Readers

* **[Sumatra PDF](https://www.sumatrapdfreader.org/free-pdf-reader)**: A free and open-source reader which not only works with PDF but also with ebook files (ePub, MOBI...) and comic ones (CBZ, CBR...). It's as simple as it gets, but that's also its point.

  * winget install -e --id SumatraPDF.SumatraPDF 
  * choco install sumatrapdf -y 

* **[Sumatra PDF Portable](https://www.sumatrapdfreader.org/free-pdf-reader)**: Sumatra PDF but portable.

  * ~~No WinGet package as of now~~ 
  * choco install sumatrapdf.portable -y 

* **[Calibre](https://calibre-ebook.com/)**: Calibre is not only a reader but a the one-stop solution to all your ebook needs. Its library and metadata agents work wonders and changing the format of an ebook is two clicks away. Its interface lacks a bit of a polish but all in all is a great program (and it's open-source).  
There is [a plugin for the software](https://github.com/apprenticeharper/DeDRM_tools/) to remove DRM from ebooks (although there is no winget package for it).

  * winget install -e --id calibre.calibre 
  * choco install calibre -y 
  * choco install calibre-dedrm -y 

* **[Calibre Portable](https://calibre-ebook.com/)**: Calibre but portable.

  * winget install -e --id calibre.calibre.portable 
  * ~~No Chocolatey package as of now~~ 

* **[YACReader](https://yacreader.com/)**: Although Sumatra works wonders with comic files (CBZ, CBR...) it lacks the metadata agents and library features that would make of it a perfect comic reader. YACReader is an open-source comic reader with said metadata, server functionality (although it lacks an Android client) and provides a solid reading experience overall.

  * winget install -e --id YACReader.YACReader 
  * choco install yacreader -y 

* **[MComix](https://sourceforge.net/p/mcomix/wiki/Home/)**: Although Sumatra works wonders with comic files (CBZ, CBR...) it lacks the metadata agents and library features that would make of it a perfect comic reader. MComix is another open-source comic reader which, despite not being as polished as YACReader, could be the preferred choice by some people due to its straightforward UI. However, its development has not been active since 2019 and there is neither a winget nor a Chocolatey package to manage its installation. I would go with YACReader instead.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[ComicRack](https://comicrack.softonic.com/)**: It was a popular comic reader for a time, now it is discontinued. I did not like its closed-sourced nature, its user interface nor the overall experience, so I would rather use any of the aforementioned alternatives.

  * ~~No WinGet package as of now~~ 
  * choco install comicrack -y 

### Image Viewers

* **[ImageGlass](https://imageglass.org/)**: A free and open-source image viewer and my personal pick for Windows 10 systems due to its modern interface and, most of all, due to how well it works with all the image formats that come to mind (even RAW files). I don't use it in Windows 11 due to the latest improvements to the Photos app, but I might come back to it in the future.

  * winget install -e --id DuongDieuPhap.ImageGlass 
  * choco install imageglass -y 

* **[IrfanView](https://www.irfanview.com/)**: Another free and open-source alternative to Microsoft's Photos app with multiple [plugins](https://www.irfanview.com/plugins.htm) to further expand the software capabilities. I use ImageGlass, but in the end it comes down to personal taste. Best thing about it (in my opinion) lies within its shell extension, which allows users to easily convert images from one format to another.  
Chocolatey has packages for Irfanview and both its plugins and the aforementioned shell extension (winget does not, it requires the user to manually tweak the software with these add-ons).

  * winget install -e --id IrfanSkiljan.IrfanView 
  * choco install irfanview -y 
  * choco install irfanview-shellextension -y 
  * choco install irfanviewplugins -y 

### Image Editors

* **[GIMP](https://www.gimp.org/)**: The FOSS go-to for image edition and a decent alternative to the industry's leader (Adobe Photoshop).

  * winget install -e --id GIMP.GIMP 
  * choco install gimp -y 

* **[GIMP Nightly](https://www.gimp.org/downloads/devel/)**: The most up-to-date but also the most unstable version of the software; updated everyday.

  * winget install -e --id GIMP.GIMP.Nightly 
  * ~~No Chocolatey package as of now~~ 

* **[PhotoGIMP](https://github.com/Diolinux/PhotoGIMP)**: An open-source patch to make GIMP's interface more like Photoshop's.

  * ~~No WinGet package as of now~~ 
  * choco install photogimp -y 

* **[Inkscape](https://inkscape.org/)**: Free and [open-source](https://gitlab.com/inkscape/inkscape/-/tree/master) vector graphics editor used to create vector images, primarily in Scalable Vector Graphics format.

  * winget install -e --id Inkscape.Inkscape 
  * ~~No Chocolatey package as of now~~ 

### Screenshots

* **[ShareX](https://getsharex.com/)**: My FOSS pick for screenshot taking. It has over 10 years of active development, it's highly customizable and has online functionalities that allow the software to upload the screenshot (or any other image/video/file on your computer) to a service of your choice so that it can be easily shared.

  * winget install -e --id ShareX.ShareX 
  * choco install sharex -y 

* **[Lightshot](https://app.prntscr.com/)**: An alternative software to do what ShareX already does (although each one has a few functions the other does not). [There have been privacy issues in the past](https://www.reddit.com/r/privacy/comments/9yzya4/lightshot_millions_of_screenshots_available_to/) and I rather have my screenshots under control, so my choice lies with ShareX (I also find it better usability-wise).

  * ~~No WinGet package as of now~~ 
  * choco install lightshot -y 

### Video Players

* **[VLC](https://www.videolan.org/vlc/)**: The go-to video player of most Windows users. Works with pretty much all formats and hardly ever gives a problem, it's FOSS and bundles its own set of drivers so it "just works".

  * winget install -e --id VideoLAN.VLC 
  * choco install vlc -y 

* **[MPC-HC](https://mpc-hc.org/)**: Some old PCs may struggle with VLC (have yet to see that though) or perhaps are not even supported by these up-to-date video players due to some specific requirement - Media Player Classic Home Cinema is a lightweight FOSS alternative for those potatoes. It's development has stopped, so if your PC does not have a problem with current video players I would suggest an alternative (several forks are detailed down below).

  * ~~No WinGet package as of now~~ 
  * choco install mpc-hc -y 

* **[MPC-HC fork by clsid2](https://github.com/clsid2/mpc-hc)**: This fork by clsid2 keeps this software's development active, polishing it and adding a few extras here and there. A great player overall.

  * winget install -e --id clsid2.mpc-hc 
  * choco install mpc-hc-clsid2 -y 

* **[MPC-BE](https://sourceforge.net/projects/mpcbe/)**: This fork moved away from MPC's aim to mimic the look and feel of Windows Media Player until it became a player of its own. It's actively developed and despite it feeling similar to MPC-HC, it has its own set of pros and cons.

  * winget install -e --id 9PD88QB3BGKN --accept-package-agreements 
  * choco install mpc-be -y 

* **[MPC-BE Nightly](https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/)**: The development version of MPC-BE: new features, experiences and changes at the cost of stability.

  * ~~No WinGet package as of now~~ 
  * choco install mpc-be-nightly -y 

* **[SMPlayer](https://www.smplayer.info/)**: Another FOSS video player which, like VLC, bundles a set of built-in codecs to avoid any playback issues.

  * winget install -e --id SMPlayer.SMPlayer 
  * choco install smplayer -y 

* **[KMPlayer](https://www.kmplayer.com/)**: Interface looks fine and it offers a GUI shortcut for 3D/VR video playback (which is nice). However, VR video playback is limited to SBS (side-by-side), which doesn't apply to all VR videos. Moreover, it is closed-sourced and lacks winget and Chocolatey installs, so to me it is the least attractive option of the bunch.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### Video Streaming

* **[Netflix](https://www.netflix.com/app)**: The most popular subscription service for both movies and TV shows. Its Windows application allows for 4K video playback, which cannot be achieved via web browsers.

  * winget install -e --id 9WZDNCRFJ3TJ --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[Amazon Prime Video](https://www.primevideo.com/splash/watchAnywhere/)**: Amazon Prime's video streaming platform for both movies and TV shows.

  * winget install -e --id 9P6RC76MSMMJ --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[HBO Max](https://www.microsoft.com/en-us/p/hbo-max/9PJJ1K9DZMRS)**: HBO's latest video streaming platform for both movies and TV shows.

  * winget install -e --id 9PJJ1K9DZMRS --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[Disney+](https://www.microsoft.com/en-us/p/disney/9NXQXXlFST89)**: Disney's video streaming platform for both movies and TV shows.

  * winget install -e --id 9NXQXXlFST89 --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[Plex](https://www.plex.tv/)**: If you and/or your friends have set up a Plex Media Server, the Plex application for Windows offers a robust experience as a desktop client with support for h265 video playback (no need to transcode, which is the case with web browsers). Biggest downsides are its freemium nature (Plex Pass is required to access many relevant features) and it's close-sourced code.

  * winget install -e --id Plex.Plex 
  * choco install plex -y 

* **[Jellyfin](https://jellyfin.org/)**: The recently released Jellyfin client for the Windows ecosystem works wonders when compared to its web wrapped counterpart, and it's the recommended way to consume any content hosted within a Jellyfin server.

  * winget install -e --id Jellyfin.JellyfinMediaPlayer 
  * ~~No Chocolatey package as of now~~ 

* **[Emby](https://emby.media/)**: Jellyfin but worse. It was open-sourced until it was not, and thus Jellyfin came into being (thus the ashtonishing resemblance between them both); I recommend Jellyfin on that fact alone (and since feature-wise are on par).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Kodi](https://kodi.tv/)**: Kodi is a free and open-source media player and entertainment hub for digital media (which goes beyond merely shows and movies). There are plugins for the platform that allows users to access community-driven media servers and their content. It is hard to master and its interface is not really up my alley, but its potential is undeniable.

  * winget install -e --id XBMCFoundation.Kodi 
  * choco install kodi -y 

* **[Popcorn Time](https://github.com/popcorn-official/popcorn-desktop)**: Free and [open-source](https://github.com/popcorn-official/popcorn-desktop) multiplatform software to stream movies and TV shows in a peer-to-peer manner.

  * winget install -e --id PopcornTime.Popcorn-Time 
  * choco install popcorntime -y 

* **[Popcorn Time Ru](https://popcorn-ru.tk/)**: [Open-source](https://github.com/popcorn-time-ru/popcorn-desktop) fork of [Popcorn Time](https://github.com/popcorn-official/popcorn-desktop) and for a time the most reliable version of the software. Now it does not work due to the Russia-Ukraine conflict (can be installed nonetheless).

  * winget install -e --id PopcornTime.Popcorn-Time-Ru 
  * ~~No Chocolatey package as of now~~ 

### Video Streaming Production

* **[OBS Studio](https://obsproject.com/)**: The defacto free and [open-source](https://github.com/obsproject/obs-studio) software for video recording and live streaming. It's more versatile and powerful than it looks - users can add numerous elements to a scene, edit them in many ways (size, position, color correction, color key...), can have multiple scenes, save them as scene collections... A great piece of software.

  * winget install -e --id OBSProject.OBSStudio 
  * choco install obs-studio -y 

* **OBS Studio Plugins**: OBS only gets better with its extensive plugin support.

  * **[OBS VirtualCam](https://github.com/Fenrirthviti/obs-virtual-cam)**: Allows users to turn the OBS feed into a virtual camera.
    * winget install -e --id Fenrirthviti.obs-virtual-cam 
    * choco install obs-virtualcam -y 
  * **[StreamFX](https://github.com/Xaymar/obs-streamfx)**: StreamFX is a plugin to libOBS (OBS Studio, StreamElements OBS Live) that adds new sources, filters and transitions.
    * ~~No WinGet package as of now~~ 
    * ~~No Chocolatey package as of now~~ 
  * **[Move Transitions](https://github.com/exeldro/obs-move-transition)**: Fancy premade transitions for OBS.
    * ~~No WinGet package as of now~~ 
    * choco install obs-move-transition -y 
  * **[obs-asio](https://github.com/Andersama/obs-asio)**: Allows the use of ASIO sound devices within OBS.
    * winget install -e --id Andersama.obs-asio 
    * ~~No Chocolatey package as of now~~ 

* **[OBS Studio Portable](https://obsproject.com/)**: OBS Studio but portable.

  * ~~No WinGet package as of now~~ 
  * choco install obs-studio.portable -y 

### Video Production

* **[Kdenlive](https://kdenlive.org/)**: Kdenlive is an acronym for KDE Non-Linear Video Editor. This software was primarily aimed towards the Linux ecosystem but now it is completely multiplatform and it is quite more than a valid option (might not be as polished as DaVinci Resolve but it's FOSS and doesn't lock features behind a paywall).

  * winget install -e --id KDE.Kdenlive 
  * hoco install kdenlive -y 

* **[DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve/)**: DaVinci Resolve is a multiplatform color correction and non-linear video editing application currently developed by Blackmagic Design. It's got a free version which is more than fine, but beware that some functionality is locked behind a paywall.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Shotcut](https://www.shotcut.org/)**: Another free and [open-source](https://github.com/mltframework/shotcut) video-editor. I prefer Kdenlive, but in the end it is up to taste.

  * winget install -e --id Meltytech.Shotcut 
  * choco install shotcut -y 

* **[Shotcut Portable](https://www.shotcut.org/)**: Shotcut but portable.

  * ~~No WinGet package as of now~~ 
  * choco install shotcut.portable -y 

* **[OpenShot](https://www.openshot.org/)**: Another free and [open-source](https://github.com/OpenShot/openshot-qt) video-editor. I prefer Kdenlive, but in the end it is up to taste.

  * winget install -e --id OpenShot.OpenShot 
  * choco install openshot -y 

* **[Avidemux](https://www.fosshub.com/Avidemux.html)**: Free and open-source tool to trim audiovisual files without transcoding them. Certain filters/edits can also be applied (although that transcodes the file), which I use to crop the black bars embedded in certain videos.

  * winget install -e --id Avidemux.Avidemux 
  * choco install avidemux -y 

* **[Handbrake](https://handbrake.fr/)**: A free and [open-source](https://github.com/HandBrake/HandBrake) utility to tweak and transcode video files.

  * winget install -e --id HandBrake.HandBrake 
  * choco install handbrake -y 

* **[Handbreak Portable](https://handbrake.fr/)**: Handbrake but portable.

  * ~~No WinGet package as of now~~ 
  * choco install handbrake.portable -y 

* **[FFmpeg Batch AV Converter](https://ffmpeg-batch.sourceforge.io/)**: A free and [open-source](https://github.com/eibol/ffmpeg_batch) interface for FFmpeg that allows users to easily batch edit/tweak audiovisual files.

  * ~~No WinGet package as of now~~ 
  * choco install ffmpeg-batch -y 

* **[FFmpeg Batch AV Converter Portable](https://ffmpeg-batch.sourceforge.io/)**: FFmpeg Batch AV Converter but portable.

  * ~~No WinGet package as of now~~ 
  * choco install ffmpeg-batch.portable -y 

* **[MKVToolNix](https://mkvtoolnix.download/)**: A free and [open-source](https://github.com/nmaier/mkvtoolnix) utility to manage MKV files and its content (audio tracks, subtitles, etcetera).

  * winget install -e --id MKVToolNix.MKVToolNix 
  * choco install mkvtoolnix -y 

### Music Players

Most video players play audio content with no issues whatsoever. However, one might like a dedicated audio and music software with which to play music and other sounds.

* **[Musicbee](https://getmusicbee.com/)**: A free (albeit closed-sourced) media player with a modern interface based on iTunes. Note that the provided winget command installs the Microsoft Store version of the software.

  * winget install -e --id 9P4CLT2RJ1RS --accept-package-agreements 
  * choco install musicbee -y 

* **[Foobar2000](https://www.foobar2000.org/)**: A free (albeit closed-sourced) media player with a classic interface based on an older Windows Media Player (and therefore might look a bit dated to some).

  * winget install -e --id PeterPawlowski.foobar2000 
  * choco install foobar2000 -y 

* **[AIMP](aimp.ru)**: A free (albeit close-sourced) media player with a modern interface and advanced controls, easily allowing users to equalize and control their music. However, I would not trust a russian-developed close-source application.

  * winget install -e --id AIMP.AIMP 
  * choco install aimp -y 

### Music Streaming

* **[Spotify](https://www.spotify.com/)**: The world's largest audio streaming service with music, podcast and other audio-based media content.

  * winget install -e --id Spotify.Spotify 
  * choco install spotify -y 

* **[YouTube Music](https://music.youtube.com/)**: Google's own audio streaming service with music, podcast and other audio-based media content. There's no official client as of now so, if the web application does not suffice your needs, the following packages install a wrapped version using Electron. Each package manager installs a different piece of software, each with each own set of pros and cons.  
I personally use the web browser version.

  * winget install -e --id Ytmdesktop.Ytmdesktop 
  * choco install th-ch-youtube-music -y 

* **[Plexamp](https://plexamp.com/)**: If you and/or your friends have set up a Plex Media Server, the Plexamp application offers a robust experience as a music streaming client.

  * winget install -e --id Plex.Plexamp 
  * choco install plexamp -y 

* **[Nuclear](https://nuclear.js.org/)**: Nuclear is a free and [open-source](https://github.com/nukeop/nuclear) music streaming program that pulls content from free sources all over the internet. It supports Youtube, Soundcloud, Bandcamp, and your local library, with a flexible plugin system that allows for easy addition of more sources.

  * winget install -e --id nukeop.nuclear 
  * choco install nuclear -y 

### Audio Production

* **[Audacity](https://www.audacityteam.org/)**: Audacity is a free, open-source and cross-platform software for recording and editing audio content. It is worth noting that a recent ownership change has led to some privacy issues and users have started to fork the project. I would recommend one of said forks but the original version still holds the largest userbase and is the most popular free application for audio production.

  * winget install -e --id Audacity.Audacity 
  * choco install audacity -y 

* **[Voicemeeter](https://vb-audio.com/Voicemeeter)**: Voicemeeter is a virtual mixing console and sound card running on the Windows operating system. It allows the processing of any audio signal - whether its source is physical or virtual - and its transmission to physical audio devices and/or applications. This version, the standard one, offers two physical and one virtual inputs/outputs.

  * winget install -e --id VB-Audio.Voicemeeter 
  * choco install voicemeeter -y 

* **[Voicemeeter Banana](https://vb-audio.com/Voicemeeter/banana.htm)**: Voicemeeter is a virtual mixing console and sound card running on the Windows operating system. It allows the processing of any audio signal - whether its source is physical or virtual - and its transmission to physical audio devices and/or applications. This version, the Banana one, offers three physical and two virtual inputs/outputs, an integrated recorder and additional audio processing.

  * winget install -e --id VB-Audio.Voicemeeter.Banana 
  * choco install voicemeeter-banana -y 

* **[Voicemeeter Potato](https://vb-audio.com/Voicemeeter/potato.htm)**: Voicemeeter is a virtual mixing console and sound card running on the Windows operating system. It allows the processing of any audio signal - whether its source is physical or virtual - and its transmission to physical audio devices and/or applications. This version, the most advance/complete one, offers offering five physical and three virtual inputs/outputs.

  * winget install -e --id VB-Audio.Voicemeeter.Potato 
  * choco install voicemeeter-potato -y 

* **[ASIO4ALL](http://www.asio4all.com/)**: A computer sound card driver protocol for digital audio specified by Steinberg, providing a low-latency and high fidelity interface between a software application and a computer's sound card. Whereas Microsoft's DirectSound is commonly used as an intermediary signal path for non-professional users, ASIO allows musicians and sound engineers to access external hardware directly.

  * winget install -e --id MichaelTippach.ASIO4ALL 
  * choco install asio4all -y 

* **[Reaper](https://www.reaper.fm/)**: A free (but close-source) multiplatform digital audio workstation (DAW) and MIDI sequencer software which acts as a host to most industry-standard plug-in formats and can import all commonly used media formats, including video.

  * winget install -e --id Cockos.REAPER 
  * choco install reaper -y 

### 3D Production

* **[Blender](https://www.blender.org/)**: Blender is a free and open-source professional-grade 3D computer graphics and video compositing program.

  * winget install -e --id BlenderFoundation.Blender 
  * choco install blender -y 

* **[Meshmixer](https://www.meshmixer.com/)**: A piece of software by Autodesk to properly prepare 3D files for printing.

  * ~~No WinGet package as of now~~ 
  * choco install meshmixer -y 

### Productivity

* **[Notion](https://www.notion.so/)**: Possibly the most popular project management and note-taking software, primarily designed to help members of a company or organization coordinate deadlines, objectives, and assignments for the sake of efficiency and productivity. The online-only nature of the software can lead to higher-than-expected latency (when pulling large databases) and privacy concerns (although no major incidents have been reported), so beware of that.

  * winget install -e --id Notion.Notion 
  * choco install notion -y 

* **[Obsidian](https://obsidian.md/)**: A powerful knowledge base with extensive plugin support that works on top of a local folder of plain text Markdown files.

  * winget install -e --id Obsidian.Obsidian 
  * choco install obsidian -y 

* **[Jira](https://www.atlassian.com/software/jira)**: Jira is a proprietary issue tracking product developed by Atlassian that allows bug tracking and agile project management. 

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Activity Watch](https://activitywatch.net/)**: ActivityWatch is an [open-source](https://github.com/ActivityWatch/activitywatch) app that automatically tracks how you spend time (applications, window titles...) on your devices (it is multiplatform). It has got extensions for both Chromium-based and Gecko-based web browsers, and a synchronization feature is in the works.

  * winget install -e --id ActivityWatch.ActivityWatch 
  * choco install activitywatch -y 

* **[RescueTime](https://www.rescuetime.com/)**: A popular time management software that is quite complete feature-wise but it is neither open-source nor free (it follows a subscription-based model).

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### Audiovisual Communication

* **[Discord](https://discord.com/)**: A VoIP (voice over IP) service where users communicate with voice calls, video calls, text messaging, media and files in private chats or within community servers, which are a collection of persistent chat rooms and voice chat channels. Feature-wise it is the most complete software of the list and my personal favorite for non-professional scenarios.

  * winget install -e --id Discord.Discord 
  * choco install discord -y 

* **[Teams](https://teams.com/)**: Microsoft's newest VoIP service. It was originally aimed towards professional usage, hence its name, but apparently Microsoft has decided to transform Teams in Microsoft's very own Facetime. As should be expected, Teams supports video calls, audio calls and text messaging.

  * winget install -e --id Microsoft.Teams 
  * choco install microsoft-teams -y 

* **[Skype](https://www.skype.com/)**: Microsoft's older VoIP service, geared towards the casual user and centered around video calls (despite having audio calls and text messaging functionalities as well). Once upon a time it was the most popular VoIP service in the Windows ecosystem, but that time is long gone. Works fine, its development has not halted and some people still use it, so install if you or your peers do so.  
Note that Microsoft Office installs the software, so if you were planning to install Microsoft's suite then do not install this software separately or you might end up with duplicate programs (the one bundled with Microsoft Office and the standalone version differ ever so slightly).

  * winget install -e --id Microsoft.Skype 
  * choco install skype -y 

* **[TeamSpeak](https://teamspeak.com/)**: A VoIP service where users communicate via audio (exclusively) in user-hosted servers (theoretically better for privacy, although TeamSpeak itself is proprietary and its code is close-sourced). These self-hosted servers follow a similar structure as that of Discord, with each server being a collection of persistent voice chat channels.

  * winget install -e --id TeamSpeakSystems.TeamSpeakClient 
  * choco install teamspeak -y 

* **[Slack](https://slack.com/)**: A VoIP aimed towards professional usage, with Discord-like channels to manage tasks.

  * winget install -e --id SlackTechnologies.Slack 
  * choco install slack -y 

* **[Webex](https://www.webex.com/)**: Also known as Webex Meetings, this software is Cisco's own video conferencing and online meeting application, aimed towards professional usage.

  * winget install -e --id Cisco.CiscoWebexMeetings 
  * choco install webex-meetings -y 

* **[Zoom](https://zoom.us/)**: A video conferencing and online meeting software that was extremely popular during the pandemic. [There have been privacy concerns in regards to Zoom](https://www.tomsguide.com/news/zoom-security-privacy-woes), so use an alternative if that's a concern for you too.

  * winget install -e --id Zoom.Zoom 
  * choco install zoom -y 

* **[Voicemod](https://www.voicemod.net/)**: Voicemod is not another VoIP service but a software that runs and enhances said services with real-time voice changing/tuning and numerous custom effects and filters for one's audio input.

  * winget install -e --id Voicemod.Voicemod 
  * choco install voicemod -y 

### Text-based Communication

* **[Telegram](https://telegram.org/)**: A free and [open-source](https://github.com/telegramdesktop/tdesktop), cross-platform, cloud-based instant messaging software. The service also provides end-to-end encrypted video calling, VoIP, file sharing and several other features. Feature-wise it usually is ahead of WhatsApp and privacy-wise there's little concern, as its chat are end-to-end encrypted and the software itself is FOSS.

  * winget install -e --id Telegram.TelegramDesktop 
  * choco install telegram -y 

* **[Signal](https://www.signal.org/)**: Another free and [open-source](https://github.com/signalapp) messaging service with a privacy-focused standpoint. Telegram seems to care about privacy but privacy itself is not the axis around which Telegram was built but such is the case with Signal.

  * winget install -e --id OpenWhisperSystems.Signal 
  * choco install signal -y 

* **[WhatsApp](https://www.whatsapp.com/)**: An extremely popular messaging service despite it not being open-source. It is owned by Facebook/Meta, a technology giant with a complicated relationship with data privacy. It's basically a worse Telegram, but since many people use it some of us have no option but to do so as well.

  * winget install -e --id WhatsApp.WhatsApp 
  * choco install whatsapp -y 

### Remote Desktop

* **[TeamViewer](https://www.teamviewer.com/)**: The most popular choice. It was originally based on the VNC protocol, but now its underlying protocol remains proprietary.

  * winget install -e --id TeamViewer.TeamViewer 
  * choco install teamviewer -y 

* **[TeamViewer Portable](https://www.teamviewer.com/)**: TeamViewer but portable.

  * ~~No WinGet package as of now~~ 
  * choco install teamviewer.portable -y 

* **[Anydesk](https://www.anydesk.com/)**: A remote desktop software made by ex-TeamViewer developers. AnyDesk uses a proprietary video codec _DeskRT_ that is theoretically designed to allow users to experience higher-quality video and sound transmission while reducing the transmitted amount of data to the minimum.

  * winget install -e --id AnyDeskSoftwareGmbH.AnyDesk 
  * choco install anydesk -y 

* **[Anydesk Portable](https://www.anydesk.com/)**: Anydesk but portable.

  * ~~No WinGet package as of now~~ 
  * choco install anydesk.portable -y 

* **[NoMachine](https://www.nomachine.com/)**: A noteworthy alternative which uses a proprietary NX protocol. Prior to NX version 4.0, NoMachine released core NX technology under the GNU General Public License, leading to other services such as FreeNX and X2Go (now it is close-source). Have not tested it outside of a local network but I vouch for its performance within a local environment.

  * winget install -e --id NoMachine.NoMachine 
  * choco install nomachine -y 

### Gaming Platforms

* **[Playnite](https://playnite.link/)**: An [open-source](https://github.com/JosefNemec/Playnite/) video game library manager and launcher with support for 3rd party libraries and even emulators. It does what GOG Galaxy aims to do.

  * winget install -e --id Playnite.Playnite 
  * choco install playnite -y 

* **[Steam](https://store.steampowered.com/)**: The most popular gaming platform for the PC ecosystem.

  * winget install -e --id Valve.Steam 
  * choco install steam-client -y 

* **[Epic Games](https://www.epicgames.com/site/home)**: The giver of free PC goodies a popular gaming platform since Fortnite's success. The company itself is public and Tencent owns quite a percentage of shares, and I do not like that at all (although I won't say no to free games).

  * winget install -e --id EpicGames.EpicGamesLauncher 
  * choco install epicgameslauncher -y 

* **[GOG Galaxy](https://www.gog.com/galaxy)**: The haven of games without DRM.

  * winget install -e --id GOG.Galaxy 
  * choco install goggalaxy -y 

* **[Heroic Game Launcher](https://heroicgameslauncher.com/)**: An [open-source](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher) GOG and Epic games launcher for Linux, Windows and MacOS.

  * winget install -e --id HeroicGamesLauncher.HeroicGamesLauncher 
  * ~~No Chocolatey package as of now~~ 

* **[Itch](https://itch.io/)**: The haven of the indiest indies. Most (if not all) games are DRM-free.

  * ~~No WinGet package as of now~~ 
  * choco install itch -y 

* **[Ubisoft Connect](https://ubisoftconnect.com/)**: Ubisoft's launcher and cross-platform service.

  * winget install -e --id Ubisoft.Connect 
  * choco install ubisoft-connect -y 

* **[Origin](https://www.origin.com/)**: Electronic Arts' platform and game-launcher.

  * ~~No WinGet package as of now~~ 
  * choco install origin -y 

* **[EA app](https://www.ea.com/ea-app-beta)**: Electronic Arts' newest platform and game-launcher (still in beta).

  * winget install -e --id ElectronicArts.EADesktop 
  * ~~No Chocolatey package as of now~~ 

* **[Amazon Games](https://gaming.amazon.com/amazon-games-app)**: Amazon Prime gives away games for free each month, and Amazon Games is the software to manage (install and launch) said games.

  * winget install -e --id Amazon.Games 
  * choco install amazongames -y 

* **[Rockstar Game Launcher](https://socialclub.rockstargames.com/rockstar-games-launcher)**: Rockstar's platform and game-launcher.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[Bethesda.Net Launcher](https://bethesda.net/)**: Bethesda's platform and game-launcher.

  * winget install -e --id Bethesda.Launcher 
  * choco install bethesdanet -y 

* **[Battle.net](https://www.blizzard.com/apps/battle.net/desktop)**: Activision Blizzard's platform and game-launcher. Note: do not buy their games, there are many reasons both in [English](https://www.youtube.com/watch?v=VbCPwtIQyDM) and [Spanish](https://www.youtube.com/watch?v=AOiQHRuEihc).

  * ~~No WinGet package as of now~~ 
  * choco install battle.net -y 

* **[Oculus](https://www.oculus.com/setup/)**: Oculus/Meta software to setup Oculus/Meta devices and to buy/launch games for the platform.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

### Gaming Emulators

* **[RetroArch](https://www.retroarch.com/)**: The emulator to emulate them all. It is based on cores with each core emulating a given console. Takes a while to setup and some emulators do not have a core available for the platform, but having said that it feels great once properly configured.

  * ~~No WinGet package as of now~~ 
  * choco install retroarch -y 

* **[Emulation Station](https://emulationstation.org/)**: Particularly known for its Raspberry Pi support (although the software works in Windows without an issue), Emulation Station is a front-end that brings your emulators together in an easy-to-use and visual appealing interface. However, the underlying emulators must be configured separately, and the overall setup process is more tedious than that of RetroArch.

  * winget install -e --id Emulationstation.Emulationstation 
  * ~~No Chocolatey package as of now~~ 

* **[PPSSPP](https://www.ppsspp.org/)**: A free and [open-source](https://github.com/hrydgard/ppsspp) PSP emulator.

  * winget install -e --id PPSSPPTeam.PPSSPP 
  * choco install ppsspp -y 

* **[Cemu](https://cemu.info/)**: The WiiU emulator. It is free and, although it is not open-source at the time of writing, it will be open-sourced in the near future.

  * ~~No WinGet package as of now~~ 
  * choco install cemu -y 

* **[Dolphin](https://dolphin-emu.org/)**: A free and [open-source](https://github.com/dolphin-emu/dolphin) GameCube and Wii emulator.

  * winget install -e --id DolphinEmulator.Dolphin 
  * choco install dolphin -y 

* **[Project64](https://www.pj64-emu.com/)**: A free and [open-source](https://github.com/project64/project64) Nintendo64 emulator. Works great, although it requires a bit of configuration on the users behalf.

  * winget install -e --id Project64.Project64 
  * choco install project64 -y 

* **[mBGA](https://mgba.io/)**: A free and [open-source](https://github.com/mgba-emu) GameBoy Advance (GBA) emulator.

  * winget install -e --id JeffreyPfau.mGBA 
  * choco install mbga -y 

### Gaming Utilities

* **[Parsec](https://parsec.app/)**: Free software to play local co-op games with your friends via streaming.

  * winget install -e --id Parsec.Parsec 
  * choco install parsec -y 

* **[Moonlight Streaming Client](https://moonlight-stream.org/)**:  Moonlight allows the streaming of content from a NVIDIA powered machine to clients such as this one with the least latency possible.

  * winget install -e --id MoonlightGameStreamingProject.Moonlight 
  * choco install moonlight-qt -y 

* **[Moonlight Portable Client](https://moonlight-stream.org/)**: The Moonlight streaming client for the Windows PC ecosystem, but portable.

  * ~~No WinGet package as of now~~ 
  * choco install moonlight-qt.portable -y 

* **[Vortex](https://www.nexusmods.com/about/vortex/)**: FOSS tool by Nexus Mods to manage your games' mods.

  * winget install -e --id NexusMods.Vortex 
  * choco install vortex -y 

* **[Borderless Gaming](https://github.com/Codeusa/Borderless-Gaming)**: A free and open-source tool that turns a windowed game into a borderless-windowed one (allowing users to easily switch back and forth between the game and other applications).

  * winget install -e --id Codeusa.BorderlessGaming 
  * choco install borderlessgaming -y 

* **[Cheat Engine](https://cheatengine.org/)**: A great tool to tweak/modify memory-based registries within a game/app. No available packages for it though.

  * ~~No WinGet package as of now~~ 
  * ~~No Chocolatey package as of now~~ 

* **[SideQuest](https://sidequestvr.com/)**: A portal with which to sideload apps and content into android based VR devices such as the Oculus Go and the Oculus Quest. It also allows the headset to stream its content (without audio though).

  * winget install -e --id SideQuestVR.SideQuest 
  * choco install sidequest -y 

* **[DS4Windows](https://ds4-windows.com/)**: An open-source tool to make a DualShock or DualSense gamepad work with certain games/apps.

  * ~~No WinGet package as of now~~ 
  * choco install ds4windows -y 

### Coding

* **[Visual Studio Code](https://code.visualstudio.com/)**: Microsoft's own source code editor and one of the most solid picks due to its customizability and extensive plugin support. Its folder-based structure is not up to every person (nor to every task) but all in all it's a reliable editor.

  * winget install -e --id Microsoft.VisualStudioCode 
  * choco install vscode -y 

* **[Visual Studio Code Portable](https://code.visualstudio.com/)**: Visual Studio Code but portable.

  * ~~No WinGet package as of now~~ 
  * choco install vscode.portable -y 

* **[Visual Studio Code Insiders](https://code.visualstudio.com/insiders/)**: The most up-to-date but also the most unstable version of the software; updated everyday. Can be installed side-by-side, allowing users to use both versions of Visual Studio Code independently (useful if the Insiders build breaks for whatever reason).

  * winget install -e --id Microsoft.VisualStudioCode.Insiders 
  * choco install vscode-insiders -y 

* **[Visual Studio Codium](https://vscodium.com/)**: Visual Studio Code but open-sourced and without Microsoft's telemetry. Should be the better pick between them both (privacy-wise at least), although a few plugins do not support Codium.

  * winget install -e --id VSCodium.VSCodium 
  * choco install vscodium -y 

* **[Visual Studio Codium Portable](https://vscodium.com/)**: Visual Studio Code but portable.

  * ~~No WinGet package as of now~~ 
  * choco install vscodium.portable -y 

* **[Visual Studio 2022 Community](https://visualstudio.microsoft.com/es/vs/community/)**: The not-so-distant cousin of Visual Studio Code, also developed by Microsoft. Both have their use-cases: whereas Visual Studio Code is lightweight, cross-platform and a viable option for most code edition, Visual Studio targets resource-intensive tasks such as C# and .NET projects, which is aided by specific features such as an integrated CPU and memory profiler. Note that, like Visual Studio Code, Visual Studio is heavily aided by its extensive plugin support.

  * winget install -e --id Microsoft.VisualStudio.2022.Community 
  * choco install visualstudio2022community -y 

* **[Vim](https://www.vim.org/)**: A free and [open-source](https://github.com/vim/vim) multi-platform text/code editor. It is not really recommended for beginners since its UI is not precisely user-friendly, but once mastered it is extremely powerful due to its plugin support and many keyboard shortcuts.

  * winget install -e --id vim.vim 
  * choco install vim -y 

* **[Atom](https://atom.io/)**: A mutiplatform free and open-source text and source code editor with embedded Git Control developed by GitHub. It's quite similar to Visual Studio Code/Codium both interface-wise and due to its great customizability, although I've read that Atom has worse performance when lots of extensions are at place.  
Since Microsoft bought GitHub I think they are slowly phasing out the software in favor of Visual Studio Code (e.g. GitHub Copilot does not work with Atom as far as I know), although I could be wrong in the long term.

  * winget install -e --id GitHub.Atom 
  * choco install atom -y 

* **[Atom Portable](https://atom.io/)**: Atom but portable.

  * ~~No WinGet package as of now~~ 
  * choco install atom.portable -y 

* **[Atom Beta](https://atom.io/)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the software. They are generally low risk, so can be viable options if the software itself is up one's alley.

  * winget install -e --id GitHub.Atom.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Github Desktop](https://desktop.github.com/)**: The one tool to manage Github projects.

  * winget install -e --id GitHub.GitHubDesktop 
  * choco install github-desktop -y 

* **[Github Desktop Beta](https://desktop.github.com/)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the software. They are generally low risk, so can be viable options if the software itself is up one's alley.

  * winget install -e --id GitHub.GitHubDesktop.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[GitKraken](https://www.gitkraken.com/)**: One of the most popular Git GUI.

  * winget install -e --id Axosoft.GitKraken 
  * choco install gitkraken -y 

* **[JetBrains Toolbox App](https://www.jetbrains.com/toolbox-app/)**: A control panel for JetBrains tools/IDEs and projects. It has access to many useful applications aimed towards many relevant scenarios (there's WebStorm for web development, Android Studio for Android app development, PyCharm for Python development, etcetera).

  * winget install -e --id JetBrains.Toolbox 
  * choco install jetbrainstoolbox -y 

* **[Android Studio](https://developer.android.com/studio/)**: The official development environment for the Android operating system.

  * winget install -e --id Google.AndroidStudio 
  * choco install androidstudio -y 

* **[Android Studio Beta](https://developer.android.com/studio/preview)**: Beta branches allow users to preview upcoming changes and features before they are rolled-out to the stable version of the software. They are generally low risk, so can be viable options if the software itself is up one's alley.

  * winget install -e --id Google.AndroidStudio.Beta 
  * ~~No Chocolatey package as of now~~ 

* **[Android Studio Canary](https://developer.android.com/studio/preview)**: The most up-to-date but also the most unstable version of the software; updated everyday.

  * winget install -e --id Google.AndroidStudio.Canary 
  * ~~No Chocolatey package as of now~~ 

* **[Unity Hub](https://unity.com/unity-hub)**: A control panel to manage multiple installations of the Unity Editor and Unity projects.

  * winget install -e --id UnityTechnologies.UnityHub 
  * choco install unity-hub -y 

* **[R for Windows](https://cran.r-project.org/bin/windows/base/)**: R is a programming language and free software environment for statistical computing and graphics, widely used among statisticians and data miners/scientists/engineers for developing statistical software and data analysis. There has been a significant update with version 3.6, so refer to [this directory](https://cran.r-project.org/bin/windows/base/old/) if you need an older R version.

  * winget install -e --id RProject.R 
  * choco install r.project -y 

* **[RStudio](https://www.rstudio.com/)**: A free and open-source R IDE.

  * winget install -e --id RStudio.RStudio.OpenSource 
  * choco install r.studio -y 

* **[RTools](https://cran.rstudio.com/bin/windows/Rtools/rtools40.html)**: A collection of tools for building R packages under Windows.

  * winget install -e --id RProject.Rtools 
  * choco install rtools -y 

* **[Python 3](https://www.python.org/)**: A popular programming language, useful for everything in between web development and data science (there are even videogames developed exclusively with Python).

  * winget install -e --id Python.Python.3 
  * choco install python3 -y 

* **[Python 2](https://www.python.org/)**: A popular programming language, useful for everything in between web development and data science (there are even videogames developed exclusively with Python).

  * winget install -e --id Python.Python.2 
  * choco install python2 -y 

* **[Anaconda (Python 3)](https://www.anaconda.com/)**: Anaconda is a distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.) that aims to simplify package management and deployment.

  * winget install -e --id Anaconda.Anaconda3 
  * choco install anaconda3 -y 

* **[Anaconda (Python 2)](https://www.anaconda.com/)**: Anaconda is a distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.) that aims to simplify package management and deployment.

  * ~~No WinGet package as of now~~ 
  * choco install anaconda2 -y 

* **[Miniconda (Python 3)](https://docs.conda.io/en/latest/miniconda.html)**: A small, bootstrap version of Anaconda which includes only conda, Python, the packages they depend on and a small number of other packages.

  * winget install -e --id Anaconda.Miniconda3 
  * choco install miniconda3 -y 

* **[Miniconda (Python 2)](https://docs.conda.io/en/latest/miniconda.html)**: A small, bootstrap version of Anaconda which includes only conda, Python, the packages they depend on and a small number of other packages.

  * ~~No WinGet package as of now~~ 
  * choco install miniconda2 -y 

* **[Spyder](https://www.spyder-ide.org/)**: A free and open-source Python IDE and my very first interpreter for the language. I'm moving my workflow over to Visual Codium, but I find Spyder a solid choice and in the end it all comes down to personal preferences.

  * winget install -e --id Spyder.Spyder 
  * ~~No Chocolatey package as of now~~ 

* **[Ruby](https://www.ruby-lang.org/)**: Ruby is an interpreted, high-level, general-purpose programming language which supports multiple programming paradigms, including procedural, object-oriented, and functional programming.

  * ~~No WinGet package as of now~~ 
  * choco install ruby -y 

* **[RubyInstaller](https://rubyinstaller.org/)**: The RubyInstaller project provides an [open-source](https://github.com/oneclick/rubyinstaller2) and self-contained Windows-based installer that includes a Ruby-language execution environment and a baseline set of required RubyGems and extensions.  
Note that there are two WinGet installs, the first one being the standard bundle and the latter one including the Ruby development kit.

  * winget install -e --id RubyInstallerTeam.Ruby 
  * winget install -e --id RubyInstallerTeam.RubyWithDevKit 
  * ~~No Chocolatey package as of now~~ 

* **[Cacher](https://www.cacher.io/)**: A snippet-based coding complement.
  
  * winget install -e --id PenguinLabs.Cacher 
  * choco install cacher -y 

* **[Kite](https://www.kite.com/)**: A free (but close-source) AI-powered code completion tool for code editors.

  * winget install -e --id kite.kite 
  * ~~No Chocolatey package as of now~~ 

### Development Tools

* **[.NET Framework](https://dotnet.microsoft.com/en-us/download/dotnet-framework)**: .NET Framework is a Windows-only version of .NET for building any type of app that runs on Windows.

  * winget install -e --id Microsoft.dotNetFramework 
  * choco install dotnet4.6.1 -y 

* **[XAMPP](https://www.apachefriends.org/download.html)**: Apache server for Windows. Useful for web development.

  * winget install -e --id ApacheFriends.Xampp 
  * choco install xampp-80 -y 

* **[CMake](https://cmake.org/)**: An open-source, cross-platform family of tools designed to build, test and package software.

  * winget install -e --id Kitware.CMake 
  * choco install cmake -y 

* **[Docker](https://www.docker.com/products/docker-desktop/)**: The most popular tool to containerize applications.

  * winget install -e --id Docker.DockerDesktop 
  * choco install docker-desktop -y 

* **[NSIS](https://nsis-dev.github.io/)**: An open-source system to create Windows-compatible installers.

  * winget install -e --id NSIS.NSIS 
  * choco install nsis -y 

* **[WinMerge](https://winmerge.org/)**: A free and [open-source](https://github.com/WinMerge/winmerge) tool to compare and merge text files. I use it to evaluate the differences between code-based text files.

  * winget install -e --id WinMerge.WinMerge 
  * choco install winmerge -y 

### Research Tools

* **[Mendeley Reference Manager](https://www.mendeley.com/)**: Mendeley's new software has been built to improve its previous offering and give users/researchers the tools needed to manage references quickly and effectively.

  * ~~No WinGet package as of now~~ 
  * choco install mendeley-reference-manager -y 

* **[Zotero](https://www.zotero.org/)**: Zotero is a free and open-source reference management software to manage references, bibliographic data and related research materials. It's basically a FOSS alternative to Mendeley and my personal choice.

  * winget install -e --id Zotero.Zotero 
  * choco install zotero -y 

### Windows Desktop Environment

* **[Rainmeter](https://www.rainmeter.net/)**: A free and open-source desktop customization utility for Windows which allows users to create and display user-generated customizable desktop widgets or applets, heavily customizing the default Windows desktop environment.

  * winget install -e --id Rainmeter.Rainmeter 
  * choco install rainmeter -y 

* **[PowerToys](https://github.com/microsoft/PowerToys)**: A free and open-source toolset built by Microsoft. It is built by modules, some of which are easy to learn whereas others require a bit of an effort, but all in all it is a really practical software without which my Windows experience would worsen significantly.

  * winget install -e --id Microsoft.PowerToys 
  * choco install powertoys -y 

* **[Open-Shell-Menu](https://open-shell.github.io/Open-Shell-Menu/)**: A free and [open-source](https://github.com/Open-Shell/Open-Shell-Menu) software which brings back the classic style Start Menu for current Windows versions.

  * winget install -e --id Open-Shell.Open-Shell-Menu 
  * choco install open-shell -y 

* **[StartIsBack](https://startisback.com/)**: This software transforms the Windows 10 Start Menu into a fairly customizable Windows 7 style Start Menu. Despite it not being free, it is robust enough to warrant a mention.

  * winget install -e --id StartIsBack.StartIsBack 
  * ~~No Chocolatey package as of now~~ 

* **[StartAllBack](https://www.startallback.com/)**: This software completely improves/enhances the Windows 11 Start Menu and the Windows 11 Explorer. Despite it not being free, its robustness and extensive customizability makes of it a highly recommendable software. Users can select between a Windows 7-style Start Menu, a Windows 10-style Start Menu and an improved Windows 11-style one. What's more, it allows users to properly customize the Windows Explorer and fixes many issues under the hood (mouse hovering over a menu item highlighted a very tight region due to the padding being set too high, and StartAllBack fixes that).

  * winget install StartIsBack.StartAllBack 
  * ~~No Chocolatey package as of now~~ 

* **[Start10](https://www.stardock.com/products/start10/)**: Another non-free option to replace the Windows 10 Start Menu with a Windows 7-style one.  
It is developed by Stardock, who also developed [Start11](https://www.stardock.com/products/start11/), [Groupy](https://www.stardock.com/products/groupy/) and [Fences](https://www.stardock.com/products/fences/).  
The software is also [available via Steam](https://store.steampowered.com/app/620050/Start10/).

  * winget install -e --id Stardock.Start10 
  * choco install start10 -y 

* **[Start11](https://www.stardock.com/products/start11/)**: Another non-free option to replace the Windows 10 and/or Windoes 11 Start Menu with a highly customizable one. It lets the user select a Start Menu style which ranges from the classic Windows 7-style to Microsoft's own Windows 11-style (it lets you use that in Windows 10) and everything in between).  
It also unlocks some other taskbar related features, such as the option to place it at the top and right clicking upon it to perform selected actions.  
It is developed by Stardock, who also developed [Start10](https://www.stardock.com/products/start10/), [Groupy](https://www.stardock.com/products/groupy/) and [Fences](https://www.stardock.com/products/fences/).

  * winget install -e --id Stardock.Start11 
  * ~~No Chocolatey package as of now~~ 

* **[RoundedTB](https://github.com/torchgm/RoundedTB)**: An [open-source](https://github.com/torchgm/RoundedTB) software to add margins, rounded corners and segments to your taskbar. Works for both Windows 10 and Windows 11.

  * winget install -e --id 9MTFTXSJ9M7F --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[Twinkle Tray](https://twinkletray.com/)**: A free and [open-source](https://github.com/xanderfrangos/twinkle-tray) tool to easily control a monitor (or monitors) brightness from the system tray.  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id xanderfrangos.twinkletray 
  * winget install -e --id 9PLJWWSV01lK --accept-package-agreements 
  * ~~No Chocolatey package as of now~~ 

* **[f.lux](https://justgetflux.com/)**: A free albeit close-source tool to adapt one's display to the time of day, making it warmer as the day goes offering functional respite for the eyes. Sometimes, system usage spikes when [f.lux](https://justgetflux.com/) does its thing, so I rather use an alternative (it gets really annoying when playing game since [f.lux](https://justgetflux.com/) temporarily decreases frames per second).

  * winget install -e --id flux.flux 
  * choco install f.lux -y 

* **[LightBulb](https://github.com/Tyrrrz/LightBulb)**: A free and [open-source](https://github.com/Tyrrrz/LightBulb) tool to adapt one's display to the time of day, making it warmer as the day goes offering functional respite for the eyes. Basically an [f.lux](https://justgetflux.com/) open-source alternative. Sometimes, system usage spikes when [f.lux](https://justgetflux.com/) does its thing, so I rather use an alternative (it gets really annoying when playing game since [f.lux](https://justgetflux.com/) temporarily [decreases frames per second, microlagging](https://www.reddit.com/r/osugame/comments/5rpq1q/lightbulb_gamingfriendly_flux_alternative)).

  * winget install -e --id Tyrrrz.LightBulb 
  * choco install lightbulb -y 

* **[EarTrumpet](https://eartrumpet.app/)**: An improved volume control for the Windows system tray.  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id File-New-Project.EarTrumpet 
  * winget install -e --id 9NBLGGH516XP --accept-package-agreements 
  * choco install eartrumpet -y 

* **[ElevenClock](https://www.somepythonthings.tk/programs/elevenclock/)**: A free and [open-source](https://github.com/martinet101/ElevenClock) clock to complement your desktop environment. By default it overrides the taskbar clock by being placed upon it, but its placement can be moved if so desired.

  * winget install -e --id SomePythonThings.ElevenClock 
  * choco install elevenclock -y 

* **[AltDrag](https://stefansundin.github.io/altdrag/)**: A free and [open-source](https://github.com/stefansundin/altdrag/) tool which gives you the ability to move and resize windows by simply holding down the Alt key and then clicking and draging the window of choice. This behavior already exists in Linux and other operating systems, and AltDrag was made with the mission to copy that behavior to the Windows platform, and then to further expand it with new intuitive functionality.  
It has been discontinued, but still works rather well unless some specific features (e.g. DPI scaling) are enabled. Fortunately, its open-source nature has led to the development of [AltSnap](https://github.com/RamonUnch/AltSnap).

  * winget install -e --id AltDrag.AltDrag 
  * choco install altdrag -y 

* **[AltSnap](https://github.com/RamonUnch/AltSnap)**: A free and [open-source](https://github.com/RamonUnch/AltSnap) tool born as an AltDrag fork and now provides an up-to-date and simpler (code-wise, meaning that it has been optimized) alternative to said software, being the preferred choice as of now.

  * winget install -e --id AltSnap.AltSnap 
  * choco install altsnap -y 

* **[Alt-Tab Terminator](https://www.ntwind.com/software/alttabter.html)**: An alternative task management utility for Windows. It works fine but it is not free ($20 a single user license). Up to each.

  * ~~No WinGet package as of now~~ 
  * choco install alt-tab-terminator -y 

* **[Qttabbar](https://indiff.github.io/qttabbar/)**: A free and [open-source](https://github.com/indiff/qttabbar) software which adds tabs to the default Windows Explorer.

  * winget install -e --id QTTabBar.QTTabBar 
  * choco install qttabbar -y 

* **[Groupy](https://www.stardock.com/products/groupy/)**: A non-free close-source software which adds tabs to the default Windows Explorer. Despite its cost its close-source nature, it is the one I use (instead of Qttabbar) since I find its interface more manageable.  
It is developed by Stardock, who also developed [Start10](https://www.stardock.com/products/start10/), [Start11](https://www.stardock.com/products/start11/) and [Fences](https://www.stardock.com/products/fences/).  
The software is also [available via Steam](https://store.steampowered.com/app/912170/Groupy/).

  * ~~No WinGet package as of now~~ 
  * choco install groupy -y 

* **[Fences](https://www.stardock.com/products/fences/)**: A non-free close-source software organizes your desktop by automatically placing shortcuts and icons into resizable shaded areas (fences).  
It is developed by Stardock, who also developed [Start10](https://www.stardock.com/products/start10/), [Start11](https://www.stardock.com/products/start11/) and [Groupy](https://www.stardock.com/products/groupy/).

  * winget install -e --id Stardock.Fences 
  * choco install stardock-fences -y 

### Context Menu Extensions

* **[File Converter](https://file-converter.org/)**: An [open-source](https://github.com/Tichau/FileConverter) tool which allows users to convert and compress one or several file(s) using the context menu of windows explorer. Its easy-to-use nature and usefulness makes of it an essential software for most (if not all) Windows users.

  * winget install -e --id AdrienAllard.FileConverter 
  * choco install file-converter -y 

* **[MediaInfo](https://mediaarea.net/MediaInfo)**: An [open-source](https://github.com/MediaArea/MediaInfo) tool that displays technical information about media files, easily accessible from within Windows Explorer's context menu.

  * winget install -e --id MediaArea.MediaInfo 
  * choco install mediainfo -y 

* **[Link Shell Extension](https://gitlab.com/schinagl/link-shell-extension)**: An open-source Windows Explorer extension for easy creation of Hardlinks, Junctions, Volume Mountpoints and Symbolic Links.

  * winget install -e --id HermannSchinagl.LinkShellExtension 
  * choco install linkshellextension -y 

### Windows Search Alternatives

* **[Everything](https://www.voidtools.com/)**: Windows Search doesn't work that well (although it has improved in Windows 11). PowerToys already provides an alternative search functionality, but Everything works better than anything I've tested so far.

  * winget install -e --id voidtools.Everything 
  * choco install everything -y 

* **[Everything Lite](https://www.voidtools.com/)**: The Lite version of Everything is the same as the normal multilingual version of Everything with some features removed ([this post points out which](https://www.voidtools.com/forum/viewtopic.php?t=9236)).

  * winget install -e --id voidtools.Everything.Lite 
  * ~~No Chocolatey package as of now~~ 

* **[Everything Toolbar](https://github.com/stnkl/EverythingToolbar)**: An open-source wrapper for Everything in the form of a taskbar toolbar. Setting it up requires a bit of tinkering, but its documentation is easy to follow.

  * winget install -e --id stnkl.EverythingToolbar 
  * ~~No Chocolatey package as of now~~ 

* **[Wox](http://www.wox.one/)**: My personal free and [open-source](https://github.com/Wox-launcher/Wox) keystroke launcher for Windows.

  * winget install -e --id Wox.Wox 
  * choco install wox -y 

* **[Ueli](https://www.ueli.app/)**: Another free and [open-source](https://github.com/oliverschwendener/ueli) keystroke launcher for Windows and macOS.

  * winget install -e --id OliverSchwendener.ueli 
  * choco install ueli -y 

* **[Launchy](http://www.launchy.net/)**: Another free and [open-source](https://sourceforge.net/projects/launchy/) keystroke launcher for Windows.

  * winget install -e --id CodeJelly.Launchy 
  * choco install launchy -y 

* **[Cerebro](https://cerebroapp.com/)**: A free and [open-source](https://github.com/cerebroapp/cerebro) multi-platform (Windows, Linux, MacOS) keystroke launcher.

  * winget install -e --id AlexandrSubbotin.Cerebro 
  * choco install cerebro -y 

### Windows Explorer Alternatives

* **[Files](https://files.community/)**: A recent but visually impactful [open-source](https://github.com/files-community/Files) alternative for Windows Explorer, and in my opinion the simplest and easiest to use from this list.

  * winget install -e --id 9nghp3dx8hdx --accept-package-agreements 
  * choco install files -y 

* **[Double Commander](https://doublecommander.com/)**: A free and [open-source](https://doublecmd.sourceforge.io/) cross-platform alternative for Windows Explorer with an interface divided in two panels side by side, hence its name. Its design is not user-friendly and can be overwhelming, but it is a practical UI for file management (after getting used to it).

  * winget install -e --id alexx2000.DoubleCommander 
  * choco install doublecmd -y 

* **[Total Commander](https://www.ghisler.com/)**: A free (but close-source) alternative for Windows Explorer with an interface divided in two panels side by side, like Double Commander. Its design is not user-friendly and can be overwhelming, but it is a practical UI for file management (after getting used to it).

  * winget install -e --id Ghisler.TotalCommander 
  * choco install totalcommander -y 

* **[Multi Commander](http://multicommander.com/)**: A free (but close-source) alternative to Windows Explorer. It is built upon its multi-tab support, hence its name. Its design is not user-friendly and can be overwhelming, but it is a practical UI for file management (after getting used to it).  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id MathiasSvensson.MultiCommander 
  * winget install -e --id 9NBLGGH4NFS5 --accept-package-agreements 
  * choco install multicommander -y

* **[FreeCommander XE](https://freecommander.com/)**: A free (but close-source) alternative to Windows Explorer. Its design is not user-friendly and can be overwhelming, but it is a practical UI for file management (after getting used to it). Beware that system files are hidden in the free 32bit version of the software and that the 64bit version is not free. This paywall and its close-source nature makes me prefer the alternatives.

  * winget install -e --id MarekJasinski.FreeCommanderXE 
  * choco install freecommander-xe.install -y 

### File Transfer Alternatives

* **[TeraCopy](https://www.codesector.com/teracopy)**: A freemium file transfer utility designed as an alternative for the built-in Windows Explorer file transfer feature. When moving lots of files it works better than Windows Explorer, but locking features behind a paywall annoys me and since the software is not FOSS, I fear for my files' privacy.

  * winget install -e --id CodeSector.TeraCopy 
  * choco install teracopy -y 

* **[FastCopy](https://fastcopy.jp/)**: Another file transfer utility designed as an alternative for the built-in Windows Explorer file transfer feature. It was originally open-source, under the GPLv3 license, but later freeware releases changed that. I'd rather stick with Windows Explorer.

  * winget install -e --id FastCopy.FastCopy 
  * choco install fastcopy -y 

### Virtual Machine Managers

* **[VirtualBox](https://www.virtualbox.org/)**: A free and [open-source](https://www.virtualbox.org/browser/vbox/trunk) software for creating and managing virtual machines.

  * winget install -e --id Oracle.VirtualBox 
  * choco install virtualbox -y 

* **[VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)**: Also known as *Guest Additions*, this package adds support for USB 2.0 and USB 3.0 devices, VirtualBox RDP, disk encryption, NVMe and PXE boot for Intel cards. See [this chapter](https://www.virtualbox.org/manual/ch01.html#intro-installing) from the VirtualBox User Manual for an introduction to this Extension Pack.

  * ~~No WinGet package as of now~~ 
  * choco install virtualbox-guest-additions-guest.install -y 

* **[VMware Workstation Player](https://www.vmware.com/products/workstation-player.html)**: A free albeit close-source software for creating and managing virtual machines.

  * winget install -e --id VMware.WorkstationPlayer 
  * choco install vmware-workstation-player -y 

* **[VMware Workstation Pro](https://www.vmware.com/products/workstation-pro.html)**: The pro/paid version of the VMware Workstation Player, and arguably the industry standard despite its cost and close-source nature.

  * winget install -e --id VMware.WorkstationPro 
  * choco install vmwareworkstation -y 

* **[VMware Tools](https://docs.vmware.com/en/VMware-Tools/index.html)**: A set of services and modules that enable several features in VMware products for better management of, and seamless user interactions with, guests operating systems.

  * ~~No WinGet package as of now~~ 
  * choco install vmware-tools -y 

### Miscellaneous Tools

* **[AutoHotKey](https://www.autohotkey.com/)**: Free and open-source macro-creation and automation software utility that allows users to automate repetitive tasks. It is driven by a custom scripting language that is aimed specifically at providing keyboard shortcuts (hotkeys).

  * winget install -e --id Lexikos.AutoHotkey 
  * choco install autohotkey -y 

* **[HxD](https://mh-nexus.de/en/hxd/)**: The most popular hexadecimal editor. Due to its close-source nature, I'd found an alternative in Notepad++ (which has a plugin for hexadecimal edition).

  * ~~No WinGet package as of now~~ 
  * choco install hxd -y 

* **[Rufus](https://rufus.ie/)**: ISO file management has gotten better with Windows 10, but somehow the option to mount an ISO file onto an USB is nowhere to be found - that's why Rufus is still here, the old reliable free and open-source tool to do so. What's more is that it also offers a ton of options to ensure a correct/optimal mounting of the image.  
Note that there are two WinGet installs, the first one being the standard version of the software and the latter one being the Microsoft Store application.

  * winget install -e --id Rufus.Rufus 
  * winget install -e --id 9PC3H3V7Q9CH --accept-package-agreements 
  * choco install rufus -y 

* **[Ventoy](https://www.ventoy.net/)**: Another free and [open-source](https://github.com/ventoy/Ventoy) ISO mounting software that instead of just mounting an image onto an USB (which is what Rufus does) it aims to create a bootable USB drive with as many ISO files as the user desires.

  * ~~No WinGet package as of now~~ 
  * choco install ventoy -y 

* **[NirLauncher](https://launcher.nirsoft.net/)**: A set of explendid tools by Nirsoft. Most are way too complicated for the average user, but it's a powerful toolset for the most advanced users.

  * ~~No WinGet package as of now~~ 
  * choco install nirlauncher -y 

* **[Advanced Renamer](https://www.advancedrenamer.com/)**: Name says it all. Batch-renaming in Windows Explorer leaves a lot to be desired and although PowerToys already has a module for batch-renaming (which I sometimes use when the task at hand is simple) Advanced Renamer takes said functionality a step further with the use of filters, parameters and a bunch of tools that make of it my renamer of choice despite not being open-source.

  * winget install -e --id HulubuluSoftware.AdvancedRenamer 
  * choco install advanced-renamer -y 

* **[Bulk Rename Utility](https://www.bulkrenameutility.co.uk/)**: Another batch-renaming software. Like Advanced Renamer, it is free but close-sourced, so in the end is just a matter of personal preference. Both have a similar feature set, although I prefer Advanced Renamer due to its interface being easier on the eyes.

  * winget install -e --id TGRMNSoftware.BulkRenameUtility 
  * choco install bulkrenameutility -y 

* **[dupeGuru](https://dupeguru.voltaicideas.net/)**: A free and [open-source](https://github.com/arsenetar/dupeguru/) software for searching and removing duplicate files.

  * winget install -e --id DupeGuru.DupeGuru 
  * choco install dupeguru -y 

* **[AllDup](https://alldup.info/)**: A free (but close-source) software for searching and removing duplicate files.

  * ~~No WinGet package as of now~~ 
  * choco install alldup -y 

### Hardware-specific Tools

* **[GeForce Experience](https://www.nvidia.com/en-us/geforce/geforce-experience/)**: Nvidia's software to automatically update Nvidia's drivers. It features a few optional extras that some might find useful.

  * winget install -e --id Nvidia.GeForceExperience 
  * choco install geforce-experience -y 

* **[Corsair iCUE](https://www.corsair.com/icue)**: Software to control and update Corsair items' drivers and RGB.  It's got an overlay to check on FPS, clocks and temperatures, but there are other/better alternatives to do so.

  * winget install -e --id Corsair.iCUE.4 
  * choco install icue -y 

* **[Logitech GHub](https://www.logitechg.com/innovation/g-hub.html)**: Software to control and update Logitech items' drivers and RGB. 

  * winget install -e --id Logitech.GHUB 
  * choco install lghub -y 

* **[Garmin Express](https://www.garmin.com/software/express/windows/)**: Garmin's software, useful to manage your Garmin devices and check out your fitness information.

  * winget install -e --id Garmin.Express 
  * choco install garmin-express -y 

* **[TomTom MyDrive Connect](https://www.tomtom.com/mydrive-connect/)**: Software to update and manage your TomTom navigation device.

  * ~~No WinGet package as of now~~ 
  * choco install tomtom-mydrive-connect -y 
  
### The End

The following are but the finishing functions, which are used to notify the user that the installation process has come to an end (prompting for a highly recommended restart).

  * WaitForY 
  * Restart 