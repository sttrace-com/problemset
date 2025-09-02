FROM {{ base_image }}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        {% if external_packages %}
        {% for package in external_packages %}
        {{ package }} \
        {% endfor %}
        {% else %}
        openssh-server \
        sudo \
        acl \
        {% endif %} && \
    mkdir /var/run/sshd && \
    ssh-keygen -A

# Dummy password which can be overriden in setup.sh by env vars when starting new container
RUN useradd -ms /bin/bash admin && \
    echo 'admin:ubuntu' | chpasswd && \
    usermod -aG sudo admin && \
    echo "admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN useradd -ms /bin/bash ubuntu && \
    echo 'ubuntu:ubuntu' | chpasswd

#TODO: Make sure users cannot edit this file and give themselves extra permissions
RUN echo "ubuntu ALL=(ALL) NOPASSWD: /usr/bin/apt, /usr/bin/apt-get, /usr/bin/dpkg, /usr/bin/apt-cache" > /etc/sudoers.d/ubuntu-apt && \
    chmod 440 /etc/sudoers.d/ubuntu-apt

RUN groupadd shared && \
    usermod -aG shared admin && \
    usermod -aG shared ubuntu

RUN chown admin:admin /home/admin && \
    chmod 750 /home/admin && \
    setfacl -m u:ubuntu:--- /home/admin && \
    chown ubuntu:shared /home/ubuntu && \
    chmod 775 /home/ubuntu

COPY  ./ /home/admin

RUN /home/admin/init_task

COPY ./setup.sh /

EXPOSE 22

ENTRYPOINT ./setup.sh