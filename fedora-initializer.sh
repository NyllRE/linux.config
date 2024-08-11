
echo "Putting files in it's correct places"

mkdir ~/.config/fish
touch ~/.config/fish/config.fish
cp ./config.fish ~/.config/fish/config.fish

cp ./.bashrc ~/.bashrc

mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
cp ./init.vim ~/.config/nvim/init.vim

touch ~/.config/starship.toml
cp ./starship.toml ~/.config/starship.toml


echo "Warp Terminal Installation"
rpm --import https://releases.warp.dev/linux/keys/warp.asc
sh -c 'echo -e "[warpdotdev]\nname=warpdotdev\nbaseurl=https://releases.warp.dev/linux/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://releases.warp.dev/linux/keys/warp.asc" > /etc/yum.repos.d/warpdotdev.repo'


echo "Starship Installation"
curl -sS https://starship.rs/install.sh | sh


echo "Visual Studio Code Installation"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null

# Gives permisions to common VSCode Extensions
chown -R $(whoami) /usr/share/code
chown -R $(whoami) /usr/bin/code

echo "All dnf repos added, installing all packages"
dnf check-update
dnf install code warp-terminal install fish neovim nodejs npm


