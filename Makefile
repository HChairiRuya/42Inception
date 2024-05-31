# Define colors
GREEN := \033[0;32m
RED := \033[0;31m
NC := \033[0m

DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
D_SECRETS :=./secrets

# password generation command
GENERATE_PASSWORD_CMD := openssl rand -base64 20

# Targets
all: generate_passwords run

build:
	@echo "$(GREEN)Building Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

run: generate_passwords
	@echo "$(GREEN)Starting Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

stop:
	@echo "$(RED)Stopping Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@echo "$(RED)Cleaning Docker Compose setup...$(NC)"
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v --remove-orphans

fclean: clean
	@sudo rm -drf /home/hchairi/data/wordpress_d_volume/*
	@sudo rm -drf /home/hchairi/data/mariadb_d_volume/*
	@sudo docker system prune -af
	@sudo rm -rf $(D_SECRETS)

re: stop fclean build run

# Target to generate passwords
generate_passwords: $(D_SECRETS)/db_password.txt $(D_SECRETS)/admin_password.txt $(D_SECRETS)/user_password.txt

$(D_SECRETS)/%.txt: | $(D_SECRETS)
	@echo "Generating password for $*"
	@$(GENERATE_PASSWORD_CMD) > $@

# Ensure the secrets directory exists
$(D_SECRETS):
	@mkdir -p $@

.PHONY: all build run stop clean re generate_passwords
