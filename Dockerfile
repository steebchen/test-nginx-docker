FROM openresty/openresty:xenial

RUN cpan -i Test::Nginx::Socket

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["prove"]
