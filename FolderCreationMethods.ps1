<#
Methods for Creating folder structure
#>

#GlobalProperties
$RootFolders = @{
    PictureFolderRoot = "$env:OneDriveConsumer/Pictures/"
    DocumentFolderRoot = "$env:OneDriveConsumer/Documents/"
}

function Initialize-FolderOrganizationDependancies{
    . "C:\Users\marcus\OneDrive\Scripts\Powershell\Profiles\Scripts\PersonalDebugModule\Log.ps1"
}

function New-PictureFolder{
    Initialize-FolderOrganizationDependancies
    if (!(Test-Path -Path $RootFolders.PictureFolderRoot+"By Date/")){
        Write-Message "Folder was found";
    }
    # By Date
    # YYYY - year
    # ## - MMM - Month 01 - JAN
    # ## -  is Holiday : Name Of Holiday ? "" - Day of the Month which includes the name of the given holiday (National Holiday https://www.opm.gov/policy-data-oversight/pay-leave/federal-holidays/#url=2020)
    # Special Organization Folders Created By End User
}
# New-PictureFolder
function New-OrganizeFoldersMonths() {
    Initialize-FolderOrganizationDependancies
    @(1 .. 12) | ForEach-Object {
        $folderNumString = '{0:d2}' -f $_
        $monthName = "";
        switch ($_) {
            { $_ -eq 1 } { $monthName = "JAN"; }
            { $_ -eq 2 } { $monthName = "FEB"; }
            { $_ -eq 3 } { $monthName = "MAR"; }
            { $_ -eq 4 } { $monthName = "APR"; }
            { $_ -eq 5 } { $monthName = "MAY"; }
            { $_ -eq 6 } { $monthName = "JUN"; }
            { $_ -eq 7 } { $monthName = "JUL"; }
            { $_ -eq 8 } { $monthName = "AUG"; }
            { $_ -eq 9 } { $monthName = "SEP"; }
            { $_ -eq 10 } { $monthName = "OCT"; }
            { $_ -eq 11 } { $monthName = "NOV"; }
            { $_ -eq 12 } { $monthName = "DEC"; }
            Default { $monthName = ""; }
        }
        $folderString = "$folderNumString - $monthName";
        if (!(Test-Path -Path "./$folderString")) {
            Write-Host "Creating ./$folderString"
            New-Item -ItemType Directory -Path ./$folderString
        }
        #Write-Host $folderString;
    }
<#
.SYNOPSIS

Creates a folder in '## - MMM' Format for each month of the year

.DESCRIPTION

Creates a folder in '## - MMM' Format for each month of the year

.INPUTS

None. You cannot pipe objects to New-OrganizeFoldersMonths.

.OUTPUTS

Creates New Directories with the month information as the name of the folder.


.EXAMPLE

PS> New-OrganizeFoldersMonths

.LINK

https://github.com/skyhoshi/FolderOrganization

#>
}
New-OrganizeFoldersMonths
function New-DaysOfMonth {
    Initialize-FolderOrganizationDependancies
    
    
}