BRANCH_NAME=$(shell git rev-parse --abbrev-ref HEAD)

ifeq "$(BRANCH_NAME)" "main"
ENVIRONMENT=production
else ifeq "$(BRANCH_NAME)" "dev"
ENVIRONMENT=staging
else
ENVIRONMENT=development
endif

deploy_tofu_backend:
	cd tf/backend && \
		tofu init && \
		tofu plan && \
		tofu apply


encrypt:
	./scripts/secrets.sh encrypt

decrypt:
	./scripts/secrets.sh decrypt