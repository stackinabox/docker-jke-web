FROM websphere-liberty:javaee7 
MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

# Install JKE
COPY war /tmp/war

RUN apt-get update \
	&& apt-get install --no-install-recomends -qqy zip \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& zip -r /tmp/JKE.war /tmp/war \
  	&& cp /tmp/JKE.war /config/dropins/ \
  	&& rm -rf /tmp/war*

CMD ["/opt/ibm/docker/docker-server", "run" "defaultServer"]
