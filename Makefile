# Define colors
GREEN := \033[0;32m
RED := \033[0;31m
NC := \033[0m

DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
D_SECRETS := ./secrets

# Define the command to generate a random password
GENERATE_PASSWORD_CMD := openssl rand -base64 20

# Generate password files
$(D_SECRETS)/%.txt: | $(D_SECRETS)
	$(GENERATE_PASSWORD_CMD) > $@

# Targets
all: generate_passwords build run

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
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v --remove-orphans \

fclean: clean
	@sudo rm -drf /home/hchairi/data/wordpress_d_volume/*
	@sudo rm -drf /home/hchairi/data/mariadb_d_volume/*
	@sudo rm -rf $(D_SECRETS)

re: stop clean build run

generate_passwords: $(patsubst %,$(D_SECRETS)/%.txt, db_password admin_password user_password)

$(D_SECRETS):
	@mkdir -p $@

.PHONY: all build run stop clean re generate_passwords
