# This Script will be used to check and install mysql, git, httpd, docker packages using yum repository and start docker and http services
#!/bin/bash
# Check if the script is run as root user
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
# Update the package repository to ensure we have the latest information
echo "Updating package repository..."
sudo yum update -y
echo "Package repository updated."
# List of packages to be checked and installed
packages=(mysql git httpd docker) # Array of packages to be checked and installed
for package in "${packages[@]}" # Loop through each package in the array
do
    if yum list installed "$package" &> /dev/null; then # Check if the package is already installed
        echo "$package is already installed."
    else
        echo "$package is not installed. Installing..."
        sudo yum install -y "$package" # Install the package if not installed
        if [ $? -eq 0 ]; then # Check if the installation was successful
            echo "$package has been installed successfully."
            fi
    fi
done
echo "All packages are checked and installed if necessary."
sudo systemctl start docker
sudo systemctl start httpd
echo "Docker and HTTPD services have been started."
sudo systemctl enable docker
sudo systemctl enable httpd
echo "Docker and HTTPD services have been enabled to start on boot."
echo "Script execution completed."
# End of Script