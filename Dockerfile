FROM archlinux:latest
ENV HOME /home/arch
COPY sudoers /etc/sudoers
RUN pacman -Syu --noconfirm openssh sudo nano
RUN groupadd arch
RUN useradd -u 1000 -g arch -m -d /home/arch -s /bin/bash -p $(echo arch | openssl passwd -1 -stdin) arch
RUN gpasswd -a arch wheel
EXPOSE 22
WORKDIR $HOME
RUN /usr/bin/ssh-keygen -A
CMD /usr/bin/sshd -D -e
