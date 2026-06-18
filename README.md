# Claude Toolkit ⚡

Claude 设计并部署的 AI 效率工具套件。

## 工具清单

| 项目 | 用途 | 语言 |
|------|------|------|
| 🧠 **codex-memory** | 轻量持久记忆系统 (SQLite+FTS5) | Python |
| 🗺️ **context-compass** | 代码库思维地图 | Node.js |
| 🔁 **self-heal** | 自主修复循环 | Python |
| 🧪 **test-pilot** | 智能测试生成器 | Python |
| 🤖 **macctl** | macOS AI 自动化 + 批处理省 token | Node.js |
| 💰 **token-saver** | LLM token 省流器: 压缩/去重/预算 | Node.js |

## 安装

```bash
# Python 工具
for pkg in codex-memory self-heal test-pilot; do
  pip install "git+https://github.com/kevindurant735rocket-creator/${pkg}.git"
done

# Node 工具
for pkg in macctl token-saver context-compass; do
  npm install -g "https://github.com/kevindurant735rocket-creator/${pkg}.git"
done
```
