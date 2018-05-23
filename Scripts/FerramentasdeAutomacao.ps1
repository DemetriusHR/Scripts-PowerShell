function Pesquisa-Google
{
  Param([string] $PesquisaGoogle)
    
    Process
    {
    
      Start-Process https://www.google.com.br/search?q=$PesquisaGoogle
    
    }
}
 
 
function Pesquisa-Youtube
{
  Param([string] $PesquisaYoutube)
  
  Process
  {
  
    Start-Process https://www.youtube.com/results?search_query=$PesquisaYoutube
  
  }
  
}

function Pesquisa-Microsoft
{
  Param([string] $PesquisaMicrosoft)
  
  Process
  {
  
    Start-Process https://docs.microsoft.com/pt-br/search/index?search=$PesquisaMicrosoft
  
  }
  
}

function OiWithVS 
{
  Param([string] $PesquisaMicrosoft)
  
  Process
  {
    Start-Process 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe'
    Start-Process 'C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe'
    Start-Process chrome.exe
  }
  
}

function OiWithVSCode 
{
  Param([string] $PesquisaMicrosoft)
  
  Process
  {
    Start-Process 'C:\Program Files\Microsoft VS Code\Code.exe'
    Start-Process 'C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe'
    Start-Process chrome.exe
  }
  
}

function OiWithAll
{
  Param([string] $PesquisaMicrosoft)
  
  Process
  {
    Start-Process 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe'
    Start-Process 'C:\Program Files\Microsoft VS Code\Code.exe'
    Start-Process 'C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe'
    Start-Process chrome.exe
  }
  
}

function Tchau
{
  
  Process
  {
  
    rundll32.exe user32.dll,LockWorkStation
    shutdown -s -t 600
  
  }
  
}
