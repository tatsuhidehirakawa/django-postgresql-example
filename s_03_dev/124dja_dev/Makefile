#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

API_CONT:=124dja_dev
API_VOLUME:=s_03_dev_api-vol
API_IMAGE:=s_03_dev-124dja_dev

WBS_VOLUME:=s_03_dev_wbs-vol

ENV_LOC:=../dev.env

PRJ_NAME_01:=config
# PRJ_NAME_02:=
APP_NAME_01:=users
APP_NAME_02:=profiles
# APP_NAME_03:=message
# APP_NAME_04:=
APP_NAME_11:=plans
# APP_NAME_12:=
# APP_NAME_98:=settings
# APP_NAME_99:=systems

E_MAIL:=admin@example.com
USER_NAME:=admin

#---[ 2. System initialize ]-----------------------------------------------

init.dev.api: ## Initializing DRF devlopment containers.
	make contup.dja
	make pipset.dja
	make statprj.dja
	make statapp.dja
	docker cp ../../s_01_src/124dja_src/$(PRJ_NAME_01) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_01) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_02) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_11) $(API_CONT):code/
	make eject.dja
	make run.dja
	docker volume rm $(WBS_VOLUME)

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.api: ## Booting  Django devlopment containers.
	make contup.dja
	make pipset.dja
	make insert.dja
	make run.dja
	docker volume rm $(WBS_VOLUME)

#---[ 4. Container Manipulation ]------------------------------------------

createuser.dja:
	docker exec -it $(API_CONT) python manage.py createsuperuser --email $(E_MAIL) --username $(USER_NAME)

contup.dja:
	cd .. && docker compose --env-file $(ENV_LOC) up $(API_CONT) -d

run.dja:
	docker exec -itd $(API_CONT) python manage.py runserver 0.0.0.0:8000

pipset.dja:
	docker cp ../$(API_CONT)/requirements.txt $(API_CONT):code
	docker exec -it $(API_CONT) pip install --upgrade pip
	docker exec -it $(API_CONT) pip install -r requirements.txt

statprj.dja:
	docker exec -it $(API_CONT) django-admin startproject $(PRJ_NAME_01) .

statapp.dja:
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_01)
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_02)
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_11)

migrate.dja:
	docker exec -it $(API_CONT) python manage.py makemigrations
	docker exec -it $(API_CONT) python manage.py migrate

insert.dja:
	docker cp ../../s_01_src/124dja_src/$(PRJ_NAME_01) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_01) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_02) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_11) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/manage.py $(API_CONT):code/

eject.dja:
	docker cp $(API_CONT):code/manage.py ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(PRJ_NAME_01)/ ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_01) ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_02) ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_11) ../../s_01_src/124dja_src/

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.api:
	docker container ls -a
	docker system df
	docker stop $(API_CONT)
	docker rm $(API_CONT)
	docker volume rm $(API_VOLUME)
	docker image rm $(API_IMAGE)
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------

drfver: ## Command for checking DRF version.
	docker exec -it 124dja_dev pip show djangorestframework


