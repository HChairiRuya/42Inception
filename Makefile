# Define colors
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m

# Docker Compose file
DOCKER_COMPOSE_FILE := srcs/docker-compose.yml

# Targets
.PHONY: all build run stop clean re

all: build run

build:
	@echo "$(GREEN)Building Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

run:
	@echo "$(GREEN)Starting Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

stop:
	@echo "$(RED)Stopping Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@echo "$(RED)Cleaning Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v --remove-orphans && \
	sudo rm -drf /home/hchairi/data/wordpress_d_volume/* && \
	sudo rm -drf /home/hchairi/data/mariadb_d_volume/*
# fclean

# clean:
# 	@echo "$(RED)Cleaning Docker Compose setup...$(NC)"
# 	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v --remove-orphans

re: stop clean build run
