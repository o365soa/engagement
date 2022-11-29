# Office 365 SOA Prerequisites

## Introduction

The Office 365 Security Optimization Assessment toolset has several prerequisites that need to be installed or configured. The tool runs in PowerShell, and connects to various Microsoft 365 services.

## Prerequisite Breakdown

Prerequisite installation is simplified by the use of a PowerShell prerequisite script

The following prerequsites are installed, or updated by the prerequisite installation script:
* Azure AD MSOnline (v1) PowerShell module
* Azure AD (v2) Preview PowerShell module
* Exchange Online (v2) PowerShell module
* SharePoint Online PowerShell module
* Microsoft Teams PowerShell module
* Power Apps admin PowerShell module
* Active Directory PowerShell module

The following prerequisites are removed
* SharePoint Online PowerShell module - if manually installed, this is removed from your PS Module Path to prevent conflicts
* Azure AD (Non-preview) module - conflicts with the required Azure AD Preview module

An Azure AD application is also installed in your tenant. For more information on this see below.

## Prerequisite Script

### Requirements

In order to install the module and run the prerequisite script, you must have:
* Local Admin access to the workstation that you will perform the collection from
* PowerShell Gallery access configured (Automatically configured on PowerShell 5, which is standard on Windows 10)
* PowerShellGet version 2.2.4 or higher
   * As of April 2020, PowerShell Gallery supports only TLS 1.2.  While PowerShell and Windows support TLS 1.2, in some proxy environments the proxy server might negotiate a lower version, which will cause a Resource Unavailable error when attempting to install any module from PowerShell Gallery.  PowerShellGet 2.2.4 works around this issue by temporarily forcing TLS 1.2 when installing any module from PowerShell Gallery and then changing back to the OS default.  If at least PowerShellGet 2.2.4 is not installed, run the following to install the latest version:
   
      `Install-Module PowerShellGet`

### Permissions needed to run the prerequisites

1. The prerequisites require an account with the **Global Administrator** role. 

### Running the prerequisite script

1. Load a PowerShell prompt as administrator (this is important, in order to update/install modules)
2. Run the following (which will install the latest module from Powershell Gallery):

   `Install-Module SOA`

3. Run the following to install the prerequisites (see below for optional parameters that may be applicable):

   `Install-SOAPrerequisites`

### Collection machine

The script must be run from the machine that you will use to perform the collection as part of the engagement. Please consider the following:
* The machine should not be a production server, as the pre-requisite script may cause a reboot during installation of modules.
* You are require to be logged on as a local administrator.

### Custom (vanity) SharePoint Online domain

If you use a custom domain to connect to the SharePoint Online admin endpoint (such as a multi-tenant enhanced organization), you need to specify the domain using the SPOAdminDomain parameter, or the connection test to SPO will fail.

### Requiring a proxy

We recommend that traffic routing to Microsoft 365 bypasses proxy infrastructure, and this script needs connectivity to the PowerShell Gallery, as well.

If a proxy is required, try running with `-UseProxy`.

### Sovereign Clouds

When preparing for an assessment of a Microsoft 365 tenant in a sovereign cloud environment, the `-O365EnvironmentName` parameter should be used. The default value is `Commercial` which does not need to be specified, and can be used for standard Commercial and Government Community Cloud (GCC) tenants.

* Use `USGovGCC` for Microsoft Cloud for US Government (GCC\GCC-Moderate)
* Use `USGovGCCHigh` for Microsoft Cloud for US Government L4 (GCC-High)
* Use `USGovDoD` for Microsoft Cloud for US Government L5 (DOD)
* Use `Germany` for Microsoft Cloud Germany
* Use `China` for Azure and Microsoft 365 operated by 21Vianet in China

## Azure AD application

An Azure AD Application is required in order to perform API calls to Microsoft Graph and, if applicable, Microsoft 365 Defender. Installation of this application is performed by the prerequisite script. There are some things, however, that you should be aware of:

The scope of this application is limited to the following:
* **SecurityEvents.Read.All** (This scope allows SOA to read active security events within your tenant from Microsoft Graph.)
* **IdentityRiskyUser.Read.All** (This scope allows SOA to look at identity risk events raised by Azure Identity Protection.)
* **IdentityRiskEvent.Read.All** (This scope allows SOA to look at identity risk events raised by Azure Identity Protection.)
* **DeviceManagementConfiguration.Read** (This scope allows SOA to read your Intune configuration policies, if applicable.)
* **AuditLog.Read.All** (This scope allows SOA to get sign-in activity for user and guest accounts.)
* **Directory.Read.All** (This scope allows SOA to get sign-in activity for user and guest accounts.)
* **Policy.Read.All** (This scope allows SOA to get your authorization and conditional access policies.)
* **Incident.Read.All** (This scope allows SOA to get your Defender security incidents.)

### Azure AD application security

Being a security-related assessment, we are conscious of the security of the Azure AD application created for it, which is why the following security considerations are made:
* Azure AD applications are scoped only to certain activities, and the scopes for this application are documented above. Scopes are used only when they are required, and the assessment follows a least-privilege model. All scopes are read-only and specific to configuration settings, not access to any user content.
* The Azure AD application client secret (essentially, a password) is randomly generated by Azure AD on creation (for validating the installation) and configured to expire after 48 hours.
* Another client secret, also configured to expire after 48 hours, is generated on the day of the collection to get the necessary data.
* The Azure AD application secret is stored only in memory during the execution of the prerequisite installation script and the data collection script. (It is never stored in a file.)

### Removal of Azure AD application

You can remove the Azure AD application at the conclusion of the engagement. This is not considered necessary, as the application has only a short-lived secret and cannot be used without a valid secret. It is important, however, that you **do not** remove the Azure AD application prior to the conclusion of the engagement.

## Log Analytics upload

When running a Security Optimization Assessment, customers can opt to have their remediation planning results uploaded to Log Analytics (to keep historic data). The Export-SOARPS command in this module is used with this **optional** service.
