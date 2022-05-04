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

## Modules

* PoshGit
* Z

## Aliases

### Docker

**dk** = `docker`<br />
**dkc** = `docker-compose`<br />
**dkcsta** = `docker-compose start`<br />
**dkcstp** = `docker-compose stop`<br />
**dkis** = `docker images`<br />

### DOTNET

**dn** = `dotnet`<br />
**dnb** = `dotnet build`<br />
**dnbni** = `dotnet build --no-incremental`<br />
**dnc** = `dotnet clean`<br />
**dni** = `dotnet clean --info`<br />
**dnlr** = `dotnet --list-runtimes`<br />
**dnls** = `dotnet --list-sdks`<br />
**dnr** = `dotnet run`<br />
**dnre** = `dotnet restore`<br />
**dnt** = `dotnet test`<br />
**dnv** = `dotnet --version`<br />

### Git

**gadd** = `git add`<br />
**gbranch** = `git branch`<br />
**gbrancha** = `git branch -a`<br />
**gcl** = `git clone`<br />
**gco** = `git checkout`<br />
**gcob** = `git checkout -b`<br />
**gct** = `git commit`<br />
**gcta** = `git commit --amend`<br />
**gcts** = `git commit -S`<br />
**gctsv** = `git commit -S -v`<br />
**gctv** = `git commit -v`<br />
**gdif** = `git diff`<br />
**gdiff** = `git diff`<br />
**gfetch** = `git fetch`<br />
**gk** = `gitk`<br />
**glog** = `git log`<br />
**glogo** = `git log --oneline`<br />
**gpull** = `git pull`<br />
**gpullr** = `git pull -r`<br />
**gpush** = `git push`<br />
**gpushf** = `git push -f`<br />
**gpushu** = `git push -u`<br />
**grb** = `git rebase`<br />
**gremote** = `git remote`<br />
**gremotev** = `git remote -v`<br />
**gspushp** = `git subtree push --prefix`<br />
**gst** = `git status`<br />
**gsta** = `git stash`<br />
**gstal** = `git stash list`<br />
**gstap** = `git stash pop`<br />
**gstau** = `git stash -u`<br />

### PowerShell

**c** = `clear`<br />
**l** = `ls`<br />
**ll** = `ls -Force`<br />
**poshadm** = `Start-Process powershell -verb runas`<br />
**s** = `start`<br />

### SQL Local DB

**sld** = `SqlLocalDB`<br />
**sldi** = `SqlLocalDB i` (info)<br />
**sldp** = `SqlLocalDB p` (stop)<br />
**slds** = `SqlLocalDB s` (start)<br />
**sldv** = `SqlLocalDB v` (versions)<br />
