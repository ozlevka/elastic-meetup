
sudo sysctl -w vm.max_map_count=262144

docker run --rm -it --network host -p 9200:9200 ozlevka/elastic:5.6.3 su - elastic -s /bin/sh -c '/opt/elasticsearch/bin/elasticsearch --E cluster.name=test'

docker run --rm -it --network host -p 9200:9200 ozlevka/elastic:5.6.3 su - elastic -s /bin/sh -c '/opt/elasticsearch/bin/elasticsearch --E cluster.name=test --E network.host=10.240.0.2 --E discovery.zen.ping.unicast.hosts="10.240.0.2","10.240.0.3","10.240.0.4"'