#################
###MURANO services down on Controller 1
###################

- hosts: controller-1
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:


  - name: MURANO services down on Controller 1
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
###MURANO check
###################

- hosts: tempest
  gather_facts: yes
  remote_user: root
  tags: muranocheck
  tasks:

  - name: murano check on node-1
    shell: bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
#####MURANO services up on Controller 1
#####################

- hosts: controller-1
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 1
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
####MURANO services down on Controller 2
####################

- hosts: controller-2
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:


  - name: MURANO services down on Controller 2
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
####MURANO check
####################

- hosts: tempest
  gather_facts: yes
  remote_user: root
  tags: muranocheck
  tasks:

  - name: murano check on node-1
    shell: bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
######MURANO services up on Controller 2
######################

- hosts: controller-2
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 2
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
#######MURANO services down on Controller 3
#######################

- hosts: controller-3
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:

  - name: MURANO services stop on Controller 3
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
######MURANO check
######################

- hosts: tempest
  gather_facts: yes
  remote_user: root
  tags: muranocheck
  tasks:

  - name: murano check on node-1
    shell: bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
#######MURANO services up on Controller 3
#######################

- hosts: controller-3
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 3
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

