FROM centos:centos8

RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN dnf -y install dnf-plugins-core && \
    dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf config-manager --set-enabled powertools 

RUN echo "Install yum tools for upload packages" && \
    yum install -y diffutils gcc make git glib2-devel libfdt-devel pixman-devel zlib-devel bzip2 ninja-build python3 && \
    yum clean all && rm -rf /var/cache/yum
