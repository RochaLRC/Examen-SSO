if (cat /etc/os-release | grep "NAME=" | head -n 1 | grep "CentOS">/dev/null);
then
    echo "Centos"
    sudo yum -y install epel-release
    if ( yum list yum clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd);
    then
        yum remove clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
    fi
    yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
    yum update -y
fi
if (cat /etc/os-release | grep "NAME=" | head -n 1 | grep "Ubuntu">/dev/null);
then
    echo "Ubuntu"
    sudo apt remove clamav clamav-daemon
    sudo apt-get install -y clamav clamav-daemon
    apt-get update
    apt-get -y upgrade
fi