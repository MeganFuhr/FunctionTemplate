Some-Function {
    #Allows use of advanced function items like verbose
    [CmdletBinding()] 

    ##Create Parameters
    Param (
        #Paremeter example
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)] 
        [ValidateScript({Test-Path $_})] 
        [String] $Key = ‘HKLM:\Software\DoesNotExist’,   ## use a comma after each parameter with the exception of the final parameter

        #Paremeter example
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)] 
        [ValidateScript({Test-Path $_})] 
        [String] $ComputerName = ‘HKLM:\Software\DoesNotExist’,
        
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)] 
        #Test if path exists
        [ValidateScript({
            if (-not (Test-Path -Path $_ -PathType Container)) 
                {
                    throw "The Folder [$_] does not exist.  Try another."
                }
                else 
                {
                    $true
                }
               })] 
        #Ensure folder is on C drive
        [ValidatePattern('^C:\\')]
        [string]$path = 'C:\SomeBogusFolder',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('1','4','8')]
        [int]$generation

            
    )

    ##Parameter options
        #[Parameter()]
        #ValueFromPipeline
        #ValueFromPipelineProperty

        #ValidateSet
        #ValidateScript {Test-Path, Test-Connection,....}
        #ValidatePattern
        #ValidateRange
        #ValidateCount
        #ValidateNotNull Mandatory required for validation
        #ValidateNotNullOrEmpty  Mandatory required for validation
        #AllowNull  Cannot use Mandatory required for validation

        #Mandatory

        #Paramater Sets
            #[Parameter(Mandatory, ParameterSet = 'ByName')]
            #[ValidateCount(1,5)]
            #[string] $Name,
                       
            #[Parameter(Mandatory, ParameterSet = 'ByID')]
            #[ValidateNotNullOrEmpty()]
            #[string] $ID,



        #[string[]]
        #[int]
        #[int32]
        #[pscustomobject]


       #Begin runs the contents of the block once.  Perfect for single create of a file, help functions that only need to be put into memory once... etc.
        begin {
            try {
             asnp Citrix.* -ErrorAction SilentlyContinue
             }
             catch {}
           Write-Verbose -Message 'Beginning to process pipeline objects...'
        }

        #Process will run against all items in the pipleine.
        process {

               Write-Verbose -Mesage "Processing pipeline object representing object [$($InputObject.Name)]..."
               #Input is a reserved keyword representing whatever is currently in the pipeline.
               #Only applicable in the PROCESS block, type depending on where used. Not recommended.
               $input

        }

        end {
            #End runs once at the very end
                #Common Uses
                #Removing Powershell sessions to be used for all pipeline objects
                #Removing temporary files
                #closing database connections
            Write-Verbose -Message 'The function has completed processing all pipeline objects.'
        }

}

#Drill down into parameters
(Get-Command -Name 'Get-Content').Parameters.Path.Attributes
