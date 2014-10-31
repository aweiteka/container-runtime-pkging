## How do you deliver container run-time metadata?

Packaging applications as container images only solves half of the application packaging and lifecycle problem. How the applications are run is the other half. Here are some of the options you have:

* straight `docker run`
* systemd unitfile
* kubernetes
* some wrapper
* flavor-of-the-month

## What if these files were packaged in a container?

A data-only container is a valid use of Docker. Consider this Dockerfile:
```
FROM scratch
ADD metadata /container-metadata/
VOLUME /container-metadata
```

The container will fail to run without a valid `ENTRYPOINT` or `CMD` but the contents will be available as a stopped container. From there we have several options:

* use `--volumes-from <stopped_container>`
* mount the volume on the host
* integrate into kubernetes and access from there
