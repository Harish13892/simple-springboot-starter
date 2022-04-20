PLATFORM = --platform linux/amd64

clean:
	./gradlew clean

build:
	./gradlew build

start:
	./gradlew bootrun

tests:
	./gradlew test --info --stacktrace

run-checkstyle:
	./gradlew checkstyleMain checkstyleTest

generate-code-coverage-report:
	./gradlew clean test

environment-variable-test:
	@echo ${MY_TEST_VARIABLE}

docker-gradle-test-image:
	docker build -t test-image:1 . --target gradletest ${PLATFORM}

docker-gradle-build-image:
	docker build -t build-image:1 . --target gradlebuild ${PLATFORM}

docker-run-app:
	docker run -it -d --rm --name springboot-test build-image:1

random:
	@echo 'Hello'
