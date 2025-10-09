#!/bin/bash

# Check if git,vim, curl are installed in ubuntu, if not install the package

for pkg in git vim curl docker wget
do
    if dpkg -l | grep -q $pkg
    then
        echo "$pkg ✅ is already installed"
    else
        echo "$pkg is not installed"
        echo "⏳ Installing $pkg..."
        sudo apt-get install $pkg -y
        echo "$pkg ✅ installed successfully"
    fi
done
