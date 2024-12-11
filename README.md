# ASMR One App

[English](README_en.md)

一个使用 Flutter 构建的 ASMR.ONE 客户端。

## 项目概述

ASMR One App 旨在通过精美的动画和现代化的用户界面，提供流畅愉悦的 ASMR 聆听体验。

愿景：优化 ASMR 播放体验，同时帮助 ASMR ONE 减轻服务器压力，通过更好的加载机制，每次典型点击都可以节省约 70% 流量。得益于优秀的机制设计，每次点击进入详情页面时，可以减少 90% 网络请求。

## 特性

- 稳定的后台播放，再也不用担心杀后台了
- 精美的动画效果
- 流畅的播放体验
- 简洁的UI设计
- 为服务器减轻压力，Yuro 作为独立 APP 可以实现更智能的缓存机制和请求机制，可以大幅减少流量和请求数。

## 开发准则

我们维护了一套完整的开发准则以确保代码质量和一致性：
- [开发准则](docs/guidelines_zh.md)

## 项目结构

<pre>
lib/
├── core/                 # 核心功能
├── data/                # 数据层
├── domain/              # 领域层
├── presentation/        # 表现层
└── common/             # 通用功能
</pre>

## 开始使用

1. 克隆仓库
```bash
git clone [repository-url]
```

2. 安装依赖
```bash
flutter pub get
```

3. 运行应用
```bash
flutter run
```

## 功能特性

- 现代化UI设计
- 流畅的动画效果
- ASMR 播放控制
- 播放列表管理
- 搜索功能
- 收藏功能

## 贡献指南

在提交贡献之前，请阅读我们的[开发准则](docs/guidelines_zh.md)。

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详细信息。