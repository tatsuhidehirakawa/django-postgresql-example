#.PHONY:

#---[ 1. Env Params ]------------------------------------------------------

include ../dev.env
ENV_LOC:=dev.env

PRJ_001:=config
# PRJ_002:=
# PRJ_003:=

APP_001:=users
APP_002:=profiles
# APP_003:=messages
# APP_004:=
APP_011:=contracts
# APP_012:=payments
# APP_098:=settings
# APP_099:=systems

#---[ 2. System Initialize ]-----------------------------------------------

init.dev.api: ## Initializing API(DRF) devlopment container.
	make contup
	make pipset
	make statprj
	make statapp
	make insert
	make eject
	make run

#---[ 3. System Boot ]-----------------------------------------------------

boot.dev.api: ## Booting API(DRF) devlopment container.
	make contup
	make pipset
	make insert
	make run

#---[ 4. Container Manipulation ]------------------------------------------

contup:
	cd .. && docker compose --env-file $(ENV_LOC) up $(API_CON) -d

pipset:
	docker cp ../$(API_CON)/requirements.txt $(API_CON):code
	docker exec -it $(API_CON) pip install --upgrade pip
	docker exec -it $(API_CON) pip install -r requirements.txt

statprj:
	docker exec -it $(API_CON) django-admin startproject $(PRJ_001) .

statapp:
	docker exec -it $(API_CON) python manage.py startapp $(APP_001)
	docker exec -it $(API_CON) python manage.py startapp $(APP_002)
	docker exec -it $(API_CON) python manage.py startapp $(APP_011)

insert:
	docker cp ../../s_01_src/124dja_src/. $(API_CON):code/

eject:
	docker cp $(API_CON):code/. ../../s_01_src/124dja_src/

run:
	docker exec -itd $(API_CON) python manage.py runserver 0.0.0.0:8000

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.api:
	docker container ls -a
	docker system df
	docker stop $(API_CON)
	docker rm $(API_CON)
	docker volume rm $(API_VOL)
	docker image rm $(API_IMG)
	docker builder prune -f
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------

drfver: ## Command for checking DRF version.
	docker exec -it 124dja_dev pip show djangorestframework

init.app:
	docker exec -it $(API_CON) python manage.py startapp $(APP_NEW)
	docker exec -it $(API_CON) /bin/sh -c "cd $(APP_NEW) && touch .gitkeep"
	docker cp $(API_CON):code/$(APP_NEW) ../../s_01_src/124dja_src/

createuser:
	docker exec -it $(API_CON) python manage.py createsuperuser \
	--email $(E_MAIL) --username $(USER_NAME)

migrate:
	docker exec -it $(API_CON) python manage.py makemigrations
	docker exec -it $(API_CON) python manage.py migrate


