PROTO=protos
GEN=./gen/go

dependencies:
	sudo apt install -y protobuf-compiler
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2


generate_sso:
	protoc -I ${PROTO} ${PROTO}/sso/sso.proto --go_out=${GEN} --go_opt=paths=source_relative --go-grpc_out=${GEN} --go-grpc_opt=paths=source_relative

generate: dependencies generate_sso
