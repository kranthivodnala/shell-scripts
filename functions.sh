# Create a function to check if git, mysql, httpd, docker are installed, if not install them
#!/bin/bash
check_and_install_package() {
    package=$1
    if yum list installed "$package" &> /dev/null; then
        echo "$package is already installed."
    else
        echo "$package is not installed. Installing..."
        sudo yum install -y "$package"
        if [ $? -eq 0 ]; then
            echo "$package has been installed successfully."
        fi
    fi
}
 check_and_install_package git
 check_and_install_package mysql
 check_and_install_package httpd
 check_and_install_package docker-ce

sudo systemctl start docker
sudo systemctl start httpd
echo "Docker and HTTPD services have been started."
sudo systemctl enable docker
sudo systemctl enable httpd
echo "Docker and HTTPD services have been enabled to start on boot."
echo "Script execution completed."
# End of Script