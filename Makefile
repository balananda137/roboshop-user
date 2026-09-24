.PHONY: build run docker-build db-init clean

build:
	npm install

run:
	MONGO_URL=mongodb://localhost:27017/users node server.js

docker-build:
	docker build -t baladevops10.azurecr.io/roboshop-user .
	docker puch baladevops10.azurecr.io/roboshop-user

db-init:
	mongosh --host $${MONGO_HOST:-localhost} < db/master-data.js

clean:
	rm -rf node_modules
