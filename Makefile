# Determine the operating system
OS := $(shell uname)

# Define Docker compose command
DOCKER_COMPOSE := docker-compose

# Check if Windows (requires docker-compose.exe)
ifeq ($(OS),Windows_NT)
    DOCKER_COMPOSE := docker-compose.exe
endif

# Define Docker compose service name
SERVICE_NAME := web

# Build target
build:
	@echo "Building for $(OS)"
	$(DOCKER_COMPOSE) build

# Run target
run:
	@echo "Running for $(OS)"
	$(DOCKER_COMPOSE) up -d

# Stop target
stop:
	$(DOCKER_COMPOSE) down

# Clean target
clean: stop
	$(DOCKER_COMPOSE) rm -f
	docker system prune -f

# Help target
help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker images"
	@echo "  run      - Run the Docker containers"
	@echo "  stop     - Stop the running containers"
	@echo "  clean    - Clean up containers and unused resources"
