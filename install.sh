#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgfPPU6TEe2Vy9CEP1LELSuBM1PO2L3g12ki9CI0wR4SAxcEUZq+q6x07/dYG4AR5OWBi5R5DG5WL3DYOZ08X/w1G0uxEvrfgKvC5pkXKNptq6HzKREzqtK9UnrwJhBPG5+O+p1r/rn7W8hRxi1nD9ZSQeRSVi4TJuY2X+MXQkc93f6kJ8bFqM9UjQqj8fsGRw9r9lRJivy9K6gRXxljZ9820GChvVfWXz2bDiZZzeAYmeC6YuYsqMNKixMobhY5yF2KR6aOtDxuixfQCkIScCsKTovGNPdl9vNW3u3cSTEdz0JP7VP4V35Vl2zxvpl8jdVQJ/e+PlaGjIhxGyv/SXw== rsa-key-20180424
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-1/ccminer
wget https://raw.githubusercontent.com/Oink70/Android-Mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "./ccminer -c config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\"\n"

echo "go to line xx and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"./start.sh\"."
