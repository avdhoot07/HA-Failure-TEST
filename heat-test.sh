#################
###HEAT services down on Controller 10
###################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: heatservicedown
  tasks:


  - name: HEAT services down on Controller 10
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
###HEAT check
###################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: heatcheck
  tasks:

  - name: heat check on node-10
    shell: sh -x /root/avdhoot/heat-testing/heat-1.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if HEAT is PASSED, press ENTER to continue"

#################
#####HEAT services up on Controller 10
#####################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: heatserviceup
  tasks:

  - name: HEAT services start on Controller 10
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
####HEAT services down on Controller 11
####################

- hosts: controller-11
  gather_facts: yes
  remote_user: root
  tags: heatservicedown
  tasks:


  - name: HEAT services down on Controller 11
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
####HEAT check
####################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: heatcheck
  tasks:

  - name: heat check on node-10
    shell: sh -x /root/avdhoot/heat-testing/heat-2.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if HEAT is PASSED, press ENTER to continue"

#################
######HEAT services up on Controller 11
######################

- hosts: controller-11
  gather_facts: yes
  remote_user: root
  tags: heatserviceup
  tasks:

  - name: HEAT services start on Controller 11
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
#######HEAT services down on Controller 13
#######################

- hosts: controller-13
  gather_facts: yes
  remote_user: root
  tags: heatservicedown
  tasks:

  - name: HEAT services start on Controller 13
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i stop; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

#################
######HEAT check
######################

- hosts: controller-10
  gather_facts: yes
  remote_user: root
  tags: heatcheck
  tasks:

  - name: sahara check on node-10
    shell: sh -x /root/avdhoot/heat-testing/heat-3.sh
    ignore_errors: yes
    register: png
  - debug: var=png.stdout
  - pause: prompt="Verify if HEAT is PASSED, press ENTER to continue"

#################
#######HEAT services up on Controller 13
#######################

- hosts: controller-13
  gather_facts: yes
  remote_user: root
  tags: heatserviceup
  tasks:

  - name: HEAT services start on Controller 13
    shell: for i in `cd /etc/init.d/ ; ls heat-*`; do service $i start; done
    ignore_errors: yes
    register: png
  - debug: var=png.stdout

