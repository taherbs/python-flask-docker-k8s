RED=\033[0;31m
GREEN=\033[32m
BLEU=\033[34m
NC=\033[0m
SERVICE=drupal

help:
	@echo -e "##########################################################################################################################"
	@echo -e "# $(GREEN)make build$(NC): Build containers."
	@echo -e "# $(GREEN)make deploy$(NC): Build and deploy containers in background mode."
	@echo -e "# $(GREEN)make deploy-fg$(NC): Build and deploy containers in foreground mode."
	@echo -e "# $(GREEN)make destroy$(NC): Destroy Containers"
	@echo -e "# $(GREEN)make ssh$(NC): Access Shell terminal inside the 'flask' container"
	@echo -e "# $(GREEN)make log$(NC): Get 'flask' container logs. CTRL+C to exit."
	@echo -e "# $(RED)make clean-docker$(NC): $(RED)(WARNING)$(NC) purge stoped containers, volumes, networks, build cache and dangling images."
	@echo -e "# $(RED)make purge-docker$(NC): $(RED)(WARNING)$(NC) kill all container then purge images, volumes, networks, build cache and dangling images."
	@echo -e "##########################################################################################################################"

deploy:
	docker-compose -f ./docker-compose.yaml up --build --remove-orphans -d

deploy-fg:
	docker-compose -f ./docker-compose.yaml up --build --remove-orphans

destroy:
	docker-compose -f ./docker-compose.yaml down

ssh:
	docker-compose -f ./docker-compose.yaml exec flask sh;

log:
	docker-compose -f ./docker-compose-$(ENV).yaml logs -f flask

clean-docker: destroy
	docker system prune --volumes

rm-docker:
	docker kill `docker ps -aq` || true
	docker rm -f `docker ps -aq` || true
	docker rmi -f `docker images -a` || true

purge-docker: rm-docker clean-docker
