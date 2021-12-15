FROM quay.io/bashell/oraclelinux:8-slim-aarch64
MAINTAINER Chaiwat Suttipongsakul "cwt@bashell.com"

ADD https://www.random.org/integers/?num=16&min=0&max=15&col=4&base=16&format=plain&rnd=new /.random
RUN rpm -ivh \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/dnf-4.7.0-4.0.1.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/dnf-data-4.7.0-4.0.1.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/elfutils-default-yama-scope-0.185-1.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/elfutils-libs-0.185-1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/gdbm-1.18-1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/gdbm-libs-1.18-1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/ima-evm-utils-1.3.2-12.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/libcomps-0.1.16-2.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/libnsl2-1.2.0-2.20180605git4a062cf.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/libreport-filesystem-2.9.5-15.0.2.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/libtirpc-1.1.4-5.0.1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/platform-python-3.6.8-41.0.1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/platform-python-setuptools-39.2.0-6.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-dnf-4.7.0-4.0.1.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-gpg-1.13.1-9.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-hawkey-0.63.0-3.0.1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-libcomps-0.1.16-2.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-libdnf-0.63.0-3.0.1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-libs-3.6.8-41.0.1.el8.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-pip-wheel-9.0.3-20.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-rpm-4.14.3-19.el8_4.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/python3-setuptools-wheel-39.2.0-6.el8.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/rpm-build-libs-4.14.3-19.el8_4.aarch64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/getPackage/tpm2-tss-2.3.2-4.el8.aarch64.rpm \
 && mkdir -p /etc/yum/vars \
 && touch /etc/yum/vars/ociregion \
 && dnf check-update ; dnf upgrade -y --skip-broken \
 && dnf clean all

WORKDIR /root

