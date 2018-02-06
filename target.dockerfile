FROM alpine:latest

RUN apk add --update openssh bash && \
    apk add nginx && \
    ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    ssh-keygen -A

RUN mkdir -p /run/nginx

EXPOSE 22
EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/sbin/sshd","-D"]
