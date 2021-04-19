# Pedro Fernandes Filho's PowerShell files

## Installation:

You may need to adjust the execution policy:
````powershell
Set-ExecutionPolicy Bypass
````

````powershell
git clone https://github.com/pedrofernandesfilho/poshfiles.git $HOME\Documents\WindowsPowerShell
cd $HOME\Documents\WindowsPowerShell
git submodule update --init --recursive
. $PROFILE
````

## Update local repository:
````powershell
git pull
git submodule update --init --recursive
. $PROFILE
````

## Actualize submodules to latest commit:
````powershell
git submodule update --recursive --remote
````

## Screenshot

![Windows Terminal](/print.png)<br />
*Windows Terminal*
