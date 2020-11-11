export GO111MODULE=on

# 清除所有Git未追踪文件
clean:
	git clean -dxf

fmt:
	go fmt ./...