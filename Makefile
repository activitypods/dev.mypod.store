DOCKER_COMPOSE_PROD=docker compose --env-file .env --env-file .env.local

# Build and start

start: 
	$(DOCKER_COMPOSE_PROD) up -d

stop:
	$(DOCKER_COMPOSE_PROD) kill
	$(DOCKER_COMPOSE_PROD) rm -fv

# Maintainance

upgrade:
	$(DOCKER_COMPOSE_PROD) pull
	$(DOCKER_COMPOSE_PROD) up -d

logs:
	$(DOCKER_COMPOSE_PROD) logs -f activitypods-backend

attach:
	$(DOCKER_COMPOSE_PROD) exec activitypods-backend pm2 attach 0

config:
	$(DOCKER_COMPOSE_PROD) config

# Welcome to my place

wtmp-logs:
	$(DOCKER_COMPOSE_PROD) logs -f wtmp-backend

wtmp-attach:
	$(DOCKER_COMPOSE_PROD) exec wtmp-backend pm2 attach 0

# Mutual-Aid

mutualaid-logs:
	$(DOCKER_COMPOSE_PROD) logs -f mutualaid-backend

mutualaid-attach:
	$(DOCKER_COMPOSE_PROD) exec mutualaid-backend pm2 attach 0

# Mastopod

mastopod-logs:
	$(DOCKER_COMPOSE_PROD) logs -f mastopod-backend

mastopod-attach:
	$(DOCKER_COMPOSE_PROD) exec mastopod-backend pm2 attach 0
