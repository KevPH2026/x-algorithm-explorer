# X Viral Engine

[![Version](https://img.shields.io/badge/version-3.0.0-blue.svg)](https://github.com/KevPH2026/x-algorithm-explorer)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-green.svg)](https://openclaw.ai)
[![License](https://img.shields.io/badge/license-AGPL--3.0-orange.svg)](LICENSE)

> **理解 X 算法 → 反向工程 → 生成算法喜欢的内容**

基于 X (Twitter) 推荐算法反向工程的 **Viral 内容生成器**。

## 🚀 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/KevPH2026/x-algorithm-explorer/main/install.sh | bash
```

## 💡 使用方法

安装后，直接对你的 Agent 说：

### 生成 Viral 内容
```
"给我生成一个 viral X 帖子"
"写个能火的推文"
"关于 [AI 工具] 的 viral 帖子"
```

### 优化现有内容
```
"优化这个帖子让它能火"
"viral 优化: [粘贴你的内容]"
```

### 蹭热点流量
```
"蹭 [热点事件] 的流量"
"为 [话题] 设计 viral 内容"
```

## ✨ 核心功能

| 功能 | 说明 |
|------|------|
| 🚀 **Viral Post 生成** | 基于算法偏好，一键生成高流量帖子 |
| 📝 **内容优化** | 分析并优化已有内容，提升传播概率 |
| 🔥 **热点追踪** | 识别当前算法偏好的话题类型 |
| 🎣 **Hook 生成器** | 生成前 3 秒抓眼球的开头 |
| 🧵 **Thread 设计** | 优化多 tweet 结构，提升停留时间 |
| ⏰ **时间建议** | 最佳发布时间推荐 |

## 📊 X 算法核心洞察

### 算法偏好的内容特征

| 特征 | 说明 | 策略 |
|------|------|------|
| **停留时间** | 用户阅读时长是关键指标 | Thread 结构、悬念设计 |
| **互动信号** | 回复 > 转发 > 点赞 | 评论区互动设计 |
| **时间衰减** | 新内容优先 | 实时热点蹭流量 |
| **个性化** | 基于用户兴趣图谱 | 标签精准匹配 |

### Viral Formula

```
Viral Score = Hook (30%) + Value (40%) + Engagement (20%) + Timing (10%)
```

## 🎯 使用示例

### 示例 1：生成 Viral Thread

**你说：** `"关于 AI coding 的 viral 帖子"`

**Agent 输出：**
```
🚀 VIRAL POST GENERATED

【Thread 内容】
1/ 我花了 6 个月学会编程。
上周用 AI 写代码，6 小时完成了同样的项目。

这是我在 X 上学到的 7 个 AI 编程技巧 👇

2/ [技巧1]...
...

【算法优化点】
✅ Thread 结构（多 tweet = 更多停留时间）
✅ 数字开头（高点击率）
✅ 对比冲突（情感共鸣）
✅ 互动引导（评论区提问）

【最佳发布时间】
📅 周二/周四 上午 9-11 AM EST
📊 预估互动率: +150%

【标签建议】
#AI #Coding #ViralTips #BuildInPublic
```

### 示例 2：优化现有内容

**你说：** `"viral 优化: 我们发布了一个新产品，欢迎大家试用"`

**Agent 输出：**
```
🔍 CONTENT ANALYSIS

【原内容评分】流量潜力: 2/10 ❌

【问题诊断】
❌ 无 Hook（平淡开场）
❌ 无价值承诺
❌ 无情感共鸣
❌ 无互动设计

【Viral 改写版本】

版本 A (数据对比型):
"上线 48 小时，1000+ 用户，0 行代码。

我们做了一个不用编程就能构建 AI 应用的工具。

你想用它做什么？👇"

【预计效果】
改写后流量潜力: 8/10 ✅
预估互动提升: +300%
```

### 示例 3：热点蹭流量

**你说：** `"蹭 OpenAI 新发布的流量"`

**Agent 输出：**
```
🔥 TRENDING OPPORTUNITY

【热点分析】
话题: OpenAI 发布 GPT-5
热度: 🔥🔥🔥🔥🔥 (极高)
最佳切入时间: 发布后 2-6 小时

【Viral 切入角度】

角度 1 (快速总结):
"GPT-5 发布了，5 分钟看完重点:

1. ...
2. ...
...

你最想用哪个功能？"

【发布策略】
⏰ 最佳时间: 发布后 3 小时
📊 预估曝光: 10万+
```

## 🎨 Hook 模板

### 数字对比型
- "X 年前我 ____，现在我 ____"
- "用了 X 天 ____，结果 ____"
- "X% 的人不知道 ____"

### 反常识型
- "不要再 ____ 了"
- "____ 是个谎言"
- "____ 正在毁掉你"

### 个人故事型
- "我被 ____ 了"
- "上周我 ____"
- "X 年前我不信 ____, 现在我 ____"

### 问题悬念型
- "为什么 ____?"
- "____ 的秘密是什么?"
- "如果 ____ 怎么办?"

## 📅 最佳发布时间

| 类型 | 最佳时间 |
|------|---------|
| B2B 内容 | 周二-周四 9-11 AM EST |
| 娱乐内容 | 晚上 8-10 PM EST |
| 热点跟进 | 发布后 2-6 小时内 |
| Thread | 上午发布 |

## 📁 项目结构

```
x-viral-engine/
├── SKILL.md                    # Skill 定义
├── README.md                   # 本文件
├── install.sh                  # 一键安装 ⭐
├── package.sh                  # 打包脚本
├── references/
│   ├── X_ALGORITHM_INSIGHTS.md # 算法反向工程
│   ├── VIRAL_TEMPLATES.md      # Viral 内容模板
│   └── HOOK_LIBRARY.md         # Hook 模板库
├── templates/
│   ├── thread_templates/       # Thread 结构模板
│   ├── single_tweet/           # 单条推文模板
│   └── engagement_hooks/       # 互动设计模板
└── examples/
    └── viral_examples.md       # 成功案例
```

## 🔧 开发

### 打包 Skill

```bash
./package.sh
```

生成 `x-viral-engine-3.0.0.skill` 文件。

### 本地测试

```bash
cp -r . ~/.openclaw/skills/x-viral-engine
openclaw skills list
```

## 📖 原理

这个 Skill 基于对 X (Twitter) 开源推荐算法的深度分析：

1. **算法理解** - 解析 X 的 home-mixer、heavy-ranker、GraphJet 等核心组件
2. **反向工程** - 推导出算法偏好的内容特征
3. **内容生成** - 基于这些特征生成高传播概率的内容

## 🤝 贡献

欢迎提交 Issue 和 PR！

## 📄 许可证

[AGPL-3.0](LICENSE)

---

<p align="center">
  Made with ❤️ for Viral Content Creators
</p>
