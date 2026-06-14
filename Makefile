install:
	@echo "安装 Python 工具..."
	pip install -e ../codex-memory 2>/dev/null || pip install "git+https://github.com/kevindurant735rocket-creator/codex-memory.git"
	pip install -e ../self-heal 2>/dev/null || pip install "git+https://github.com/kevindurant735rocket-creator/self-heal.git"
	pip install -e ../test-pilot 2>/dev/null || pip install "git+https://github.com/kevindurant735rocket-creator/test-pilot.git"
	@echo "Node 工具..."
	cd ../context-compass && npm install -g . 2>/dev/null || true
	@echo "✓ 完成"
test:
	cm add test/hello "world" && cm search hello && cm stats
