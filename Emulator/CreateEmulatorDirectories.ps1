#$itemsList = ("4DO", "Demul", "Dolphin", "ePSXe", "FCEUX", "Kega_Fusion", "MAME", "mupen64", "Nestopia", "nullDC", "PCSX_Reloaded", "PCSX2", "Project64", "Project64_1_6", "Redream", "RetroArch", "Sega_Model_2_Emulator", "Snes9x", "VisualBoyAdvance_M");
class Emulator {
    [string] $EmulatorName;
    [string] $SearchUri;
    [string] $EmulatorDownloadUri;
    [string] $Version;

    Emulator([string] $emuName, [string] $emuDownloadUri, [string]$emuVersion) {
        $this.EmulatorDownloadUri = $emuDownloadUri;
        $this.EmulatorName = $emuName;
        $this.Version = $emuVersion;
    }

}
Set-Location -Path "I:\Non-Game Installers\Emulators\"
#Set-Location -Path K:\
[System.Collections.Generic.List[Emulator]] $Emulators = [System.Collections.Generic.List[Emulator]]::new();

$downloadLinks = @(
    [Emulator]::new("4DO", "", ""),
    [Emulator]::new("Demul", "", "" ),
    [Emulator]::new("Dolphin", "", "" ),
    [Emulator]::new("ePSXe", "http://www.epsxe.com/files/ePSXe205.zip", "205" ),
    [Emulator]::new("FCEUX", "",""),# "http://sourceforge.net/projects/fceultra/files/Binaries/2.6.1/fceux-2.6.1-win32.zip/download", "2.6.1" ),
    [Emulator]::new("Kega_Fusion", "https://www.carpeludum.com/download/Fusion364.zip", "364" ),
    [Emulator]::new("MAME", "", "" ),
    [Emulator]::new("mupen64", "",""),#"https://github.com/mupen64plus/mupen64plus-core/releases/download/2.5.9/mupen64plus-bundle-win32-2.5.9.zip", "2.5.9" ),
    [Emulator]::new("Nestopia","",""),# "https://sourceforge.net/projects/nestopia/files/Nestopia/v1.40/Nestopia140bin.zip/download", "140" ),
    [Emulator]::new("nullDC", "", "" ),
    [Emulator]::new("PCSX_Reloaded", "", "" ),
    [Emulator]::new("PCSX2", "https://pcsx2.net/download/releases/windows.html?task=download.send&id=124&catid=40&m=0", "" ),
    [Emulator]::new("Project64", "", "" ),
    [Emulator]::new("Project64_1_6", "", "" ),
    [Emulator]::new("Redream", "", "" ),
    [Emulator]::new("RetroArch", "", "" ),
    [Emulator]::new("Sega_Model_2_Emulator", "", "" ),
    [Emulator]::new("Snes9x", "", "" ),
    [Emulator]::new("VisualBoyAdvance_M", "", "")
);


function New-EmulatorSearchUri {
    [CmdletBinding()]
    param (
        #List of [Emulator] Class Objects to Adjust.
        [Parameter()]    
        [System.Collections.Generic.List[Emulator]] $Emulators
    )
    
    begin {
        
    }
    
    process {
        foreach ($emu in $Emulators) {
            $uri = "https://www.bing.com/search?q=$($emu.EmulatorName)+Emulator"
           $emu.SearchUri = $uri;
        }
    }
    
    end {
        
    }
}

function New-EmulatorFolder {
    [CmdletBinding()]
    param (
        #List of [Emulator] Class Objects to Adjust.
        [Parameter()]    
        [System.Collections.Generic.List[Emulator]] $Emulators
    )
    
    begin {
        
    }
    
    process {
        foreach ($emu in $Emulators) {
            $uri = "https://www.bing.com/search?q=$($emu)+Emulator"
            $uri;
            if (!(Test-Path $emu)) {
                New-item -Path $emu -ItemType Directory;
            }                
        }
    }
    
    end {
        
    }
}
foreach ($item in $downloadLinks) {
    $Emulators.Add($item);
};
New-EmulatorSearchUri -Emulators $Emulators;

$Emulators;
#Write-Host "$($Emulators)";
Write-Host "$($Emulators.GetType())";
#Write-Host "$($itemslist.GetType().ToString())";
return;
