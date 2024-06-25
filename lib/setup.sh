


Create a `setup.sh` script in the `lib` directory to install Flex and Bison:

```sh
#!/bin/bash

# Check if Homebrew is installed (macOS)
if command -v brew &> /dev/null; then
    echo "Homebrew found. Installing Flex and Bison..."
    brew install flex bison
    exit 0
fi

# Check if apt-get is available (Debian-based Linux)
if command -v apt-get &> /dev/null; then
    echo "apt-get found. Installing Flex and Bison..."
    sudo apt-get update
    sudo apt-get install -y flex bison
    exit 0
fi

# Check if yum is available (Red Hat-based Linux)
if command -v yum &> /dev/null; then
    echo "yum found. Installing Flex and Bison..."
    sudo yum install -y flex bison
    exit 0
fi

# Check if pacman is available (MSYS2 on Windows)
if command -v pacman &> /dev/null; then
    echo "pacman found. Installing Flex and Bison..."
    pacman -Syu
    pacman -S flex bison
    exit 0
fi

echo "No supported package manager found. Please install Flex and Bison manually."
exit 1
```