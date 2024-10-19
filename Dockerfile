FROM bellsoft/liberica-openjdk-alpine:21.0.4

# Install curl jq
RUN apk add curl jq

# workspace
WORKDIR /home/selenium-docker

# add the required files
ADD target/docker-resources ./
ADD runner.sh runner.sh

# run the tests
ENTRYPOINT sh runner.sh

# java -Dselenium.grid.enabled=true -Dselenium.grid.hubHost=192.168.1.4 -cp 'libs/*' org.testng.TestNG test-suites/vendor-portal.xml