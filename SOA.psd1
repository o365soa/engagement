﻿#
# Module manifest for module 'SOA'
#
# Generated by: Microsoft
#
# Generated on: 09/03/2021
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '3.1.6'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '2180f862-26aa-449a-bdbd-9217a448b159'

# Author of this module
Author = 'Microsoft'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2021 Microsoft. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Scripts required for the SOA Delivery'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# Required modules removed - when in place, prereq script cannot update these -Cam M
#RequiredModules = @(
#    @{
#        ModuleName = "AzureADPreview"; 
#        ModuleVersion = "2.0.2.53"; 
#    },
#    @{
#        ModuleName = "Microsoft.Online.SharePoint.PowerShell";
#        ModuleVersion = "16.0.19404.12000";
#    },
#    @{
#        ModuleName = "SharePointPnPPowerShellOnline";
#        ModuleVersion = "3.14.1910.0";
#    },
#    @{
#        ModuleName = "MSOnline";
#        ModuleVersion = "1.1.183.17";
#    }   
#)

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @("SOA-Prerequisites.psm1","SOA-ImportExport.psm1")

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @("Install-SOAPrerequisites","Test-SOAApplication","Invoke-SOAVersionCheck","Export-SOARPS","Get-LicenseStatus","Import-MSAL","Get-MSALAccessToken","Reset-SOAAppSecret","Remove-SOAAppSecret","Reset-SOAAppSecretv2","Remove-SOAAppSecretv2")

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
#ModuleList = @("")

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

