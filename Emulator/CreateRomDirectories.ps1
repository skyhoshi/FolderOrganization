
[System.Collections.Generic.List[String]]$CharDirectories = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#'.ToCharArray()
[System.Collections.Generic.List[String]]$NamedDirectories = "Adult Only", "Compliation Disks", "# Unsorted";
[System.Collections.Generic.List[String]]$FullDirectories = New-Object "System.Collections.Generic.List[String]";

foreach ($dirName in $CharDirectories) { $FullDirectories.Add($dirName) }
foreach ($dirName in $NamedDirectories) { $FullDirectories.Add($dirName) }

function Create-SortDirectories {
    [CmdletBinding()]
    param (
        [System.Collections.Generic.List[String]]$directoriesToCreate 
    )
    
    begin {
        
    }
    
    process {
        $directoriesToCreate.Clear();
        foreach ($d in $directoriesToCreate) {
            New-Item $d -
        }
    }
    
    end {
        
    }
}



