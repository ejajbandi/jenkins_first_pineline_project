FROM httpd:2.4
#COPY ./index.html /usr/local/apache2/htdocs/
COPY ./var/lib/docker/volumes/jenkins_data/_data/workspace/second/Elements/* /usr/local/apache2/htdocs/
