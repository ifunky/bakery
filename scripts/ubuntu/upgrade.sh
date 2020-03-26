# System Updates
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -yq

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
apt-get install -y curl htop language-pack-en
apt-get autoremove -y