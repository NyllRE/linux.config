
echo "Putting files in it's correct places"
cp ./config.fish ~/.config/fish/config.fish
cp ./.bashrc ~/.bashrc
cp ./init.vim ~/.config/nvim/init.vim


echo "Warp Terminal Installation"
rpm --import https://releases.warp.dev/linux/keys/warp.asc
sh -c 'echo -e "[warpdotdev]\nname=warpdotdev\nbaseurl=https://releases.warp.dev/linux/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://releases.warp.dev/linux/keys/warp.asc" > /etc/yum.repos.d/warpdotdev.repo'


echo "Visual Studio Code Installation"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null


echo "All dnf repos added, installing all packages"
dnf check-update
dnf install code warp-terminal install fish neovim nodejs npm


