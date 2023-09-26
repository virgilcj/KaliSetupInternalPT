echo  "\033[45m[+][+] Run as : . ./virtualmachineTools.sh [+][+]\033[m"

sleep 6
echo  "\033[45m[+][+] Updating Keys [+][+]\033[m"
sudo wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc 

echo  "\033[45m[+][+] APT UPDATE [+][+]\033[m"
sudo apt update -y && sudo apt upgrade -y

cd ~/
mkdir Tools
cd ~/Tools
sudo apt install -y python3-pip


echo  "\033[45m[+][+] Installing PIPX [+][+]\033[m"
sudo apt install -y pipx
pipx install updog
pipx ensurepath
sleep 3
echo 'export PATH=$PATH:/home/kali/.local/bin' >> ~/.zshrc
source ~/.zshrc
echo $PATH

echo  "\033[45m[+][+] Installing dirsearch [+][+]\033[m"
cd ~/Tools
git clone https://github.com/maurosoria/dirsearch.git --depth 1
cd dirsearch
pipx install .

#!/usr/bin/zsh
wget -qO - https://nim-lang.org/choosenim/init.sh | sh
sleep 3
echo 'export PATH=$PATH:/home/kali/.nimble/bin' >> ~/.zshrc
sleep 5
source ~/.zshrc
echo $PATH

echo  "\033[45m[+][+] Installing Nimplant C2 [+][+]\033[m"
cd ~/Tools
git clone https://github.com/chvancooten/NimPlant
sudo apt install -y mingw-w64
cd NimPlant
cd client; nimble install -d
pip3 install -r ../server/requirements.txt
cd ../
cp config.toml.example config.toml

#Multirelay
#sudo pip3 install pycrypto
#sudo apt-get install gcc-mingw-w64-x86-64 
#From responder/tools folder
#sudo x86_64-w64-mingw32-gcc ./MultiRelay/bin/Runas.c -o ./MultiRelay/bin/Runas.exe -municode -lwtsapi32 -luserenv
#sudo x86_64-w64-mingw32-gcc ./MultiRelay/bin/Syssvc.c -o ./MultiRelay/bin/Syssvc.exe -municode


echo  "\033[45m[+][+] Downloading Windows Tools and Binaries [+][+]\033[m"
cd ~/Tools
git clone https://github.com/virgilcj/PublicTools


#cd 
#wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
#sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz

#replace .zshrc with profiles if using on different linux distro
#sudo echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
#sudo echo "export PATH=$PATH:/home/kali/go/bin" >> ~/.zshrc
#source ~/.zshrc

echo  "\033[45m[+][+] Installing Go [+][+]\033[m"
sudo apt install golang-go
echo  "\033[45m[+][+] Installing Nuclei [+][+]\033[m"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

echo 'export PATH=$PATH:/home/kali/go/bin' >> ~/.zshrc
sleep 5
source ~/.zshrc
nuclei

echo  "\033[45m[+][+] Installing PowerPWN [+][+]\033[m"
pipx install powerpwn

#go get github.com/fatih/color
#go get github.com/KyleBanks/XOREncryption/Go

echo  "\033[45m[+][+] Installing Crackmapexec 6.0.1 [+][+]\033[m"
sudo apt remove crackmapexec
cd ~/Tools
git clone https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec
poetry install

echo  "\033[45m[+][+] Installing ADCSKiller [+][+]\033[m"
cd ~/Tools
git clone https://github.com/drwetter/testssl.sh

cd ~/Tools
git clone https://github.com/ly4k/Certipy && cd Certipy && sudo pipx install .
sudo mv /usr/bin/certipy-ad /usr/bin/certipy

cd ~/Tools
git clone https://github.com/p0dalirius/Coercer && cd Coercer && pip install -r requirements.txt && pipx install .

cd ~/Tools
git clone https://github.com/grimlockx/ADCSKiller/ && cd ADCSKiller && sudo pip install -r requirements.txt

echo  "\033[45m[+][+] Downloading DFSCoerce [+][+]\033[m"
cd ~/Tools
git clone https://github.com/Wh04m1001/DFSCoerce

echo  "\033[45m[+][+] Downloading NoPAC [+][+]\033[m"
cd ~/Tools
git clone https://github.com/Ridter/noPac && cd noPac && pip install -r requirements.txt

echo  "\033[45m[+][+] Installing Kerbrute [+][+]\033[m"
cd ~/Tools
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 kerbrute
chmod +x kerbrute 
sudo mv kerbrute /usr/local/bin 
kerbrute

pipx install acltoolkit-ad
pipx install minikerberos

cd ~/Tools
echo  "\033[45m[+][+] Installing PKINTtools [+][+]\033[m"
git clone https://github.com/dirkjanm/PKINITtools

echo  "\033[45m[+][+] Installing Petitpotam [+][+]\033[m"
git clone https://github.com/ly4k/PetitPotam

echo  "\033[45m[+][+] Installing pywsus [+][+]\033[m"
git clone https://github.com/GoSecure/pywsus

echo  "\033[45m[+][+] Installing Bettercap [+][+]\033[m"
sudo apt install bettercap

echo  "\033[45m[+][+] Installing guestmount [+][+]\033[m"
sudo apt install guestmount

echo  "\033[45m[+][+] Installing Villain C2 [+][+]\033[m"
sudo apt install villain

echo  "\033[45m[+][+] Installing SSHuttle [+][+]\033[m"
sudo apt install sshuttle

echo  "\033[45m[+][+] Installing Chisel [+][+]\033[m"
curl https://i.jpillora.com/chisel! | bash


#echo  "\033[45m[+][+] Installing Adalanche : ACL Visualizer [+][+]\033[m"
#cd ~/Tools
#git clone https://github.com/lkarlslund/Adalanche
#cd Adalanche
#pwsh ./build.ps1

echo  "\033[45m[+][+] Installing GPOddity for GPO Abuse [+][+]\033[m"
cd ~/Tools 
git clone https://github.com/synacktiv/GPOddity
cd GPOddity
pip install -r requirements.txt


#web
echo  "\033[45m[+][+] Installing Kiterunner for API Testing [+][+]\033[m"
cd ~/Tools 
wget https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
tar -xvf kiterunner_1.0.2_linux_amd64.tar.gz
sudo mv kr /usr/local/bin/

#SCCM tools 
echo  "\033[45m[+][+] Installing SCCMHUNTER [+][+]\033[m"
cd ~/Tools 
git clone https://github.com/garrettfoster13/sccmhunter
cd sccmhunter
python -m venv venv 
source venv/bin/activate 
pip3 install -r requirements.txt
python3 sccmhunter.py
deactivate

echo "\033[45m[+][+] Copy and use PXETheif in Windows [+][+]\033[m"
cd ~/Tools
git clone https://github.com/MWR-CyberSec/PXEThief

echo "\033[45m[+][+] Active-Directory-Spotlights [+][+]\033[m"
cd ~/Tools
git clone https://github.com/sse-secure-systems/Active-Directory-Spotlights
cd Active-Directory-Spotlights/SCCM-MECM/pxethiefy
pip install -r requirements.txt
python pxethiefy.py 

echo  "\033[45m[+][+] Vcenter Exploitation Toolkit [+][+]\033[m"
cd ~/Tools
git clone https://github.com/W01fh4cker/VcenterKit
cd VcenterKit
pip install -r requirements.txt


echo  "\033[45m[+][+] Installing secretsdump [+][+]\033[m"

cd ~/Tools
git clone https://github.com/fin3ss3g0d/secretsdump.py


echo  "\033[45m[+][+] Download Hacktricks Offline [+][+]\033[m"
echo " Link to download hacktricks offline: https://drive.google.com/file/d/19QsncIrcjfjvQ1xI58KuTKnU6be3EXZy/view?usp=sharing"

#Nessus licence SNVE-ERJF-LL74-YLXW

echo "\033[45m[+][+] Install Eyewitness[+][+]\033[m"
cd ~/Tools
git clone https://github.com/RedSiege/EyeWitness
cd EyeWitness/Python/setup
sudo ./setup.sh
