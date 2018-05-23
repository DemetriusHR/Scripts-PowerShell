cls
Import-Module WebAdministration -force
function New-Site
{

  $port = 100;
  $name = "Packge_Teste";
  $siteExist = Get-Website $name
  
  IF ($siteExist){
    
    Remove-Website $name
  
  }
  
  $caminho = Get-ItemPropertyValue -Path HKLM:\Software\Microsoft\INetStp -Name "PathWWWRoot";
  New-Website -Name "$name" -ApplicationPool $name -Port $port -PhysicalPath "$caminho\" -force
 
}

function New-Pool
{
  
  $name = "Packge_Teste";
  $pathPool = "IIS:\AppPools";
  
  IF (Test-Path $pathPool\$name){
  
    Remove-WebAppPool -Name $name
  
  }
  
  New-Item -Path "$pathPool" -Name "$name" -Type AppPool -force
  Set-ItemProperty -Path "$pathPool\$name" -name "managedRuntimeVersion" -value "v4.0" -force

}

function Extract-Run
{
  
  $cd = Get-Location
  Remove-Item    -Path $cd\Package_Teste -Force -Recurse
  Expand-Archive -Path "$cd\Package_Teste.zip" -DestinationPath "$cd"
  Remove-Item    -Path $cd\server -Exclude server -Force -Recurse
  Expand-Archive -Path "$cd\server.zip" -DestinationPath "$cd"
  cd .\Package_Teste
  Start-Process dotnet .\Package_Teste.dll
  cd $cd

}

New-Site
New-Pool
Extract-Run