#################
###MURANO services down on Controller 10
###################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:


  - name: MURANO services down on Controller 10
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

  - name: murano check on node-10
    shell: export http_proxy=http://10.135.80.164:8678; export https_proxy=http://10.135.80.164:8678; bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
#####MURANO services up on Controller 10
#####################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 10
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
####MURANO services down on Controller 11
####################

- hosts: controller-11
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:


  - name: MURANO services down on Controller 11
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

  - name: murano check on node-10
    shell: export http_proxy=http://10.135.80.164:8678; export https_proxy=http://10.135.80.164:8678; bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
######MURANO services up on Controller 11
######################

- hosts: controller-11
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 11
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
#######MURANO services down on Controller 13
#######################

- hosts: controller-13
  gather_facts: yes
  remote_user: root
  tags: muranoservicedown
  tasks:

  - name: MURANO services stop on Controller 13
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

  - name: murano check on node-10
    shell: export http_proxy=http://10.135.80.164:8678; export https_proxy=http://10.135.80.164:8678; bash /root/test_murano.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if tempest is PASSED, press ENTER to continue"

#################
#######MURANO services up on Controller 13
#######################

- hosts: controller-13
  gather_facts: yes
  remote_user: root
  tags: muranoserviceup
  tasks:

  - name: MURANO services start on Controller 13
    shell: for i in `cd /etc/init.d/ ; ls openstack-murano-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

