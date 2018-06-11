Set-ExecutionPolicy RemoteSigned
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\110\Service\NavAdminTool.ps1'

Get-NAVAppInfo -ServerInstance Privat -Name 'Microsoft Pay Payments'

Uninstall-NAVApp -ServerInstance Privat -Name "Microsoft Pay Payments"
Uninstall-NAVApp -ServerInstance Privat -Name "Payment and Reconciliation Formats (DK)"
Uninstall-NAVApp -ServerInstance Privat -Name "PayPal Payments Standard"
Uninstall-NAVApp -ServerInstance Privat -Name "Payroll Data Import Definitions (DK)"
Uninstall-NAVApp -ServerInstance Privat -Name "Sales and Inventory Forecast"
Uninstall-NAVApp -ServerInstance Privat -Name "Tax File Formats (DK)"

Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\FIK\FIK.app" 
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\ImportDKPayroll\ImportDKPayroll.app"
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\MSWalletPayments\MSWalletPayments.navx"
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\PayPalPaymentsStandard\PayPalPaymentsStandard.navx"
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\SalesAndInventoryForecast\SalesAndInventoryForecast.navx"
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\VATReportsDK\VATReportsDK.app"
Publish-NAVApp -ServerInstance Privat -path "C:\Install\Microsoft Dynamics NAV 2018 DK CU5\Extensions\WorldPayPaymentsStandard\WorldPayPaymentsStandard.navx"

Sync-NAVTenant -ServerInstance Privat 
sync-NAVApp -ServerInstance Privat -Name "Payment and Reconciliation Formats (DK)" -Version 1.0.21836.0
sync-NAVApp -ServerInstance Privat -Name "Payroll Data Import Definitions (DK)" -Version 1.0.21836.0
sync-NAVApp -ServerInstance Privat -Name "Tax File Formats (DK)" -Version 1.0.21836.0


Start-NAVAppDataUpgrade -ServerInstance Privat -Name "Payment and Reconciliation Formats (DK)" -Version 1.0.21836.0
Start-NAVAppDataUpgrade -ServerInstance Privat -Name "Payroll Data Import Definitions (DK)" -Version 1.0.21836.0
Start-NAVAppDataUpgrade -ServerInstance Privat -Name "Tax File Formats (DK)" -Version 1.0.21836.0


install-NAVApp -ServerInstance Privat -Name "Microsoft Pay Payments" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name "Payment and Reconciliation Formats (DK)" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name "PayPal Payments Standard" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name "Payroll Data Import Definitions (DK)" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name "Sales and Inventory Forecast" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name "Tax File Formats (DK)" -Version 1.0.21836.0
install-NAVApp -ServerInstance Privat -Name BAC_Tilretninger 

UnPublish-NAVApp -ServerInstance Privat -Name "Microsoft Pay Payments" -Version 1.0.20348.0
UnPublish-NAVApp -ServerInstance Privat -Name "Payment and Reconciliation Formats (DK)" -Version 1.0.20348.0
UnPublish-NAVApp -ServerInstance Privat -Name "PayPal Payments Standard" -Version 1.0.20348.0
UnPublish-NAVApp -ServerInstance Privat -Name "Payroll Data Import Definitions (DK)" -Version 1.0.20348.0
UnPublish-NAVApp -ServerInstance Privat -name "Sales and Inventory Forecast" -Version 1.0.20348.0
UnPublish-NAVApp -ServerInstance Privat -Name "Tax File Formats (DK)" -Version 1.0.20348.0

