FROM registry.gitlab.com/dedyms/archlinux:latest
RUN pacman -Syu --noconfirm openssh sudo nano &&  rm -rf /var/cache/pacman/pkg/* && rm -rf /var/lib/pacman/sync/*
EXPOSE 22
WORKDIR $HOME
RUN /usr/bin/ssh-keygen -A
CMD /usr/bin/sshd -D -e
