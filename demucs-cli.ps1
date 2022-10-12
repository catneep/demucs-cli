param (
	$input_file,
	$output_dir,
    $model = "mdx",
	[switch] $mp3,
	[switch] $open
)

# System parameters
$conda_location = "C:/tools/Anaconda3"
$conda_hook = "C:/tools/Anaconda3/shell/condabin/conda-hook.ps1"
$dm_location = "C:/tools/demucs/demucs-main"

if (
    !(Test-Path -Path $input_file) -Or
    !($input_file -match ".mp3" -Or $input_file -match ".wav" -Or $input_file -match ".flac")
) {
    throw "'$input_file' is not a valid input file"
} else {
    $input_file = Resolve-Path $input_file
}

$current_location = Get-Location

# Use input directory if output is null/invalid
if ((!$output_dir) -Or !(Test-Path -Path $output_dir)){
    Write-Host "Invalid/Empty output directory, using input directory instead" -ForegroundColor DarkYellow
	$output_dir = Split-Path $input_file
} else {
    $output_dir = Resolve-Path $output_dir
}

# Turn current shell into conda prompt
. $conda_hook

# Activate demucs' environment
conda activate $conda_location
Set-Location $dm_location
conda activate demucs

if ($mp3){
	demucs $input_file -n $model --out $output_dir --mp3
} else {
	demucs $input_file -n $model --out $output_dir
}

if ($open){
    Set-Location $output_dir
	explorer .
}

# Deactivate conda
conda deactivate
conda deactivate
Set-Location $current_location

Write-Host "Files at $output_dir" -ForegroundColor DarkYellow
Write-Host "Done :)" -ForegroundColor Blue
