# ---------------------------
# Development
# ---------------------------
build-dev: 
	docker build -t sergiopichardo/docker-react-dev -f Dockerfile.dev . 

test-dev:
	docker run --rm sergiopichardo/docker-react-dev npm run test -- --coverage

run-dev: 
	docker run -it -p 3000:3000 --rm --name docker-react-dev sergiopichardo/docker-react-dev


# ---------------------------
# Production
# ---------------------------
build-prod: 
	docker build -t sergiopichardo/docker-react . 

run-prod: 
	docker run -it -p 8080:80 --rm --name docker-react sergiopichardo/docker-react

