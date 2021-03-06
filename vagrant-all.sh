#!/bin/bash

set -euo pipefail

export KUBESPAWN_AUTOBUILD="true"
export KUBESPAWN_DISTRO=${KUBESPAWN_DISTRO:-fedora}
export KUBESPAWN_REDIRECT_TRAFFIC="true"

KUBESPAWN_PROVIDER=${KUBESPAWN_PROVIDER:-virtualbox}
KUBESPAWN_VAGRANT_EXTRA_FLAGS=${KUBESPAWN_VAGRANT_EXTRA_FLAGS:-}

vagrant up $KUBESPAWN_DISTRO --provider=$KUBESPAWN_PROVIDER ${KUBESPAWN_VAGRANT_EXTRA_FLAGS}

./vagrant-fetch-kubeconfig.sh

export KUBECONFIG=$(pwd)/kubeconfig
