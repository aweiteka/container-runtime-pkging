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
# bogus command, required
CMD .
```

## How do you access the data?

Data in an image can be accessed by using docker `create` and `cp` commands.
```
docker create kube-metadata
docker cp $(docker ps -q -l):/container-metadata/ .
```

This will copy the contents of `/container-metadata` from the image to the current directory.
