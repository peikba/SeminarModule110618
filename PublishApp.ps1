Set-ExecutionPolicy RemoteSigned
# Import the module for the  cmdLet
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\110\Service\NavAdminTool.ps1'
# Publish app to database
Publish-NAVApp -ServerInstance DynamicsNAV110 -Path "C:\Users\Admin\Desktop\D. E. Veloper_Seminar Module_2.0.0.0.app" -SkipVerification
# Install in tenant
Install-NAVApp -ServerInstance DynamicsNAV110 -Name "Seminar Module"
# Uninstall the app - Delete the data
Uninstall-NAVApp  -ServerInstance DynamicsNAV110 -Name "Seminar Module" -DoNotSaveData 
# Remove the app from the database - but keep the tables
Unpublish-NAVApp -ServerInstance DynamicsNAV110 -Name "Seminar Module" 
# Synchronize the objekts in theh tenant
Sync-NAVTenant -ServerInstance DynamicsNAV110
# Remove the tables if the app is gone
Sync-NAVApp -ServerInstance DynamicsNAV110 -Name "Seminar Module" -Mode Clean