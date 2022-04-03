FROM debian:latest
ADD init.sh /
RUN apt update \
    && apt upgrade -y \
    && apt install -y curl gpg ca-certificates tar dirmngr \
    && curl -o dogecoin.tar.gz -Lk https://github.com/dogecoin/dogecoin/releases/download/v1.14.5/dogecoin-1.14.5-x86_64-linux-gnu.tar.gz \
    && tar -xvf dogecoin.tar.gz \
    && mv dogecoin-1.14.5 /root/dogecoin-bin \
    && rm dogecoin.tar.gz
EXPOSE 22556
ENV NODES null
ENV PATH $PATH:~/dogecoin-bin/bin/
ENTRYPOINT ["/bin/bash"]
CMD ["/init.sh"]
LABEL name="dogecoin-node" version="1.14.5" description="Dogecoin fullnode container based off Debian"