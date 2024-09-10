BRANCH_NAME=$(shell git rev-parse --abbrev-ref HEAD)

ifeq "$(BRANCH_NAME)" "main"
ENVIRONMENT=production
else ifeq "$(BRANCH_NAME)" "dev"
ENVIRONMENT=staging
else
ENVIRONMENT=development
endif


test:
	echo $(ENVIRONMENT)			