#!/bin/bash

# check if gnome keyring is installed
if pacman -Qs gnome-keyring > /dev/null ; then
    sudo pacman -R gnome-keyring
fi

sudo pacman -S x11-ssh-askpass

if [[ ! -d "$HOME/.config/systemd/user" ]]; then
    mkdir -p ~/.config/systemd/user
fi

cat <<EOF > ~/.config/systemd/user
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
Environment=SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
EOF

echo 'SSH_AUTH_SOCK DEFAULT="${XDG_RUNTIME_DIR}/ssh-agent.socket"' >> $HOME/.pam_environment

systemctl --user daemon-reload
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
