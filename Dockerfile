FROM quay.io/bashell/oraclelinux:8-slim
MAINTAINER Chaiwat Suttipongsakul "cwt@bashell.com"

ADD https://www.random.org/integers/?num=16&min=0&max=15&col=4&base=16&format=plain&rnd=new /.random

ENV _DNF 4.7.0-4.0.1.el8
ENV _ELFUTILS 0.185-1.el8
ENV _EXPAT 2.2.5-4.el8
ENV _GDBM 1.18-1.el8
ENV _GPGME 1.13.1-9.el8
ENV _IMAEVM 1.3.2-12.el8
ENV _LIBCOMPS 0.1.16-2.el8
ENV _LIBDNF 0.63.0-3.0.1.el8
ENV _LIBNSL2 1.2.0-2.20180605git4a062cf.el8
ENV _LIBREPORT 2.9.5-15.0.3.el8
ENV _LIBTIRPC 1.1.4-5.0.1.el8
ENV _PIP 9.0.3-20.el8
ENV _PYTHON 3.6.8-41.0.1.el8
ENV _RPM 4.14.3-19.el8_5.2
ENV _SETUPTOOLS 39.2.0-6.el8
ENV _TPM2TSS 2.3.2-4.el8

RUN rpm -ivh \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/dnf-${_DNF}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/dnf-data-${_DNF}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/elfutils-default-yama-scope-${_ELFUTILS}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/elfutils-libs-${_ELFUTILS}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/expat-${_EXPAT}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/gdbm-${_GDBM}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/gdbm-libs-${_GDBM}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/ima-evm-utils-${_IMAEVM}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libcomps-${_LIBCOMPS}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libnsl2-${_LIBNSL2}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libreport-filesystem-${_LIBREPORT}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/libtirpc-${_LIBTIRPC}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/platform-python-${_PYTHON}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/platform-python-setuptools-${_SETUPTOOLS}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-dnf-${_DNF}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-gpg-${_GPGME}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-hawkey-${_LIBDNF}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libcomps-${_LIBCOMPS}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libdnf-${_LIBDNF}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-libs-${_PYTHON}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-pip-wheel-${_PIP}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-rpm-${_RPM}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/python3-setuptools-wheel-${_SETUPTOOLS}.noarch.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/rpm-build-libs-${_RPM}.x86_64.rpm \
    https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/x86_64/getPackage/tpm2-tss-${_TPM2TSS}.x86_64.rpm \
 && mkdir -p /etc/yum/vars \
 && touch /etc/yum/vars/ociregion \
 && dnf clean all && dnf upgrade -y --skip-broken \
 && dnf clean all \
 && rm -rf /var/log/*

WORKDIR /root

