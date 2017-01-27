FROM websphere-liberty:javaee7 
MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

# Install JKE
ENV DB_HOST=172.17.0.1
ADD war /tmp/war
ADD entrypoint.sh /

RUN apt-get update \
	&& apt-get install --no-install-recommends -qqy zip \
  	&& rm -rf /var/lib/apt/lists/* \
  	&& chmod +x ./entrypoint.sh

CMD ["/entrypoint.sh"]
