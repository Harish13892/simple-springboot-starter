clean:
	./gradlew clean

build:
	./gradlew build

start:
	./gradlew bootrun

tests:
	./gradlew test

run-checkstyle:
	./gradlew checkstyleMain checkstyleTest

generate-code-coverage-report:
	./gradlew clean test

environment-variable-test:
	@echo ${MY_TEST_VARIABLE}

docker-build-image:
	docker build -t test-image:1 .
