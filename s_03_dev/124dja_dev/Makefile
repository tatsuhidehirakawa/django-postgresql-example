#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

CONT_NAME:=124dja_dev
ENV_LOC:=../dev.env

PROJ_NAME:=config
APP_NAME_1:=users
APP_NAME_2:=plans
# APP_NAME_3:=blog
# APP_NAME_4:=
# APP_NAME_5:=

E_MAIL:=admin@example.com
USER_NAME:=admin

#---[ 2. System initialize ]-----------------------------------------------

init.dev.dja: ## Initializing DRF devlopment containers.
	make contup.dja
	make pipset.dja
	make statprj.dja
	make statapp.dja
	docker cp ../../s_01_src/124dja_src/$(PROJ_NAME) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_1) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_2) $(CONT_NAME):code/
	make eject.dja
	make run.dja

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.dja: ## Booting  Django devlopment containers.
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
	docker exec -it $(CONT_NAME) django-admin startproject $(PROJ_NAME) .

statapp.dja:
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_1)
	docker exec -it $(CONT_NAME) python manage.py startapp $(APP_NAME_2)

migrate.dja:
	docker exec -it $(CONT_NAME) python manage.py makemigrations
	docker exec -it $(CONT_NAME) python manage.py migrate

insert.dja:
	docker cp ../../s_01_src/124dja_src/$(PROJ_NAME) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_1) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_2) $(CONT_NAME):code/
	docker cp ../../s_01_src/124dja_src/manage.py $(CONT_NAME):code/

eject.dja:
	docker cp $(CONT_NAME):code/manage.py ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(PROJ_NAME)/ ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_1) ../../s_01_src/124dja_src/
	docker cp $(CONT_NAME):code/$(APP_NAME_2) ../../s_01_src/124dja_src/

#---[ 5. Others ]----------------------------------------------------------

drfver:
	docker exec -it 124dja_dev pip show djangorestframework


