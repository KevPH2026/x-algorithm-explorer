# X Algorithm Explorer

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/KevPH2026/x-algorithm-explorer)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-green.svg)](https://openclaw.ai)
[![License](https://img.shields.io/badge/license-AGPL--3.0-orange.svg)](LICENSE)

一个 **OpenClaw Agent Skill**，帮助 AI 助手理解和导航 X (Twitter) 的开源推荐算法代码库。

## 🚀 一键安装

### 方式 1：自动安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/KevPH2026/x-algorithm-explorer/main/install.sh | bash
```

### 方式 2：OpenClaw CLI

```bash
openclaw skills install KevPH2026/x-algorithm-explorer
```

### 方式 3：手动安装

```bash
git clone https://github.com/KevPH2026/x-algorithm-explorer.git
cd x-algorithm-explorer
./install.sh
```

## 📚 功能特性

### 架构理解
- **数据服务层**: tweetypie, unified-user-actions, user-signal-service
- **机器学习模型**: SimClusters, TwHIN, heavy-ranker, real-graph
- **候选源**: search-index, UTEG (GraphJet), FRS
- **产品层**: home-mixer, pushservice, tweet-mixer

### 快速导航
- 组件概览和详细说明
- For You Timeline 构建流程
- 基于图结构的推荐分析
- 内容过滤机制

## 🎯 使用方法

安装后，在你的 OpenClaw Agent 会话中可以直接提问：

### 架构问题
- "解释一下 X 的推荐算法整体架构"
- "SimClusters 是什么？如何工作？"
- "For You Timeline 是怎么构建的？"

### 组件分析
- "给我讲讲 home-mixer 的作用"
- "GraphJet 是如何做实时推荐的？"
- "heavy-ranker 用了什么神经网络模型？"

### 代码导航
- "找到 TwHIN 相关的代码位置"
- "解释 visibility filters 的实现"
- "UTEG 是什么缩写？"

## 🏗️ For You Timeline 流程

```
┌─────────────────────────────────────────────────────────────┐
│                    For You Timeline                         │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  1. 候选获取 (Candidate Sourcing)                          │
│     ├─ search-index: In-Network ~50%                       │
│     ├─ UTEG (GraphJet): Out-of-Network                     │
│     └─ FRS: 账户推荐                                        │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  2. 轻量排序 (Light Ranking)                               │
│     └─ earlybird 初步筛选                                   │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  3. 重量排序 (Heavy Ranking)                               │
│     └─ 神经网络打分 (heavy-ranker)                         │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  4. 混合与过滤 (Mixing & Filtering)                        │
│     ├─ home-mixer 混合多种来源                              │
│     └─ visibility-filters 内容过滤                          │
└─────────────────────────────────────────────────────────────┘
```

## 📁 核心组件

### 机器学习模型

| 模型 | 描述 |
|------|------|
| **SimClusters** | 社区检测和稀疏嵌入，用于兴趣建模 |
| **TwHIN** | 密集知识图谱嵌入，用户和帖子表示 |
| **Real Graph** | 预测用户之间交互的可能性 |
| **Tweepcred** | 基于 PageRank 的用户声誉算法 |
| **Heavy Ranker** | 神经网络，用于候选帖子最终排序 |

### 候选源

| 来源 | 占比 | 说明 |
|------|------|------|
| **search-index** | ~50% | In-Network 帖子索引 |
| **UTEG** | ~50% | User-Tweet Entity Graph，GraphJet 驱动 |
| **FRS** | - | Follow Recommendation Service |

### 数据服务

| 服务 | 功能 |
|------|------|
| **tweetypie** | 帖子数据核心读写服务 |
| **unified-user-actions** | 用户行为实时流处理 |
| **user-signal-service** | 显式信号（点赞、回复）和隐式信号（点击、停留） |

## 📂 项目结构

```
x-algorithm-explorer/
├── SKILL.md                    # Skill 定义（OpenClaw 读取）
├── README.md                   # 本文件
├── install.sh                  # 一键安装脚本 ⭐
├── package.sh                  # 打包脚本
├── x-algorithm-explorer.skill  # 打包后的技能文件
├── references/                 # 知识库文档
│   ├── README.md              # X 算法完整概述
│   ├── home-mixer.md          # 时间线服务详解
│   ├── product-mixer.md       # Feed 框架说明
│   └── RETREIVAL_SIGNALS.md   # 信号系统文档
└── scripts/                   # 工具脚本
    └── explore.py             # 代码导航助手
```

## 🔧 开发

### 打包 Skill

```bash
./package.sh
```

生成 `x-algorithm-explorer-2.0.0.skill` 文件，可用于分发。

### 本地测试

```bash
# 安装到本地 OpenClaw
cp -r . ~/.openclaw/skills/x-algorithm-explorer

# 测试 Skill 是否加载
openclaw skills list
```

## 📖 参考资料

- [X Engineering Blog - Algorithm Open Source](https://blog.x.com/engineering/en_us/topics/open-source/2023/twitter-recommendation-algorithm)
- [Original Repository - the-algorithm](https://github.com/twitter/the-algorithm)
- [Open Source Announcement](https://blog.x.com/en_us/topics/company/2023/a-new-era-of-transparency-for-twitter)

## 🤝 贡献

欢迎提交 Issue 和 PR！

## 📄 许可证

本项目参考 X Algorithm 代码库，遵循 [AGPL-3.0](LICENSE) 许可证。

---

<p align="center">
  Made with ❤️ for OpenClaw Agents
</p>
