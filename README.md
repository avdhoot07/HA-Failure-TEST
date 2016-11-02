HA Failure Test

Introduction


One of the key requirements for any Openstack cloud deployment is High availability (HA). High Availability refers to the availability of resources in the wake of component failures in the system. High Availability testing strategies at individual component level and system level is very important.

To test Openstack for HA with concurrent load operations during an availability disruption, incidents, activities and network levels Limitations we have developed to automate the High Availability testing of Openstack components.
         


              Objective

In the HA failure test through Tempest we will be testing the components of Openstack such as NOVA, CINDER, APACHE, CEPH, CONTRAIL, INTERFACE, CRM and GLANCE.
The purpose of using the tempest automation script for HA is that it is easy to implement and understand.
During the activities and incidents we perform Sanity to check the availability of Cloud and the components of Cloud. But that does not perform the HA test of the Components which are configured in HA cluster. Hence to test the availability of all the Components in Cloud we are implementing the HA Failure tempest script which will test each and every component in cloud and check if the cloud is performing well with Cluster.
These will check the components configured in each Cluster node and give us the status of the availability of each and every component after performing the tempest test with it.

             




                 Improvement in the Sanity Testing

Current Sanity: 
Currently we are running tempest script which consolidates VM creation, Volume creation, Floating IP test, Volume Snapshot test and SSH test. But it does not check the availability of the components in HA cluster. Hence to check the availability of the components in HA cluster we have implemented the HA failure Ansible script.

Improvement: 
HA failure Ansible script will not only check the basic test i.e. current Sanity test but it will also check each and every Component which are configured in HA.
Through these scripts we will check the availability of all components in HA cluster by making each component down in HA and testing its corresponding functionality.



                 Procedure and steps to implement the script

We are following below procedure to implement the Ansible script.
-	Stopping service on any one Controller/Contrail Node
-	Checking the status of the service on other two nodes
-	Performing sanity or running tempest as per the component
-	Verify if the tempest or sanity is running properly
-	Starting the service on the node
-	Follow same procedure for other two nodes in HA cluster

All scripts are located in FUEL server and will also be executed from FUEL server only.






              Components to be tested

1)	NOVA

Nova Ansible script will perform the Volume creation test for Controller nodes in cluster.

Path where all ansible scripts are located in FUEL node.
 

 

Use following command to run the script:
ansible-playbook nova-service-check.yml

Also you can login to Controller nodes and check the status of the nova service by using following command.
watch 'for i in `cd /etc/init.d/ ; ls nova-*`; do service $i status; done'

2)	CINDER
Cinder Ansible script will check the Volume creation test for Controller nodes in cluster.
 

Use following command to run the script:
ansible-playbook cinder-service-check.yml

Also you can login to Controller nodes and check the status of the nova service by using following command.
watch 'for i in `cd /etc/init.d/ ; ls cinder-*`; do service $i status; done'


3)	CRM

CRM ansible script will check all the services in HA cluster and will monitor the status of services when the crm service is down on one Controller node. And once the crm test is completed it will perform the tempest test.
 

Use following command to run the script:
ansible-playbook controller-service-restart.yml

Also you can login to Controller nodes and check the status of the nova service by using following command.
watch 'crm status'
NOTE: RABBITMQ, MYSQL and HAPROXY services are tested in CRM service. They cannot be tested individually as the pacemaker service brings UP the individual service automatically if it goes down.
But if brings down corosync service entire node is out of cluster and the HA test for all services can be tested.

4)	Interface testing

Ansible script for interface testing will test the interface bonding on each controller node. Management interface will also go down to perform the server restart test check which will remove one controller node from the cluster and the test will be perform considering only two controller nodes are UP. It will check the status of all the services in cluster and will also run tempest script.
 

Use following command to run the script:
ansible-playbook controller-interfacetesting.yml

Also you can login to Controller nodes and check the status of the nova service by using following command.
watch 'ifconfig eth0;ifconfig bond0.1003; crm status'
TOR switch:
We have bonding (bond0) in between the two interfaces eth0 and eth1. So even if one interface goes down the node will not be impacted.
Also we have two TOR switch connected to bond interface of each node. So even if anyone of TOR switch goes down the node would be reachable.
Please refer below diagram for clear understanding.
 




5)	APACHE

Ansible script for apache will perform the Horizon test. It will check if the horizon URL is accessible when the apache service is down on two controller nodes.
 

 Use following command to run the script:
ansible-playbook apache-horizon_check.yml

Also you can login to Controller nodes and check the status of the nova service by using following command.
watch 'service apache2 status'

6)	CONTRAIL

Ansible script for contrail will check the Floating IP test. Contrail services will go down on two contrail nodes and will run a tempest for Floating IP test.
 

Use following command to run the script:
ansible-playbook contrail-service-check.yml

Also you can login to Contrail nodes and check the status of the nova service by using following command.
watch 'for i in `cd /etc/init.d/ ; ls supervisor-*`; do service $i status; done'






7)	CEPH

Ansible script for ceph will check the ceph-mon status on other two nodes.
 

Use following command to run the script:
ansible-playbook ceph-mon-check.yml


8)	LDAP

Ansible script for ldap will check the status of ldap service on other node and will also check if the authentication is happening for the user on other node.
 

Use following command to run the script:
ansible-playbook ldaptest.yml

9)	SAHARA

Ansible script for SAHARA will form a Sahara cluster through selenium script and will test HA failure on all controller nodes.
 
Use following command to run the script:
ansible-playbook sahara-test.yml





10)	HEAT 

Ansible script for HEAT will create a stack on controller node and will test the HA failure on the same.
 

Use following command to run the script:
ansible-playbook heat-test.sh


