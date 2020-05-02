CONTAINER_NAME=docker-react
IMAGE_NAME=sergiopichardo/$(CONTAINER_NAME)

build: 
	docker build --tag $(IMAGE_NAME) --file Dockerfile.dev . 

test:
	docker run --rm $(IMAGE_NAME) npm run test -- --coverage

	