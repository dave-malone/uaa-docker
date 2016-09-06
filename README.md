# uaa-docker

A Docker image for the [UAA service](https://github.com/cloudfoundry/uaa)

## Usage

```
docker pull dmalone/uaa
docker run -d -p 8080:8080 dmalone/uaa
```

Once the container is running, test it using the [uaac](https://github.com/cloudfoundry/cf-uaac):
```
uaac target http://localhost:8080
uaac token client get admin -s adminsecret
uaac contexts
```

## Build and Publish

Clone the UAA project:
`git clone https://github.com/cloudfoundry/uaa`

Build the latest version of the UAA war:

`./gradlew :cloudfoundry-identity-uaa:war`

Copy the war file into this project directory:

`cp $UAA_REPO_DIR\uaa\build\libs\cloudfoundry-identity-uaa-VERSION.war .`

Update the name of the war file to copy into the Docker image in the Dockerfile, and build the Docker image:
`docker build -t dmalone/uaa .`


After testing, tag the image and publish to Dockerhub:
```
docker tag IMAGE_ID dmalone/uaa:VERSION
docker push dmalone/uaa
```
