#/bin/sh

sudo cp /etc/dnf/dnf.conf /etc/dnf.dnf.conf.bak #Create a backup

sudo echo fastestmirror=True >> /etc/dnf/dnf.conf #Enable fast mirror
sudo echo keepcache=True >> /etc/dnf/dnf.conf #Keep the cache

#Enable parallel downloads
while true; do
    read -p "Do you want parallel download to be activated? (Only if you have a good internet connection) [y/N]" yn
    case $yn in
        [Yy]* ) sudo echo max_parallel_downloads=10 >> /etc/dnf/dnf.conf; break;;
        [Nn]* ) break;;
        * ) break;;
    esac
done

#Make "Yes" the default
while true; do
    read -p "Do you want Yes to be the default? (Not recommanded) [y/N]" yn
    case $yn in
        [Yy]* ) sudo echo defaultyes=True >> /etc/dnf/dnf.conf; break;;
        [Nn]* ) break;;
        * ) break;;
    esac
done
