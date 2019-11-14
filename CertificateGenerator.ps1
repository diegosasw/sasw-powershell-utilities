function CreateCertificate
{
	Param(
	 [Parameter(Mandatory=$true)]
	 [string]$certificateName,
	 [Parameter(Mandatory=$true)]
	 [string]$certificatePassword,
	 [Parameter(Mandatory=$false)]
	 [Int]$expirationInYears=20
	)

	$pfxFilePath = $certificateName + ".pfx"
	$cerFilePath = $certificateName + ".cer"

	$certStartDate = Get-Date
	$certEndDate = $certStartDate.AddYears($expirationInYears)
	
	$certPasswordSecureString = ConvertTo-SecureString $certificatePassword -AsPlainText -Force

	$cert = New-SelfSignedCertificate -DnsName $certificateName -CertStoreLocation cert:\CurrentUser\My -KeySpec KeyExchange -NotAfter $certEndDate -NotBefore $certStartDate
	$certThumbprint = $cert.Thumbprint
	$cert = (Get-ChildItem -Path cert:\CurrentUser\My\$certThumbprint)
	Export-Certificate -Cert (Get-ChildItem -Path cert:\CurrentUser\My\$certThumbprint) -FilePath $cerFilePath
	Export-PfxCertificate -Cert $cert -FilePath $pfxFilePath -Password $certPasswordSecureString
}

CreateCertificate