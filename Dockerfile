FROM debian:latest
ADD init.sh /
EXPOSE 22556
ENTRYPOINT ["/bin/bash"]
CMD ["/init.sh"]
LABEL name="dogecoin-node" version="1.14" description="Dogecoin fullnode container based off Debian"