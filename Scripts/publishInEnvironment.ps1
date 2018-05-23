Clear-Host
#Variaveis
$boletosApi      = 'server\src\Boletos.Api';
$ConsorciadosApi = 'server\src\Consorciados.Api';
$CotasApi        = 'server\src\Cotas.Api';
$GruposApi       = 'server\src\Grupos.Api';
$caminhoProd     = 'publish\APIs\PROD';
$caminhoDev      = 'publish\APIs\DES';
$caminhoHom      = 'publish\APIs\HOM';

Write-Host '------------------------------------------' -ForegroundColor Cyan
Write-Host '-      Qual ambiente deseja montar?      -' -ForegroundColor Cyan
Write-Host '------------------------------------------' -ForegroundColor Cyan
Write-Host '-  [1] - Produção                        -' -ForegroundColor Cyan
Write-Host '-  [2] - Homologação                     -' -ForegroundColor Cyan
Write-Host '-  [3] - Desenvolvimento                 -' -ForegroundColor Cyan
Write-Host '-  [0] - Sair                            -' -ForegroundColor Cyan
Write-Host '------------------------------------------' -ForegroundColor Cyan

$opcao = Read-Host -Prompt ('Digite sua Opção: ')

Clear-Host

SWITCH ($opcao)
{
  
  1 
  {
    
    #Verifica a existência de um publish de Produção
    IF (Test-Path .\$caminhoProd){
    
      Remove-Item -Path .\$caminhoProd -Force -Recurse
    
    }
    
    #Verifica a existência de um zip de Produção
    IF(Test-Path .\publish\APIs\Producao.zip){
    
      Remove-Item -Path .\publish\APIs\Producao.zip -Force -Recurse
    
    }
    
    #Cria um pasta para se armazenar os Zips criados posteriormente
    New-Item -Path .\$caminhoProd\Zips -ItemType Directory
    Clear-Host
    
    $cd = Get-Location
    $locationCreate = "$caminhoProd/AutoAtendimento_Boletos";
    
    #Publish em BoletosAPI
    dotnet publish $boletosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Production.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Producao_ApiBoletos_Itau.zip -Path .\AutoAtendimento_Boletos
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoProd/AutoAtendimento_Consorciados";
    
    #Publish em ConsorciadosAPI
    dotnet publish $ConsorciadosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Production.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Producao_ApiConsorciados_Itau.zip -Path .\AutoAtendimento_Consorciados
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoProd/AutoAtendimento_Cotas";
    
    #Publish em CotasAPI
    dotnet publish $CotasApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Production.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Producao_ApiCotas_Itau.zip -Path .\AutoAtendimento_Cotas
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoProd/AutoAtendimento_Grupos";
    
    #Publish em CotasAPI
    dotnet publish $GruposApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Production.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Producao_ApiGrupos_Itau.zip -Path .\AutoAtendimento_Grupos
    Set-Location -Path $cd
    
    #Formando um Pacote só de Produção
    Compress-Archive -DestinationPath $cd\publish\APIs\Producao.zip -Path $cd\$caminhoProd\Zips, $cd\server\docs\deploy\ScriptsProd
    
    Clear-Host
    Write-Host 'Ambiente de Produção Criado!' -ForegroundColor Green
    break
  
  }
  
  2 
  {
  
    #Verifica a existência de um publish de Homologação
    IF (Test-Path .\$caminhoHom){
    
      Remove-Item -Path .\$caminhoHom -Force -Recurse
    
    }
    
    #Verifica a existência de um zip de Homologação
    IF(Test-Path .\publish\APIs\Homologacao.zip){
    
      Remove-Item -Path .\publish\APIs\Homologacao.zip -Force -Recurse
    
    }
    
    #Cria um pasta para se armazenar os Zips criados posteriormente
    New-Item -Path .\$caminhoHom\Zips -ItemType Directory
    Clear-Host
    
    $cd = Get-Location
    $locationCreate = "$caminhoHom/AutoAtendimento_Boletos";
    
    #Publish em BoletosAPI
    dotnet publish $boletosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Staging.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Homologacao_ApiBoletos_Itau.zip -Path .\AutoAtendimento_Boletos
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoHom/AutoAtendimento_Consorciados";
    
    #Publish em ConsorciadosAPI
    dotnet publish $ConsorciadosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Staging.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Homologacao_ApiConsorciados_Itau.zip -Path .\AutoAtendimento_Consorciados
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoHom/AutoAtendimento_Cotas";
    
    #Publish em CotasAPI
    dotnet publish $CotasApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Staging.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Homologacao_ApiCotas_Itau.zip -Path .\AutoAtendimento_Cotas
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoHom/AutoAtendimento_Grupos";
    
    #Publish em CotasAPI
    dotnet publish $GruposApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Staging.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Homologacao_ApiGrupos_Itau.zip -Path .\AutoAtendimento_Grupos
    Set-Location -Path $cd
    
    #Formando um Pacote só de Homologação
    Compress-Archive -DestinationPath $cd\publish\APIs\Homologacao.zip -Path $cd\$caminhoHom\Zips, $cd\server\docs\deploy\ScriptsHom
    
    Clear-Host
    Write-Host 'Ambiente de Homologação Criado!' -ForegroundColor Green
    break
  
  }
  
  3 
  {
  
    #Verifica a existência de um publish de Desenvolvimento
    IF (Test-Path .\$caminhoDev){
    
      Remove-Item -Path .\$caminhoDev -Force -Recurse
    
    }
    
    #Verifica a existência de um zip de Desenvolvimento
    IF(Test-Path .\publish\APIs\Desenvolvimento.zip){
    
      Remove-Item -Path .\publish\APIs\Desenvolvimento.zip -Force -Recurse
    
    }
    
    #Cria um pasta para se armazenar os Zips criados posteriormente
    New-Item -Path .\publish\APIs\DES\Zips -ItemType Directory
    Clear-Host
    
    $cd = Get-Location
    $locationCreate = "$caminhoDev/AutoAtendimento_Boletos";
    
    #Publish em BoletosAPI
    dotnet publish $boletosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Development.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Desenvolvimento_ApiBoletos_Itau.zip -Path .\AutoAtendimento_Boletos
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoDev/AutoAtendimento_Consorciados";
    
    #Publish em ConsorciadosAPI
    dotnet publish $ConsorciadosApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Development.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Desenvolvimento_ApiConsorciados_Itau.zip -Path .\AutoAtendimento_Consorciados
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoDev/AutoAtendimento_Cotas";
    
    #Publish em CotasAPI
    dotnet publish $CotasApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Development.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Desenvolvimento_ApiCotas_Itau.zip -Path .\AutoAtendimento_Cotas
    Set-Location -Path $cd
    
    $cd = Get-Location
    $locationCreate = "$caminhoDev/AutoAtendimento_Grupos";
    
    #Publish em CotasAPI
    dotnet publish $GruposApi --output ../../../$locationCreate --verbosity minimal -c Release
    Set-Location -Path $locationCreate
    
    #Validando o appsettings e adicionando em zip o publish
    Get-Content .\appsettings.Development.json | Out-File .\appsettings.json
    Remove-Item -Path .\appsettings.*.json -Force
    Set-Location -Path ..
    Compress-Archive -DestinationPath .\Zips\Pacote_Instalacao_Desenvolvimento_ApiGrupos_Itau.zip -Path .\AutoAtendimento_Grupos
    Set-Location -Path $cd
    
    #Formando um Pacote só de Desenvolvimento
    Compress-Archive -DestinationPath $cd\publish\APIs\Desenvolvimento.zip -Path $cd\$caminhoDev\Zips
    
    Clear-Host
    Write-Host 'Ambiente de Desenvolvimento Criado!' -ForegroundColor Green
    break
  
  }
  
  default 
  {
  
    Clear-Host
    break
  
  }
  
}