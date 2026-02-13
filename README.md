# Risk Proto

此仓库包含项目的 gRPC 协议定义文件（Proto）以及自动生成的 Go 代码。

## 目录结构

```text
.
├── gen/                # 自动生成的代码
│   └── go/             # Go 语言生成的 gRPC 和 Protobuf 文件
│       ├── captcha/    # 验证码服务相关代码
│       └── risk/       # 风控服务相关代码
├── proto/              # 原始 Proto 定义文件
│   ├── captcha/v1/     # 验证码服务 Proto (v1)
│   └── risk/v1/        # 风控服务 Proto (v1)
├── gen.bat             # Windows 下的代码生成脚本
└── go.mod              # Go 模块定义
```

## 服务定义

### 1. Risk Control Service (`proto/risk/v1`)

风控核心服务，提供以下能力：
*   **Check**: 综合风控检测（黑名单、频控）。
*   **ReportEvent**: 业务事件上报（如防暴力破解数据收集）。
*   **AddBlacklist**: 添加黑名单（管理端使用）。
*   **OnlineSelfTest**: 在线自测接口。
*   **JudgeSubmission**: 题目判题提交接口。

### 2. Captcha Service (`proto/captcha/v1`)

验证码辅助服务，提供以下能力：
*   **VerifyToken**: 验证验证码令牌的有效性。

## 开发指南

### 依赖环境

*   Protobuf Compiler (`protoc`)
*   Protoc Go Plugins:
    *   `protoc-gen-go`
    *   `protoc-gen-go-grpc`

确保以上工具已安装并配置在系统环境变量 `PATH` 中。

### 代码生成

在 Windows 环境下，运行根目录下的脚本即可重新生成代码：

```bash
.\gen.bat
```

### 引入使用

在您的 Go 项目中：

```bash
go get github.com/Pupervemon/risk-proto
```

代码引入示例：

```go
import (
    riskpb "github.com/Pupervemon/risk-proto/gen/go/risk/v1"
    captchapb "github.com/Pupervemon/risk-proto/gen/go/captcha/v1"
)
```
