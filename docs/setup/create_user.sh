!/bin/bash
# Usage: ./create_user.sh <username> <pubkey_path> 

USERNAME=$1
KEYFILE=$2
if [ -z "$USERNAME" ] || [ -z "$KEYFILE" ]; then
        echo "[ERR] Usage: $0 <username> <pubkey_path> "
        exit 1
fi

#Create user if not exists
if id "$USERNAME" &>/dev/null; then
        echo "[WARN] User $USERNAME already exists, skipping creation"
else
    	sudo useradd -m -s /bin/bash "$USERNAME"
        echo "User $USERNAME succesfully created"
fi


sudo mkdir -p /home/$USERNAME/.ssh
sudo cp "$KEYFILE" /home/$USERNAME/.ssh/authorized_keys
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys
echo "[DONE] SSH key installed for $USERNAME"

echo "[OK]  User $USERNAME ready. "






