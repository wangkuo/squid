FROM alpine:3.19

# 安装squid并清理缓存
RUN apk add --no-cache squid && \
    mkdir -p /var/cache/squid && \
    mkdir -p /var/log/squid && \
    chown -R squid:squid /var/cache/squid /var/log/squid

# 配置squid
COPY squid.conf /etc/squid/squid.conf

# 暴露3128端口
EXPOSE 3128

# 启动squid
CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"] 