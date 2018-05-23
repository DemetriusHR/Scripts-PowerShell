function Verifica-CPF
{
  [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $CPF
    )
    
    Process{
      $verifica = 1
      $auxilia = 10
      $CPF_Compare = $CPF.Substring(0,9)
      WHILE($verifica -le 2)
      {
        $Calc = 0
        $Cont = 0
        
          WHILE($auxilia -ge 2)
          {
          
            $num = [int]($CPF_Compare.Substring($Cont,1))
            $Calc = $Calc + ($num * $auxilia)
            $auxilia = $auxilia - 1
            $Cont = $Cont + 1
          
          }
          
        $Calc = 11 - ($Calc % 11)
          IF($Calc -ge 10 -or $Calc -le 0)
          {
          
            $num = 0
          
          }
          ELSE 
          {
          
            $num = $Calc
          
          }
        
        $CPF_Compare = $CPF_Compare + [string]$num
        $verifica = $verifica + 1
        $auxilia = 11
        $Cont = 1
      
      }
      
    }
    End{
      
      IF($CPF_Compare -eq $CPF)
      {
      
        return "CPF Válido"
      
      }
      else{
      
        return "CPF Inválido"
      
      }
    }
}

function Verifica-CNPJ
{
  [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $CNPJ
    )
    
    Process{
      $verifica = 0
      $auxilia  = 5
      $CNPJ_Compare = $CNPJ.Substring(0,12)
      $confere = "N"
      WHILE($verifica -le 1)
      {
      
        $Cont = 0
        $calc = 0
        $num_Temp = 0
      
        WHILE ($auxilia -ge 2)
        {
            $num_Temp = [int]($CNPJ_Compare.Substring($Cont, 1))
            $calc = $calc + ($num_Temp * $auxilia)
            $auxilia = $auxilia - 1 
            $Cont = $Cont + 1
          IF ($confere -eq "N" -and $auxilia -like 1)
          {
            
            $confere = "S"
            $auxilia = 9
          }
      
        }
        $calc = 11 - ($calc % 11)
        
        IF($calc -ge 10 -or $calc -le 0)
        {
      
          $num_Temp = 0
      
        }
        ELSE
        { 
      
          $num_Temp = $calc
          
        }
        $CNPJ_Compare = $CNPJ_Compare + [string]$num_Temp
        $verifica = $verifica + 1
        $auxilia = 6
        $confere = "N"
      
      } 
    }
    
    End
    {
        IF ($CNPJ -eq $CNPJ_Compare)
        {
          return "CNPJ Válido"
        
        }
        ELSE
        {
        
          return "CNPJ Inválido"
        
        }
    }
}