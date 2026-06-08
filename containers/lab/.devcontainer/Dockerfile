ARG FROM_IMAGE
ARG FROM_VARIANT

FROM ${FROM_IMAGE}:${FROM_VARIANT}

ARG USERNAME
ARG UID
ARG GID

USER root

ENV OLD_GID="1000"

RUN sed -i -e "s/\(${USERNAME}:[^:]*:\)[^:]*:[^:]*/\1${UID}:${GID}/" /etc/passwd; \
    sed -i -e "s/\([^:]*:[^:]*:\)${OLD_GID}:/\1${GID}:/" /etc/group; \
    chown -R ${UID}:${GID} /home/${USERNAME}

COPY ./entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

ENTRYPOINT ["/bin/entrypoint"]

USER ${USERNAME}

# install the latest containerlab
RUN bash -c "$(curl -sL https://get.containerlab.dev)"

# install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --version="4.115.0"