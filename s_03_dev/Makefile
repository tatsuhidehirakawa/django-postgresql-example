#.PHONY:


#---[ 1. system initialize ]-----------------------------------------------

init.dev: ## Initializing only frontend devlopment containers.
	make init.dev.dbs
	make init.dev.api
	make init.dev.wbs
	@echo "Succeful initializing devlopment environment!"

# init.dev.api: ## Booting only frontend devlopment containers.
# 	docker compose --env-file ../dev.env up 124api_dev -d

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	docker compose --env-file ../dev.env up 110wbs_dev -d



#---[ 1. Api(dja) Manipulation ]-----------------------------------------------

init.dev.dja: ## Initializing Django devlopment containers.
	docker compose --env-file ../dev.env up 124dja_dev -d
	docker cp ../s_03_dev/124dja_dev/requirements.txt 124dja_dev:code
	docker exec -it 124dja_dev pip install -r requirements.txt
	docker exec -it 124dja_dev django-admin startproject config . 
	docker exec -it 124dja_dev python manage.py runserver 0.0.0.0:8000

eject.data.dja:
	@docker cp 124dja_dev:code/config ../s_01_src/124dja_src/
	@docker cp 124dja_dev:code/manage.py ../s_01_src/124dja_src/

insert.code.dja:
	@docker cp ../s_01_src/124dja_src/public 124dja_dev:code
	@docker cp ../s_01_src/124dja_src/src 124dja_dev:code

boot.dev.api: ## Booting  Django devlopment containers.
	docker compose --env-file ../dev.env up 124api_dev -d
	docker exec -it 124dja_dev python manage.py runserver 0.0.0.0:8000

#---[ 1. Dbs Manipulation ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d




#---[ 2. system booting ]-----------------------------------------------

boot.dev:
	make boot.dev.dbs
	make boot.dev.api
	make boot.dev.wbs
	make set.code.dev
	@echo "Succeful booting devlopment environment!"

boot.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d


boot.dev.wbs: ## Initilazing only frontend devlopment containers.
	docker compose --env-file ../dev.env up 110wbs_dev -d
	@make init.tailwindcss

set.code.dev:
	@make insert.data.dbs
	@make insert.code.wbs