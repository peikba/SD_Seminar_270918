Set-ExecutionPolicy RemoteSigned
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\110\Service\NavAdminTool.ps1'

Get-NAVAppInfo -ServerInstance DynamicsNAV110 -Name 'SD Seminar'
Uninstall-NAVApp -ServerInstance DynamicsNAV110 -Name "Microsoft Pay Payments"
Publish-NAVApp -ServerInstance DynamicsNAV110 -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\FIK\FIK.app" 
Sync-NAVTenant -ServerInstance DynamicsNAV110 
sync-NAVApp -ServerInstance DynamicsNAV110 -Name "SD Seminar" -Version 1.0.0.0

Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV110 -Name "SD Seminar" -Version 1.0.0.1
install-NAVApp -ServerInstance DynamicsNAV110 -Name "Microsoft Pay Payments" -Version 1.0.21836.0
UnPublish-NAVApp -ServerInstance DynamicsNAV110 -Name "SD Seminar" -Version 1.0.0.1

