FROM httpd:2.4
#COPY ./index.html /usr/local/apache2/htdocs/
COPY ./jenkins_first_pineline_project/Elements/ /usr/local/apache2/htdocs/
