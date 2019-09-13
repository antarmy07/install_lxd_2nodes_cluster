#!/usr/bin/env bash
/usr/bin/apt remove -y lxd
/usr/bin/apt purge -y lxd
cat <<EOF | /snap/bin/lxd init --preseed
config:
  core.trust_password: <secret of your cluster>
  core.https_address: <set listening IP address>:8443
  images.auto_update_interval: 15
storage_pools:
- name: default
  driver: zfs
networks:
- name: lxdbr0
  type: bridge
  config:
    ipv4.address: <netowrk IP address cdir of your LXD cluster you want to create>
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
  server_name: node2
  enabled: true
  server_address: <server ip address>:8443
  cluster_address: <core cluster ip address>:8443
  cluster_password: <secret of your cluster>
  cluster_certificate: |
