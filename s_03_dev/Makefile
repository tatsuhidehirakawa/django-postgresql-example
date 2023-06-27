#.PHONY:


#---[ 1. system initialize ]-----------------------------------------------

init.dev: ## Initializing only frontend devlopment containers.
	make init.dev.dbs
	make init.dev.api
	make init.dev.wbs
	@echo "Succeful initializing devlopment environment!"

init.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d

# init.dev.api: ## Booting only frontend devlopment containers.
# 	docker compose --env-file ../dev.env up 124api_dev -d

# init.dev.wbs: ## Initilazing only frontend devlopment containers.
# 	docker compose --env-file ../dev.env up 110wbs_dev -d

init.dev.dja:
	docker compose --env-file ../dev.env up 124dja_dev -d
	docker exec -it 124dja_dev django-admin startproject config . 
	docker exec -it 124dja_dev python manage.py runserver 0.0.0.0:8000

#---[ 2. system booting ]-----------------------------------------------

boot.dev:
	make boot.dev.dbs
	make boot.dev.api
	make boot.dev.wbs
	make set.code.dev
	@echo "Succeful booting devlopment environment!"

boot.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d

boot.dev.api: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 124api_dev -d

boot.dev.wbs: ## Initilazing only frontend devlopment containers.
	docker compose --env-file ../dev.env up 110wbs_dev -d
	@make init.tailwindcss

set.code.dev:
	@make insert.data.dbs
	@make insert.code.wbs