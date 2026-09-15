#!/usr/bin/env bash
# Run as: bash "virtual machine toolsv2.sh"   (do NOT source it)
# Keep this file LF-only. If you edit it on Windows, run: sed -i 's/\r$//' thisfile
set -u
BIN="$HOME/.local/bin"
export PATH="$PATH:$BIN:$HOME/.nimble/bin:$HOME/go/bin:/usr/local/go/bin"
RC="$HOME/.zshrc"; [ -f "$RC" ] || RC="$HOME/.bashrc"; touch "$RC"
addpath() { grep -qF "$1" "$RC" || echo "export PATH=\$PATH:$1" >> "$RC"; }
apt_get() { sudo apt-get install -y "$@" || echo "!! skipped (not available): $*"; }
clone() { d=$(basename "$1" .git); [ -d "$d" ] || git clone "$1" "$d"; }
PIP="pip3 install --break-system-packages"

echo  "\033[45m[+][+] Run as : . ./virtualmachineTools.sh [+][+]\033[m"

sleep 6
echo  "\033[45m[+][+] Updating Keys [+][+]\033[m"
sudo wget https://archive.kali.org/archive-keyring.gpg -O /usr/share/keyrings/kali-archive-keyring.gpg

echo  "\033[45m[+][+] APT UPDATE [+][+]\033[m"
sudo apt-get update || true
# && sudo apt upgrade -y

cd ~/
mkdir -p Tools
cd ~/Tools
apt_get python3-pip


echo  "\033[45m[+][+] Installing PIPX [+][+]\033[m"
apt_get pipx
pipx install updog || true
pipx ensurepath
sleep 3
addpath "$HOME/.local/bin"

echo  "\033[45m[+][+] Installing dirsearch [+][+]\033[m"
apt_get dirsearch

wget -qO - https://nim-lang.org/choosenim/init.sh | sh -s -- -y
sleep 3
addpath "$HOME/.nimble/bin"
sleep 5

echo  "\033[45m[+][+] Installing Nimplant C2 [+][+]\033[m"
cd ~/Tools
clone https://github.com/chvancooten/NimPlant
apt_get mingw-w64
cd NimPlant
cd client; nimble install -d
$PIP -r ../server/requirements.txt
cd ../
cp config.toml.example config.toml

#Multirelay
#sudo pip3 install pycrypto
#apt_get gcc-mingw-w64-x86-64 
#From responder/tools folder
#sudo x86_64-w64-mingw32-gcc ./MultiRelay/bin/Runas.c -o ./MultiRelay/bin/Runas.exe -municode -lwtsapi32 -luserenv
#sudo x86_64-w64-mingw32-gcc ./MultiRelay/bin/Syssvc.c -o ./MultiRelay/bin/Syssvc.exe -municode

pipx install git+https://github.com/Pennyw0rth/NetExec || true
pipx upgrade netexec  || true
# (removed: blocks the script) netexec
# (removed: blocks the script) nxcdb


echo  "\033[45m[+][+] Downloading Windows Tools and Binaries [+][+]\033[m"
cd ~/Tools
clone https://github.com/virgilcj/PublicTools


#cd 
#wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
#sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz

#replace .zshrc with profiles if using on different linux distro
#sudo echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
#sudo echo "export PATH=$PATH:/home/kali/go/bin" >> ~/.zshrc
#
echo  "\033[45m[+][+] Installing Go [+][+]\033[m"
apt_get golang-go
echo  "\033[45m[+][+] Installing Nuclei [+][+]\033[m"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

addpath "$HOME/go/bin"
sleep 5
# (removed: blocks the script) nuclei

echo  "\033[45m[+][+] Installing PowerPWN [+][+]\033[m"
pipx install powerpwn || true

#go get github.com/fatih/color
#go get github.com/KyleBanks/XOREncryption/Go

echo  "\033[45m[+][+] Installing Poetry [+][+]\033[m"
curl -sSL https://install.python-poetry.org | python3 -
#this above source was not tested

echo  "\033[45m[+][+] Installing Crackmapexec 6.1 [+][+]\033[m"
sudo apt remove crackmapexec
#cd ~/Tools
#git clone https://github.com/byt3bl33d3r/CrackMapExec
#cd CrackMapExec
#echo "\033[45m[+][+] If crackmapexec does not install here, then Ctrl+c and restart system and install at the end [+][+]\033[m"
#poetry install

echo  "\033[45m[+][+] Installing ADCSKiller [+][+]\033[m"
cd ~/Tools
clone https://github.com/drwetter/testssl.sh

cd ~/Tools
clone https://github.com/ly4k/Certipy && cd Certipy && sudo pipx install .
[ -f /usr/bin/certipy-ad ] && sudo mv /usr/bin/certipy-ad /usr/bin/certipy

cd ~/Tools
clone https://github.com/p0dalirius/Coercer && cd Coercer && $PIP -r requirements.txt --break-system-packages && pipx install .

#cd ~/Tools
#git clone https://github.com/grimlockx/ADCSKiller/ && cd ADCSKiller && sudo $PIP -r requirements.txt --break-system-packages

echo  "\033[45m[+][+] Installing ADCSYNC [+][+]\033[m"
cd ~/Tools
clone https://github.com/JPG0mez/adcsync.git
cd adcsync
$PIP -r requirements.txt --break-system-packages


echo  "\033[45m[+][+] Downloading DFSCoerce [+][+]\033[m"
cd ~/Tools
clone https://github.com/Wh04m1001/DFSCoerce

echo  "\033[45m[+][+] Downloading NoPAC [+][+]\033[m"
cd ~/Tools
clone https://github.com/Ridter/noPac && cd noPac && $PIP -r requirements.txt --break-system-packages

echo  "\033[45m[+][+] Installing Kerbrute [+][+]\033[m"
cd ~/Tools
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 kerbrute
chmod +x kerbrute 
sudo mv -f kerbrute /usr/local/bin/

pipx install acltoolkit-ad || true
pipx install minikerberos || true

cd ~/Tools
echo  "\033[45m[+][+] Installing PKINTtools [+][+]\033[m"
clone https://github.com/dirkjanm/PKINITtools

echo  "\033[45m[+][+] Installing Petitpotam [+][+]\033[m"
clone https://github.com/ly4k/PetitPotam

echo  "\033[45m[+][+] Installing pywsus [+][+]\033[m"
clone https://github.com/GoSecure/pywsus

echo  "\033[45m[+][+] Installing Bettercap [+][+]\033[m"
apt_get bettercap

echo  "\033[45m[+][+] Installing guestmount [+][+]\033[m"
apt_get guestmount

echo  "\033[45m[+][+] Installing Villain C2 [+][+]\033[m"
apt_get villain

echo  "\033[45m[+][+] Installing SSHuttle [+][+]\033[m"
apt_get sshuttle

echo  "\033[45m[+][+] Installing Chisel [+][+]\033[m"
curl -sSL https://i.jpillora.com/chisel! | sudo bash


#echo  "\033[45m[+][+] Installing Adalanche : ACL Visualizer [+][+]\033[m"
#cd ~/Tools
#git clone https://github.com/lkarlslund/Adalanche
#cd Adalanche
#pwsh ./build.ps1

echo  "\033[45m[+][+] Installing GPOddity for GPO Abuse [+][+]\033[m"
cd ~/Tools 
clone https://github.com/synacktiv/GPOddity
cd GPOddity
$PIP -r requirements.txt --break-system-packages


#web
#echo  "\033[45m[+][+] Installing Kiterunner for API Testing [+][+]\033[m"
#cd ~/Tools 
#wget https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
#tar -xvf kiterunner_1.0.2_linux_amd64.tar.gz
#sudo mv kr /usr/local/bin/

#SCCM tools 
echo  "\033[45m[+][+] Installing SCCMHUNTER [+][+]\033[m"
cd ~/Tools 
clone https://github.com/garrettfoster13/sccmhunter
cd sccmhunter
python -m venv venv 
source venv/bin/activate 
$PIP -r requirements.txt --break-system-packages
# (removed: blocks the script) python3 sccmhunter.py
deactivate

echo "\033[45m[+][+] Copy and use PXETheif in Windows [+][+]\033[m"
cd ~/Tools
clone https://github.com/MWR-CyberSec/PXEThief

echo "\033[45m[+][+] Active-Directory-Spotlights [+][+]\033[m"
cd ~/Tools
clone https://github.com/sse-secure-systems/Active-Directory-Spotlights
cd Active-Directory-Spotlights/SCCM-MECM/pxethiefy
$PIP -r requirements.txt --break-system-packages
# (removed: blocks the script) python pxethiefy.py 

echo  "\033[45m[+][+] Vcenter Exploitation Toolkit [+][+]\033[m"
cd ~/Tools
clone https://github.com/W01fh4cker/VcenterKit
cd VcenterKit
$PIP -r requirements.txt --break-system-packages


echo  "\033[45m[+][+] Installing secretsdump [+][+]\033[m"

cd ~/Tools
clone https://github.com/fin3ss3g0d/secretsdump.py

#Nessus licence SNVE-ERJF-LL74-YLXW

echo "\033[45m[+][+] Install Eyewitness[+][+]\033[m"
cd ~/Tools
clone https://github.com/RedSiege/EyeWitness
cd EyeWitness/Python/setup
$PIP -r requirements.txt --break-system-packages
yes | sudo ./setup.sh

cd ~/Tools
clone https://github.com/ShutdownRepo/pywhisker


apt_get mongo-tools

#Download Rockyou2021 from here: https://download.weakpass.com/wordlists/1943/rockyou2021.7z
echo "Download rockyou2021 from here https://download.weakpass.com/wordlists/1943/rockyou2021.7z"

cd ~/Tools
clone https://github.com/wearecaster/Above
cd Above
sudo python3 setup.py install || $PIP .
echo "run like sudo above --interface eth0 --timer 120"
echo "Install https://pypi.org/project/CredSLayer/ Manually as sudo"

cd ~/Tools
clone https://github.com/skelsec/evilrdp
echo "Install if needed"

echo "\033[45m[+][+] Installing ACEShark [+][+]\033[m"
cd ~/Tools
clone https://github.com/t3l3machus/ACEshark
cd ACEshark  
$PIP -r requirements.txt  --break-system-packages

cd ~/Tools
wget https://github.com/Kevin-Robertson/Inveigh/releases/download/v2.0.11/Inveigh-net8.0-win-x64-trimmed-single-v2.0.11.zip


pipx install pyrdp-mitm[full] || true

apt_get dirsearch


apt_get libkrb5-dev
pipx install "git+https://github.com/aniqfakhrul/powerview.py" || true

echo "Logging:"
pipx install git+https://github.com/Michaeladsl/Patronusx || true


#apt_get rustup
#rustup default stable
#apt_get cargo

#mkdir ~/Tools/windows/
#cd ~/Tools/windows/
#git clone https://github.com/0xdea/blindsight
#cd blindsight
#cargo build --release --target x86_64-pc-windows-gnu



cd ~/Tools/
clone https://github.com/Helixo32/NimBlackout
cd NimBlackout/src/
nim --os:windows --cpu:amd64 --gcc.exe:x86_64-w64-mingw32-gcc --gcc.linkerexe:x86_64-w64-mingw32-gcc c NimBlackout.nim

cd ~/Tools/
clone https://github.com/virgilcj/VLANPWN


cd ~/Tools/
echo "Zerologon Exploit Script"
clone https://github.com/dirkjanm/CVE-2020-1472
clone https://github.com/dirkjanm/krbrelayx
clone https://github.com/leechristensen/SpoolSample
$PIP ldap3


#apt_get docker.io
# Download latest version of hacktricks
#git clone https://github.com/HackTricks-wiki/hacktricks
# Run the docker container indicating the path to the hacktricks folder
#docker run -d --rm -p 3337:3000 --name hacktricks -v $(pwd)/hacktricks:/app ghcr.io/hacktricks-wiki/hacktricks-cloud/translator-image bash -c "cd /app && git config --global --add safe.directory /app && git pull && MDBOOK_PREPROCESSOR__HACKTRICKS__ENV=dev mdbook serve --hostname 0.0.0.0"
#download adelegate

cd ~/Tools/
clone https://github.com/LuemmelSec/Pentest-Tools-Collection

pipx install ASRepCatcher || true

clone https://github.com/virgilcj/Invoke-PassTheCert

$PIP ldap3 pyasn1 pycryptodome
$PIP dnspython
clone https://github.com/cybrly/badsuccessor


apt_get python3-nftables
pipx install wsuks --system-site-packages || true
sudo ln -sf "$BIN/wsuks" /usr/local/sbin/wsuks

cd ~/Tools/
clone https://github.com/techspence/ADeleginator
cd ADeleginator
wget https://github.com/mtth-bfft/adeleg/releases/download/v1.2/ADeleg.exe

cd ~/Tools
clone https://github.com/virgilcj/LainAmsiOpenSession
apt_get docker.io 
apt_get docker-compose
apt_get bloodhound-ce-python

wget https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.7/LaZagne.exe
cd ~/Tools
mkdir -p ligolo-ng
cd ligolo-ng/
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_windows_amd64.zip
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_windows_amd64.zip


#wget https://github.com/SpecterOps/bloodhound-cli/releases/latest/download/bloodhound-cli-linux-amd64.tar.gz
#tar -xvzf bloodhound-cli-linux-amd64.tar.gz
#sudo ./bloodhound-cli install


cd ~/Tools/
clone https://github.com/soltanali0/CVE-2025-53770-Exploit/
wget https://github.com/irsdl/ysonet/releases/download/ysonet%2Fv1.00/ysonet-v1.00.zip

cd ~/Tools/
clone https://github.com/OleFredrik1/remoteKrbRelayx
cd remoteKrbRelayx
pipx install git+https://github.com/OleFredrik1/remoteKrbRelayx.git || true


cd ~/Tools/
clone https://github.com/mverschu/CVE-2025-33073


#check Eyewitness, impacket-secretsdump certify
