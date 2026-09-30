# claude-toolkit

An index of six small CLI tools for AI-agent workflows. This repo contains no
code — just this README and a Makefile.

Each tool is independent, lives in its own repository, and is read in full
before being listed below. Sizes are actual line counts.

## The tools

| Repo | What it actually does | Size |
|---|---|---|
| [codex-memory](https://github.com/kevindurant735rocket-creator/codex-memory) | SQLite + FTS5 keyed memory store with a `cm` CLI. Upsert, trigram search, index self-repair. 31 tests. | Python, ~280 LOC |
| [context-compass](https://github.com/kevindurant735rocket-creator/context-compass) | Walks a directory and writes a file-count / extension / directory report to `.context-map/MAP.md`. | Node, ~44 LOC |
| [macctl](https://github.com/kevindurant735rocket-creator/macctl) | Nine `osascript` / shell one-liners for macOS: batching, clipboard, keystrokes, system overview. | Node, ~105 LOC |
| [token-saver](https://github.com/kevindurant735rocket-creator/token-saver) | Chars÷4 token estimates plus line dedup, comment stripping, head/tail truncation. | Node, ~160 LOC |
| [self-heal](https://github.com/kevindurant735rocket-creator/self-heal) | Classifies a failing command's output into 6 categories and retries it. | Python, ~75 LOC |
| [test-pilot](https://github.com/kevindurant735rocket-creator/test-pilot) | Parses a `.py` file's AST and emits `def test_*` stubs with `...` arguments. | Python, ~93 LOC |

## Install

```bash
# Python
for pkg in codex-memory self-heal test-pilot; do
  pip install "git+https://github.com/kevindurant735rocket-creator/${pkg}.git"
done

# Node
for pkg in macctl token-saver context-compass; do
  npm install -g "https://github.com/kevindurant735rocket-creator/${pkg}.git"
done
```

Installed binaries: `cm`, `self-heal`, `test-pilot`, `macctl`, `ts`,
`context-compass`.

Or clone this repo next to its siblings and use the Makefile, which prefers
local `../<pkg>` paths and falls back to the git URLs:

```bash
make install
make test    # cm add/search/stats smoke test
```

`make install` only handles `codex-memory`, `self-heal`, `test-pilot`, and
`context-compass` — `macctl` and `token-saver` are in the README loop only.
The `cd ../context-compass && npm install -g .` line also ends in `|| true`, so a
failure there is silent.

## Real output

From `codex-memory`, the most complete tool here:

```
$ cm add "user/name" "Alaric"
✓ 记住: user/name
$ cm search "简洁直接"
  [fact] pref/style = 简洁直接,重产出  (hits:1)
$ cm get "user/name"
[fact] user/name = Alaric  (hits:1)
$ cm stats
条目: 4, 大小: 68 字节
```

From `context-compass`:

```
$ context-compass /tmp/ccdemo
✓ 已生成 .context-map/MAP.md
# 代码库地图: /tmp/ccdemo
## 概览
- 文件数: 4
- 入口文件: src/components/index.tsx, src/index.js
```

中文说明：这是六个独立小工具的索引仓库，本仓库本身不含代码。每个工具在各自仓库里单独安装使用。

## What this is not

- **Not a framework, package, or monorepo.** There is no shared library, no
  common interface, no version compatibility between the tools. Nothing imports
  anything else. They do not compose into a pipeline; the "toolkit" framing is
  an index page.
- **Not everything here does what its name suggests.** Read each repo's README
  before relying on it:
  - `self-heal` records a suggested fix in its history but never applies it —
    the `pip install` string is never run and no file is ever written. It
    re-runs the identical command.
  - `test-pilot` emits `f(..., ...)` stubs that raise `TypeError` as written.
    They are templates to fill in, and the advertised boundary-value generation
    does not exist in the code.
  - `token-saver` estimates tokens as `chars / 4`. It has no tokenizer, so CJK
    text is underestimated roughly 4x.
  - `context-compass` never reads file contents — it is a file census, not code
    analysis.
- **No released versions.** Nothing here is on PyPI or npm, so there are no
  version pins, no changelogs, and no upgrade path. Each install pulls whatever
  is on the default branch.
- **Unpublished to npm under these names.** `macctl` and `context-compass` are
  already taken on the npm registry by unrelated projects, which is why the
  install commands use git URLs. Do not `npm install -g macctl`.
- **No tests across the set** except in `codex-memory` (31). No CI anywhere.
- **No license file per tool**, though each individual repo carries MIT.
- These are early-stage tools with no users yet. Treat them as things to read,
  not things to depend on.

## Requirements

Per tool: Python 3.10+ for the three Python tools, Node 18+ for the three Node
tools, macOS for `macctl`.

## License

MIT for this index. Each tool carries its own MIT license.