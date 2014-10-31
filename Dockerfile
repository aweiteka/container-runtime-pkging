FROM scratch
ADD pods /container-metadata/pods/
ADD services /container-metadata/services/
VOLUME /container-metadata

