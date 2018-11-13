# Test::Nginx Docker Image

Provides the [Test::Nginx::Socket](https://metacpan.org/pod/Test::Nginx::Socket) utility as a docker image. We use the Test::Nginx::Socket image because it fixes a lot of things in the normal [Test::Nginx](https://github.com/openresty/test-nginx) package.

## Quickstart

To run your nginx tests, use the following dockerfile.

```Dockerfile
FROM steebchen/nginx-test
COPY . ./
```

No CMD instruction is needed, as the base image automatically runs `prove`.
It also uses [tini](https://github.com/krallin/tini) so signals work properly.

Now simply build & run the container as follows to run your tests.

```bash
docker build my-tests .
docker run my-tests
```

## Setting environment variables

If you need to use environment variables, simply specific them in your dockerfile as follows or with the `--env` docker CLI flag.

```Dockerfile
FROM steebchen/nginx-test

ENV TEST_NGINX_CLIENT_PORT=80
ENV TEST_NGINX_NO_NGINX_MANAGER=1

COPY . ./
```

## Use external nginx instance

When running your own nginx instance like I do in the example above, you can provide another container's network to reach it:

```bash
docker build -t my-tests .
docker run --network container:my-app my-tests
```
