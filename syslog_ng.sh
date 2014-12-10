#!/bin/bash -x

generate_source_package()
{
    rm -Rf syslog-ng-3.6.1
    rm -Rf dbuild
    rm -Rf syslog-ng*
    rm -Rf build-area
    wget https://github.com/balabit/syslog-ng/releases/download/syslog-ng-3.6.1/syslog-ng-3.6.1.tar.gz
    mv syslog-ng-3.6.1.tar.gz syslog-ng_3.6.1.orig.tar.gz
    git clone -b debian/experimental https://github.com/talien/syslog-ng-debian dbuild
    cd dbuild
    echo "=== Building source package ==="
    git-buildpackage -S -us -uc 
    echo "=== Building source package finished ==="
    cd ..
    mv build-area/syslog-ng_* ./
}

build_source_package()
{
    rm -Rf syslog-ng-3.6.1
    #rm -Rf tmp-debian
    dpkg-source -x syslog-ng_3.6.1-1.dsc 
    cd syslog-ng-3.6.1
    echo "=== Building binary package ==="
    dpkg-buildpackage -b -us -uc 
    echo "=== Building binary package finished ==="
    cd ..
}

generate_source_package
build_source_package
