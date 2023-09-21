#!/bin/bash

export PATH=$HOME/go/bin:$PATH
dlv_ver=$1

if [ ! -d $dlv_ver ]; then
  mkdir $dlv_ver
fi

for go_ver in 1.18 1.20 1.21.0 ; do
  go install golang.org/dl/go$go_ver@latest
  go$go_ver download
  GOBIN=`pwd`/$dlv_ver go$go_ver install github.com/go-delve/delve/cmd/dlv@$dlv_ver 
  mv `pwd`/$dlv_ver/{dlv,dlv-go$go_ver}
done


