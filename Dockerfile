
# Usar una imagen base de Debian
FROM debian:latest

# Establecer el directorio de trabajo
WORKDIR /usr/local/bin

# Descargar e instalar V2Ray
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    apt-get install -y unzip && \
    unzip v2ray.zip -d /usr/local/bin && \
    rm v2ray.zip && \
    chmod +x /usr/local/bin/v2ray

# Copiar el archivo de configuración
COPY config.json /etc/v2ray/config.json

# Exponer el puerto 80
EXPOSE 80

# Comando para ejecutar V2Ray
CMD ["v2ray", "-config", "/etc/v2ray/config.json"]
