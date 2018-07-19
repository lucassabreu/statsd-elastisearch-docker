all: build

build:
	docker build . --tag=lucassabreu/stastd-elasticsearch-backend
