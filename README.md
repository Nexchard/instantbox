<div align="center">

![logo](https://user-images.githubusercontent.com/5880908/53614582-6ebdfc80-3ba8-11e9-819e-d96a3f7c22f0.png)

# instantbox

几秒钟内获得一个干净、即用的 Linux 环境。

[![Docker](https://badgen.net/badge/icon/instantbox?icon=docker&label)](https://hub.docker.com/r/nexsre/instantbox)
![Python 3.11](https://badgen.net/badge/python/3.11/3776ab)
![Code Style Pep8](https://badgen.net/badge/code%20style/pep8/ffd343)

</div>

## 简介

本项目是基于 [instantbox/instantbox](https://github.com/instantbox/instantbox) 的改进版本，提供临时的 Linux 系统，可通过浏览器即时访问 Web Shell。在原项目的基础上，进行了多项改进和优化。

原始项目地址：[https://github.com/instantbox/instantbox](https://github.com/instantbox/instantbox)

### 功能特性

- 数秒内获得干净、即用的 Linux 环境
- 通过浏览器访问内置 Web Shell
- 支持多种 Linux 发行版：Ubuntu、CentOS、Arch Linux、Debian、Fedora、Alpine
- 资源管理（CPU、内存限制）
- 自动清理过期容器
- 用于容器管理的 RESTful API

### 支持的发行版

- Ubuntu（多个版本）
- CentOS（6.10、7、latest）
- Arch Linux
- Debian
- Fedora
- Alpine

## 主要改进

相比原始项目 [instantbox/instantbox](https://github.com/instantbox/instantbox)，此版本包含以下重要改进：

1. **GitHub Actions 自动化**：使用 GitHub Actions 实现 Docker 镜像的自动构建和发布，支持多架构平台（linux/amd64 和 linux/arm64）。

2. **依赖升级**：
   - Python 升级到 3.11 版本
   - Flask 升级到 2.3.0+
   - Docker SDK 升级到 6.1.0+
   - flask-cors 升级到 4.0.0+

## 快速开始

![Demo screenshot](https://user-images.githubusercontent.com/5880908/53613565-6237a500-3ba4-11e9-9e39-8ea48cee73ee.png)

## 部署

### 环境要求

- Docker [[安装指南]](https://docs.docker.com/install/)

### 一键部署

```bash
mkdir instantbox && cd $_
bash <(curl -sSL https://raw.githubusercontent.com/nexchard/instantbox/master/init.sh)
```

运行脚本后，执行：
```bash
docker-compose up -d
```

然后通过 `http://your-server-ip:8888` 访问服务

### 手动部署

1. 克隆仓库
2. 修改 `docker-compose.yml` 设置服务器 IP
3. 运行 `docker-compose up -d`

## API 接口

- `GET /v2/superinspire/getOSList` - 获取可用操作系统列表
- `GET /v2/superinspire/getOS` - 创建新容器
- `GET /v2/superinspire/rmOS` - 删除容器
- `GET /v2/superinspire/prune` - 清理过期容器

## 自动 Docker 构建

本项目使用 GitHub Actions 实现 Docker 镜像的自动构建和发布。
当向 `main` 分支推送提交或创建新标签时，
工作流将自动构建并推送 Docker 镜像到 Docker Hub。

要使用此功能，您需要在 GitHub 仓库中设置以下 secrets：
- `DOCKERHUB_USERNAME` - 您的 Docker Hub 用户名
- `DOCKERHUB_TOKEN` - 您的 Docker Hub 访问令牌

工作流支持 `linux/amd64` 和 `linux/arm64` 平台的多架构构建。


## 许可证

[MIT](LICENSE)

## 致谢

本项目基于 [instantbox/instantbox](https://github.com/instantbox/instantbox) 开发，在此感谢原作者的贡献。