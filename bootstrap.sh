#!/bin/bash

#Install the priorities module
yum -y install yum-priorities

#Add the rpmforge repo, very important
rpm -Uvh http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm

#Install the epel repo
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#Add the generic rpm repo
rpm -Uvh http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-utils-5.0.0-7.jpp6.noarch.rpm

# Remi Dependency on CentOS 6 and Red Hat (RHEL) 6 ##
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# CentOS 6 and Red Hat (RHEL) 6 ##
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

#Perform system update
yum -y --enablerepo=remi update

#install base software requirements for app back-end environment
yum -y --enablerepo=remi install vim curl git httpd memcached mysql-server ruby gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel ruby-rdoc ruby-devel rubygems

#Install ruby gems
gem update
gem update --system
gem install rails -V

# Enabled memcached on startup and ensure its started
chkconfig memcached on && service memcached start

#install mysql default tables and 
mysql_install_db
chkconfig mysqld on && service mysqld restart
/usr/bin/mysqladmin -u root password 'Rphzri81!'

chkconfig httpd on && service httpd restart

# Disable iptables, it blocks web requests from coming in
chkconfig iptables off && service iptables stop
