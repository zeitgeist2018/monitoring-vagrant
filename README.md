# Monitoring Vagrant
This project intends to serve as an easy solution for running a complete
monitoring platform, using vagrant.

## Run it
1. Clone this repository
2. Execute `vagrant up` 
3. You can access the services on the following addresses:
    * Elasticsearch: 192.168.1.231:9200
    * Kibana: 192.168.1.231:5601
4. Run `./check-es-nodes.sh` to verify the ES is up and running.
