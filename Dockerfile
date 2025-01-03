# Usar una imagen base, por ejemplo, Ubuntu
FROM ubuntu:20.04

# Instalar servidor SSH
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install python3 -y

# Crear directorio para el proceso SSH
RUN mkdir /var/run/sshd

# Permitir autenticación por contraseña (opcional, pero menos seguro)
RUN echo 'root:12345678' | chpasswd

# Configurar SSH para permitir acceso remoto
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Exponer el puerto SSH
EXPOSE 22

# Iniciar el servidor SSH
CMD ["/usr/sbin/sshd", "-D"]