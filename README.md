# Install LXD on 2 Nodes Cluster

This is ansible playbook to install LXD cluster in two nodes.

Please update hosts by entering nodes IP addresses. 

**STEP**

1. Initialiaze the hosts by applying initial.yml playbook.
2. Install LXD cluster and joining node together by runing lxd-playbook.yml
3. Run 2 lxc containers on both nodes by running install_lxd_containers.yml 
