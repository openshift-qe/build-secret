FROM centos/ruby-22-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db

ADD /var/run/secrets/openshift.io/build/secret1 .
COPY /var/run/secrets/openshift.io/build/secret2 .

#RUN test -f /secrets/secret1 && echo -n "secret1=" && cat /secrets/secret1
#RUN test -f /secret2 && echo -n "relative-secret2=" && cat /secret2
#RUN rm -rf /secrets && rm -rf /secret2

CMD ["true"]

USER default
