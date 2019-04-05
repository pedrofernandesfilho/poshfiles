# Pedro Fernandes Filho's PowerShell files

Installation:
````powershell
git clone https://github.com/pedrofernandesfilho/poshfiles.git $HOME\Documents\WindowsPowerShell
cd $HOME\Documents\WindowsPowerShell
git submodule update --init --recursive
. $PROFILE
````

Update local repository:
````powershell
git pull
git submodule update --init --recursive
. $PROFILE
````

Actualize submodules to latest commit:
````powershell
git submodule update --recursive --remote
````
