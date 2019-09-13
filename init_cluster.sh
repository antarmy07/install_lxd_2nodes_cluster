#!/usr/bin/env bash
/usr/bin/apt remove -y lxd
/usr/bin/apt purge -y lxd
cat <<EOF | /snap/bin/lxd init --preseed
config:
  core.trust_password: sekret
  core.https_address: 192.168.1.100:8443
  images.auto_update_interval: 15
storage_pools:
- name: default
  driver: zfs
networks:
- name: lxdbr0
  type: bridge
  config:
    ipv4.address: 172.16.0.30/24
    ipv6.address: none
profiles:
- name: default
  devices:
    root:
      path: /
      pool: default
      type: disk
    eth0:
      name: eth0
      nictype: bridged
      parent: lxdbr0
      type: nic
cluster:
  server_name: node1
  enabled: true
EOF
