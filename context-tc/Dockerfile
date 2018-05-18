FROM app-docker136.hex.tno.nl/pitch-lrc/lrc:5.3.2.1-alpine

#Install application
ADD ./application /root/application

ENV IVCT_CONF /root/application

#Set entrypoint
ENV LRC_ENTRYPOINT=/root/application/start.sh
RUN chmod a+x /root/application/start.sh