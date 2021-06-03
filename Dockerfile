FROM registry.gitlab.com/dedyms/archlinux:latest
ENV SSHPORT=2222
RUN pacman -Syu --noconfirm openssh sudo nano &&  rm -rf /var/cache/pacman/pkg/* && rm -rf /var/lib/pacman/sync/*
EXPOSE 2222
WORKDIR $HOME
RUN /usr/bin/ssh-keygen -A
CMD /usr/bin/sshd -D -e -p $SSHPORT
