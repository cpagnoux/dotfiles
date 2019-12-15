# Alias for downloading latest stable version of Adminer in public_html
alias get-adminer-latest="wget https://www.adminer.org/latest-en.php \
  -O ~/public_html/adminer-en.php"

# Alias for generating a self-signed SSL certificate for testing purpose
alias generate-ssl-cert="openssl req -new -x509 -nodes \
  -out ~/Documents/server.crt \
  -keyout ~/Documents/server.key"

# Aliases for controlling Quake Live awesomium_process
alias awesomium-stop="killall -STOP awesomium_process.exe"
alias awesomium-cont="killall -CONT awesomium_process.exe"

# Alias for starting Demopan with TF2 path
tf2_path="~/.local/share/Steam/steamapps/common/Team\ Fortress\ 2/tf"
alias demopan-tf2="demopan -w $tf2_path --demos $tf2_path"
unset tf2_path
