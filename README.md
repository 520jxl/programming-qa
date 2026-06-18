# Programming Q&A Archive

Claude Code 编程问答自动存档。每次我问 Claude 简单编程问题，答案会自动保存为 `.c` 文件到这里。

## 目录结构

```
programming-qa/
├── c-questions/        # .c 文件 — 编程问答存档
├── save-qa.sh          # 自动保存脚本
├── README.md
└── .gitignore
```

## 文件命名规则

```
c-questions/YYYY-MM-DD-问题标题.c
```

## 如何工作

1. 在 Claude Code 中问编程问题
2. 回答后自动运行 `save-qa.sh`，生成带注释的 `.c` 文件
3. 自动 `git commit` 到本地仓库
4. `git push` 同步到 GitHub

---

Created by Claude Code × mononoke22
