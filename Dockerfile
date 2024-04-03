from python:latest

# RUN pip install --no-cache-dir jupyterhub

ARG NB_USER=jovyan
ARG NB_UID=8002
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}

# RUN mkdir /app
# COPY . /app
# RUN cd /app

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN apt install node -y
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
