# SSH using kitten
alias ssh="kitty +kitten ssh"

# Start chromium without web security features
alias chromium-unsafe="chromium \
  --disable-web-security \
  --user-data-dir=/tmp/chromium-unsafe"

# Download latest stable version of Adminer in public_html
alias get-adminer-latest="wget https://www.adminer.org/latest-en.php \
  -O ~/public_html/adminer-en.php"

# Generate a self-signed SSL certificate for testing purpose
alias generate-ssl-cert="openssl req -new -x509 -nodes \
  -out ~/Documents/server.crt \
  -keyout ~/Documents/server.key"

# Control Quake Live awesomium_process
alias awesomium-stop="killall -STOP awesomium_process.exe"
alias awesomium-cont="killall -CONT awesomium_process.exe"

# Start Demopan with TF2 path
tf2_path="~/.local/share/Steam/steamapps/common/Team\ Fortress\ 2/tf"
alias demopan-tf2="demopan -w $tf2_path --demos $tf2_path"
unset tf2_path
