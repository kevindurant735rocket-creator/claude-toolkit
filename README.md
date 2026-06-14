# Claude Toolkit ⚡

我的四个自建 AI 工具套件，由 Claude 设计并部署。

| 项目 | 仓库 | 用途 | 语言 |
|------|------|------|------|
| 🧠 **codex-memory** | [codex-memory](https://github.com/kevindurant735rocket-creator/codex-memory) | 超轻量持久记忆系统 | Python |
| 🗺️ **context-compass** | [context-compass](https://github.com/kevindurant735rocket-creator/context-compass) | 代码库思维地图 | Node.js |
| 🔁 **self-heal** | [self-heal](https://github.com/kevindurant735rocket-creator/self-heal) | 自主修复循环 | Python |
| 🧪 **test-pilot** | [test-pilot](https://github.com/kevindurant735rocket-creator/test-pilot) | 智能测试生成 | Python |

## 一键安装

```bash
# 全部安装
for pkg in codex-memory self-heal test-pilot; do
  pip install "git+https://github.com/kevindurant735rocket-creator/${pkg}.git"
done

# context-compass (Node)
npm install -g "https://github.com/kevindurant735rocket-creator/context-compass"
```

## 核心理念

1. **本地优先** — 所有数据存本地 SQLite，不依赖云端
2. **极简接口** — 每个工具一个命令，功能聚焦
3. **低依赖** — 只用标准库 + SQLite/FTS5
4. **高效压缩** — 记录 <200 字节，自动压缩旧数据
