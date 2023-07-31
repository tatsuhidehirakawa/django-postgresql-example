#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

CONT_NAME:=124dja_dev
VOLUME_NAME=s_03_dev_api-vol
# IMAGE_NAME:=piostgres

ENV_LOC:=../dev.env

PRJ_NAME_01:=config
# PRJ_NAME_02:=
APP_NAME_01:=users
# APP_NAME_02:=profiles
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
	docker cp ../../s_01_src/124dja_src/$(PRJ_NAME_01) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_01) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_11) $(CONT_NAME):code/
	make eject.dja
	make run.dja

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.api: ## Booting  Django devlopment containers.
	make contup.dja
	make pipset.dja
	make insert.dja
	make run.dja

#---[ 4. Container Manipulation ]------------------------------------------

createuser.dja:
	docker exec -it $(CONT_NAME) python manage.py createsuperuser --email $(E_MAIL) --username $(USER_NAME)

contup.dja:
	cd .. && docker compose --env-file $(ENV_LOC) up $(CONT_NAME) -d

run.dja:
	docker exec -itd $(CONT_NAME) python manage.py runserver 0.0.0.0:8000

pipset.dja:
	docker cp ../$(CONT_NAME)/requirements.txt $(CONT_NAME):code
	docker exec -it $(CONT_NAME) pip install --upgrade pip
	docker exec -it $(CONT_NAME) pip install -r requirements.txt

statprj.dja:
	docker exec -it $(CONT_NAME) django-admin startproject $(PRJ_NAME_01) .

statapp.dja:
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_01)
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_11)

migrate.dja:
	docker exec -it $(CONT_NAME) python manage.py makemigrations
	docker exec -it $(CONT_NAME) python manage.py migrate

insert.dja:
	docker cp ../../s_01_src/124dja_src/$(PRJ_NAME_01) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_01) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_11) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/manage.py $(CONT_NAME):code/

eject.dja:
	docker cp $(CONT_NAME):code/manage.py ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(PRJ_NAME_01)/ ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_01) ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_11) ../../s_01_src/124dja_src/

#---[ 5. Others ]----------------------------------------------------------

purge:
	docker container ls -a
	docker system df
	docker stop $(CONT_NAME)
	docker rm $(CONT_NAME)
	docker volume rm $(VOLUME_NAME)
	docker images rm $(IMAGE_NAME)
	docker system df

#---[ 5. Others ]----------------------------------------------------------

drfver: ## Command for checking DRF version.
	docker exec -it 124dja_dev pip show djangorestframework


