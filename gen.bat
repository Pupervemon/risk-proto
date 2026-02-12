@echo off
echo Generating Go code...

REM 1. 生成 Go 代码
REM 确保 protoc.exe 在你的环境变量 Path 中
protoc --proto_path=proto ^
       --go_out=gen/go --go_opt=paths=source_relative ^
       --go-grpc_out=gen/go --go-grpc_opt=paths=source_relative ^
       proto/risk/v1/*.proto ^
       proto/captcha/v1/*.proto

echo Done.
pause