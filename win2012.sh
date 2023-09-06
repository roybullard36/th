apt-get update
echo "Install QEMU"
apt install qemu-kvm -y
echo "Download windows files"
wget -O win2012.iso https://bitly.ws/TZrM
echo "Download bios64"
wget -O bios64.bin https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin
echo "Create win2012.img"
qemu-img create -f raw win2012.img
qemu-img create -f raw win2012.img 30G
echo "Download ngrok"
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok.tgz > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
./ngrok tcp --region=ap 5900 &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
sleep 432000
