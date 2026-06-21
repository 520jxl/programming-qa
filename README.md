# C++ Debugger Test (GDB DAP)

使用 GDB 内置 DAP + gdb-dap 扩展在 VS Code 中调试 C++ 程序。

## 环境

- **编译器**: `C:\msys64\ucrt64\bin\g++.exe`
- **调试器**: `C:\msys64\ucrt64\bin\gdb.exe` (GDB 17.2，支持 `-i dap`)
- **VS Code 扩展**: `OlegTolmatcev.gdb-dap` v0.2.10

## 使用方法

1. 在 VS Code 中打开 `main.cpp`
2. 在某一行行号左侧点击设置断点（红点）
3. 按 `F5` 启动调试（会自动编译）
4. 使用调试工具栏：继续(F5)、单步跳过(F10)、单步进入(F11)、停止(Shift+F5)
5. 在左侧 **变量** 面板查看变量值
6. 在 **调用堆栈** 面板查看函数调用链

## 文件结构

```
cpp-debug-test/
├── .vscode/
│   ├── launch.json    # 调试启动配置
│   ├── tasks.json     # 编译任务
│   └── settings.json  # GDB 路径设置
├── main.cpp           # 测试程序
└── main.exe           # 编译产物
```
