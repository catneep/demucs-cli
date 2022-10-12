# demucs-cli
 A simple Powershell CLI wrapper for demucs, aimed towards Windows systems.

 ## Requirements
 - Install [Conda](https://docs.conda.io/en/latest/) locally
- Clone and configure [demucs](https://github.com/facebookresearch/demucs) for your system

The script should work with every version of PowerShell greater than 5.1, this being the default for Windows 10 and 11.

## Local parameters
The script depends on variables that contain the location to various files and directories that may vary depending on your system, you can edit them by following these steps:

- Clone this repository with:

        git  clone https://github.com/catneep/demucs-cli

- Open the `demucs-cli.ps1` file with a text editor
- Editing the variables under the `# System parameters` comment as follows:

    - **$conda_location**: The parent directory for your local conda installation
    - **$conda_hook**: The location for the `conda-hook.ps1` script within your conda install
    - **$dm_location**: Your local `demucs` directory

You may also set these values to environment variables pointing to the above locations.

## Usage
Syntax:

    demucs-cli {input_file} {output_dir} -model {model} -open -mp3

Where:

- **input_file**: The file to separate
- **output_dir**: Where to save the output
- **model**: The separation model to use [*(see here)*](https://github.com/facebookresearch/demucs#separating-tracks)
- **mp3**: Whether to save the output as .mp3 files instead of .wav
- **open**: Open the containing directory after processing

Example:

    demucs-cli './my_file.mp3' E:/User/Music -open

### Notes
- You can also add this project's location to your local PATH variable in order to use it globally
