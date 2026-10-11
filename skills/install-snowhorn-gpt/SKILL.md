---
name: install-snowhorn-gpt
description: Install or refresh the bundled Codex v2 pet “Snowhorn GPT” when the user asks to add, install, enable, or update this pet. Do not use for unrelated pets.
---

# 安装 Snowhorn GPT

1. 确认用户明确要求安装、添加或更新该宠物。
2. Windows 运行 `scripts/install.ps1`；macOS 或 Linux 运行 `scripts/install.sh`。
3. 若目标已有不同文件，先告知用户；仅在其明确要求替换后使用 `-Force` 或 `--force`。
4. 确认输出包含 `installed=true`、`spriteVersionNumber=2`、`width=1536`、`height=2288`。
5. 提醒用户刷新 Codex，并在宠物选择器中选择 “Snowhorn GPT”。

不要修改插件自带资源，不要删除其他宠物，不要读取或输出凭据。
