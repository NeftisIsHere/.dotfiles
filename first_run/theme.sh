echo "Installing themes into /usr/share/themes"
sudo mkdir -p /usr/share/themes
for dir in "$HOME/.dotfiles/.themes"/*; do
    if [ -d "$dir" ]; then
        name=$(basename "$dir")
        echo "  Installing theme: $name"
        sudo cp -r "$dir" /usr/share/themes/
    fi
done

