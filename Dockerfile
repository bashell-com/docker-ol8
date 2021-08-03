FROM quay.io/bashell/oraclelinux:8-slim
MAINTAINER Chaiwat Suttipongsakul "cwt@bashell.com"

ADD https://www.random.org/integers/?num=16&min=0&max=15&col=4&base=16&format=plain&rnd=new /.random
RUN rpm -ivh \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/dnf-4.4.2-11.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/dnf-data-4.4.2-11.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/elfutils-default-yama-scope-0.182-3.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/elfutils-libs-0.182-3.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/gdbm-1.18-1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/gdbm-libs-1.18-1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/ima-evm-utils-1.3.2-12.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libcomps-0.1.11-5.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libreport-filesystem-2.9.5-15.0.2.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libtirpc-1.1.4-4.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/platform-python-3.6.8-37.0.1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/platform-python-setuptools-39.2.0-6.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-dnf-4.4.2-11.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-gpg-1.13.1-7.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-hawkey-0.55.0-7.0.1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libcomps-0.1.11-5.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libdnf-0.55.0-7.0.1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libs-3.6.8-37.0.1.el8.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-pip-wheel-9.0.3-19.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-rpm-4.14.3-14.el8_4.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-setuptools-wheel-39.2.0-6.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/rpm-build-libs-4.14.3-14.el8_4.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/tpm2-tss-2.3.2-3.el8.x86_64.rpm \
 && mkdir -p /etc/yum/vars \
 && touch /etc/yum/vars/ociregion \
 && dnf check-update ; dnf upgrade -y --skip-broken \
 && dnf clean all

WORKDIR /root

