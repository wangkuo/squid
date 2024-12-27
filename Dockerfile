FROM alpine:3.19

# 安装squid和apache2-utils(用于htpasswd命令)
RUN apk add --no-cache squid apache2-utils && \
    mkdir -p /var/cache/squid && \
    mkdir -p /var/log/squid && \
    chown -R squid:squid /var/cache/squid /var/log/squid

# 设置时区为Asia/Shanghai
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 创建认证密码文件
RUN touch /etc/squid/passwd && \
    chown squid:squid /etc/squid/passwd && \
    # 创建默认用户名密码：proxy/proxy123
    htpasswd -bc /etc/squid/passwd proxy proxy123

# 配置squid
COPY squid.conf /etc/squid/squid.conf

# 暴露3128端口
EXPOSE 3128

# 启动squid
CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"] 