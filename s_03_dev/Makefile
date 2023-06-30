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

insert.code.wbs:
	@docker cp ../s_01_src/110wbs_src/public 110wbs_dev:usr/src/app
	@docker cp ../s_01_src/110wbs_src/src 110wbs_dev:usr/src/app

init.tailwindcss:
	@docker container exec -it 110wbs_dev npm install -D tailwindcss@3.2.4 postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/postcss.config.js 110wbs_dev:usr/src/app
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/tailwind.config.js 110wbs_dev:usr/src/app
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/index.css 110wbs_dev:usr/src/app/src
	@docker restart 110wbs_dev

#---[ 1. Api(dja) Container Manipulation ]---------------------------------

init.dev.dja: ## Initializing Django devlopment containers.
	docker compose --env-file ../dev.env up 124dja_dev -d
	docker cp ../s_03_dev/124dja_dev/requirements.txt 124dja_dev:code
	docker exec -it 124dja_dev pip install --upgrade pip
	docker exec -it 124dja_dev pip install -r requirements.txt
	docker exec -it 124dja_dev pip install markdown
	docker exec -it 124dja_dev pip install django-filter
	make startproject PROG_NAME=config
	# make startproject PROG_NAME=user_management
	# make startproject PROG_NAME=app2
	docker exec -it 124dja_dev python manage.py runserver 0.0.0.0:8000

startproject:
	docker exec -it 124dja_dev django-admin startproject $(PROG_NAME) .
	docker cp ../s_01_src/124dja_src/$(PROG_NAME)/settings.py 124dja_dev:code/$(PROG_NAME)
	docker cp ../s_01_src/124dja_src/$(PROG_NAME)/urls.py 124dja_dev:code/$(PROG_NAME)

eject.data.dja:
	docker cp 124dja_dev:code/$(PROG_NAME)/ ../s_01_src/124dja_src/
	docker cp 124dja_dev:code/db.sqlite3 ../s_01_src/124dja_src/
	docker cp 124dja_dev:code/manage.py ../s_01_src/124dja_src/

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