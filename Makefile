clean:
	./gradlew clean

build: clean
	./gradlew build

start:
	./gradlew bootrun

tests:
	./gradlew test -i

run-checkstyle:
	./gradlew checkstyleMain checkstyleTest

generate-code-coverage-report:
	./gradlew clean test

environment-variable-test:
	@echo ${MY_TEST_VARIABLE}

docker-gradle-test-image:
	docker build -t test-image:1 . --target gradletest --platform linux/amd64

docker-gradle-build-image:
	docker build -t build-image:1 . --target gradlebuild --platform linux/amd64

docker-run-app:
	docker run -it -d --rm --name springboot-test build-image:1 --platform linux/amd64
