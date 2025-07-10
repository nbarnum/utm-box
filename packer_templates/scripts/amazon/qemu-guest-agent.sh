#!/bin/bash

set -euo pipefail

TARGETARCH=$(uname --hardware-platform)

VERSION="9.1.0-24"

curl -sSf --output /tmp/qemu-guest-agent.rpm \
    "https://mirror.stream.centos.org/9-stream/AppStream/${TARGETARCH}/os/Packages/qemu-guest-agent-${VERSION}.el9.${TARGETARCH}.rpm"

dnf install -y /tmp/qemu-guest-agent.rpm

systemctl enable --now qemu-guest-agent

# allow all RPC commands
FILTER_RPC_ARGS="--allow-rpcs=guest-exec,guest-exec-status,guest-file-close,guest-file-flush,guest-file-open,guest-file-read,guest-file-seek,guest-file-write,guest-fsfreeze-freeze,guest-fsfreeze-freeze-list,guest-fsfreeze-status,guest-fsfreeze-thaw,guest-fstrim,guest-get-cpustats,guest-get-devices,guest-get-disks,guest-get-diskstats,guest-get-fsinfo,guest-get-host-name,guest-get-load,guest-get-memory-block-info,guest-get-memory-blocks,guest-get-osinfo,guest-get-time,guest-get-timezone,guest-get-users,guest-get-vcpus,guest-info,guest-network-get-interfaces,guest-network-get-route,guest-ping,guest-set-memory-blocks,guest-set-time,guest-set-user-password,guest-set-vcpus,guest-shutdown,guest-ssh-add-authorized-keys,guest-ssh-get-authorized-keys,guest-ssh-remove-authorized-keys,guest-suspend-disk,guest-suspend-hybrid,guest-suspend-ram,guest-sync,guest-sync-delimited"
sed -i "s/FILTER_RPC_ARGS=.*/FILTER_RPC_ARGS=\"${FILTER_RPC_ARGS}\"/" /etc/sysconfig/qemu-ga
