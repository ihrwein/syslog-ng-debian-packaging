#!/bin/bash -x

generate_source_package()
{
    #rm -Rf dbuild
    rm -Rf syslog-ng*
    rm -Rf build-area
    wget https://github.com/balabit/syslog-ng/releases/download/syslog-ng-3.7.0alpha2/syslog-ng-3.7.0alpha2.tar.gz
    mv syslog-ng-3.7.0alpha2.tar.gz syslog-ng_3.7.0~alpha2.orig.tar.gz

    if [ ! -d dbuild ]; then
        git clone -b debian/experimental https://github.com/talien/syslog-ng-debian dbuild
    fi

    cd dbuild
    echo "=== Building source package ==="
    git-buildpackage -S -us -uc 
    echo "=== Building source package finished ==="
    cd ..
    mv build-area/syslog-ng_* ./
}

build_source_package()
{
    rm -Rf syslog-ng-3.7.0~alpha2
    #rm -Rf tmp-debian
    dpkg-source -x syslog-ng_3.7.0~alpha2-1.dsc 
    cd syslog-ng-3.7.0~alpha2
    echo "=== Building binary package ==="
    dpkg-buildpackage -b -us -uc 
    echo "=== Building binary package finished ==="
    cd ..
}

generate_source_package
build_source_package
