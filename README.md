# Squid Proxy Container

一个轻量级的 Squid 代理服务器容器，基于 Alpine Linux，支持基本的用户认证功能。

## 功能特点

- 基于 Alpine Linux 的轻量级容器
- 内置基本的用户认证
- 支持 HTTP/HTTPS 代理
- 默认使用中国时区 (Asia/Shanghai)
- 使用阿里云 DNS (223.5.5.5, 223.6.6.6)

## 快速开始

### 使用 Docker 运行
```bash
docker run -d \
--name squid-proxy \
-p 3128:3128 \
your-username/squid-light:latest
```
### 默认认证信息

1.使用默认账号：
- 用户名：proxy
- 密码：proxy123

2.如果需要修改密码，可以在容器中执行：
```bash
htpasswd -b /etc/squid/passwd username password
```

## 使用示例

### curl 示例
```bash
curl -x "http://proxy:proxy123@localhost:3128" https://example.com
```
### 浏览器配置
1. 代理服务器：你的服务器IP或域名
2. 端口：3128
3. 认证信息：proxy/proxy123

## 配置说明

- 代理端口：3128
- 最大缓存对象大小：100 MB
- 缓存内存：256 MB
- DNS 服务器：阿里云 DNS (223.5.5.5, 223.6.6.6)

## 构建信息

本镜像通过 GitHub Actions 自动构建并发布到 Docker Hub。