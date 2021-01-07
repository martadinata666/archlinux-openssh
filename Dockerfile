FROM archlinux:latest
WORKDIR /
COPY sudoers /etc/sudoers
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm openssh sudo
RUN groupadd arch
RUN useradd -u 1000 -g arch -m -d /home/arch -s /bin/bash -p $(echo arch | openssl passwd -1 -stdin) arch
RUN gpasswd -a arch wheel
EXPOSE 22
RUN /usr/bin/ssh-keygen -A
CMD /usr/bin/sshd -D -e
