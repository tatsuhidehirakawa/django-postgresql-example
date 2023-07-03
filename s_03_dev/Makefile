#.PHONY:

#---[ 1. system initialize ]-----------------------------------------------

init.dev: ## Initializing only frontend devlopment containers.
	make init.dev.dbs
	make init.dev.api
	make init.dev.wbs
	@echo "Succeful initializing devlopment environment!"

# init.dev.api: ## Booting only frontend devlopment containers.
# 	docker compose --env-file ../dev.env up 124api_dev -d

#---[ 2. Web Container(110wbs_dev) Manipulation ]---------------------------

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

#---[ 3. API Container(124dja_dev) Manipulation ]---------------------------

CONT_NAME:=124dja_dev
PROJ_NAME:=config
APP_NAME_1:=users
APP_NAME_2:=news
APP_NAME_3:=blog
# APP_NAME_4:=
# APP_NAME_5:=
E_MAIL:=admin@example.com
USER_NAME:=admin

boot.dev.dja: ## Booting  Django devlopment containers.
	make contup.dja
	make pipset.dja
	make insert.dja
	make migrate.dja
	make run.dja

init.dev.dja: ## Initializing Django devlopment containers.
	make contup.dja
	make pipset.dja
	make statprj.dja
	make statapp.dja
	docker cp ../s_01_src/124dja_src/$(PROJ_NAME)/settings.py $(CONT_NAME):code/$(PROJ_NAME)
	docker cp ../s_01_src/124dja_src/$(PROJ_NAME)/urls.py $(CONT_NAME):code/$(PROJ_NAME)
	make migrate.dja
	make eject.dja
	make run.dja

createuser.dja:
	docker exec -it $(CONT_NAME) python manage.py createsuperuser --email $(E_MAIL) --username $(USER_NAME)

contup.dja:
	docker compose --env-file ../dev.env up $(CONT_NAME) -d

run.dja:
	docker exec -it $(CONT_NAME) python manage.py runserver 0.0.0.0:8000

pipset.dja:
	docker cp ../s_03_dev/$(CONT_NAME)/requirements.txt $(CONT_NAME):code
	docker exec -it $(CONT_NAME) pip install --upgrade pip
	docker exec -it $(CONT_NAME) pip install -r requirements.txt

statprj.dja:
	docker exec -it $(CONT_NAME) django-admin startproject $(PROJ_NAME) .

statapp.dja:
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_1)
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_2)
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_3)

migrate.dja:
	docker exec -it $(CONT_NAME) python manage.py makemigrations
	docker exec -it $(CONT_NAME) python manage.py migrate

insert.dja:
	docker cp ../s_01_src/124dja_src/manage.py $(CONT_NAME):code/
	docker cp ../s_01_src/124dja_src/$(PROJ_NAME) $(CONT_NAME):code/$(PROJ_NAME)
	docker cp ../s_01_src/124dja_src/$(APP_NAME_1) $(CONT_NAME):code/$(APP_NAME_1)
	docker cp ../s_01_src/124dja_src/$(APP_NAME_2) $(CONT_NAME):code/$(APP_NAME_2)
	docker cp ../s_01_src/124dja_src/$(APP_NAME_3) $(CONT_NAME):code/$(APP_NAME_3)

eject.dja:
	docker cp $(CONT_NAME):code/manage.py ../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(PROJ_NAME)/ ../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_1) ../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_2) ../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_2) ../s_01_src/124dja_src/

drfver:
	docker exec -it 124dja_dev pip show djangorestframework


#---[ 4. Dbs Manipulation ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d




#---[ 5. system booting ]-----------------------------------------------

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




purge.cont.all:
	docker container ls -a
	docker system df
	docker stop $$(docker ps -q)
	docker volume rm $$(docker volume ls -qf dangling=true)
	docker container prune -f
	docker image prune -a -f
	docker builder prune -f
	# docker images -a -f
	# docker container ls -a
	# docker system df


ddd:
	docker image prune -a -f

ccc:
	docker container ls -a; docker system df; docker stop $(docker ps -q); docker volume rm $(docker volume ls -qf dangling=true); docker container prune -f; docker image prune -a -f; docker builder prune -f; docker images -a -f; docker container ls -a; docker system df