#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

API_CONT:=124dja_dev
PROJ_NAME:=config
APP_NAME_1:=users
APP_NAME_2:=plans
APP_NAME_3:=blog
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
	docker cp ../../s_01_src/124dja_src/$(PROJ_NAME) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_2) $(API_CONT):code/
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
	docker exec -it $(API_CONT) python manage.py createsuperuser --email $(E_MAIL) --username $(USER_NAME)

contup.dja:
	cd .. && docker compose --env-file ../dev.env up $(API_CONT) -d

run.dja:
	docker exec -itd $(API_CONT) python manage.py runserver 0.0.0.0:8000

pipset.dja:
	docker cp ../$(API_CONT)/requirements.txt $(API_CONT):code
	docker exec -it $(API_CONT) pip install --upgrade pip
	docker exec -it $(API_CONT) pip install -r requirements.txt

statprj.dja:
	docker exec -it $(API_CONT) django-admin startproject $(PROJ_NAME) .

statapp.dja:
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_1)
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_2)
	docker exec -it $(API_CONT) python manage.py startapp $(APP_NAME_3)

migrate.dja:
	docker exec -it $(API_CONT) python manage.py makemigrations
	docker exec -it $(API_CONT) python manage.py migrate

insert.dja:
	docker cp ../../s_01_src/124dja_src/$(PROJ_NAME) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_2) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/manage.py $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_1) $(API_CONT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_NAME_3) $(API_CONT):code/

eject.dja:
	docker cp $(API_CONT):code/manage.py ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(PROJ_NAME)/ ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_1) ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_2) ../../s_01_src/124dja_src/
	docker cp $(API_CONT):code/$(APP_NAME_3) ../../s_01_src/124dja_src/

#---[ 5. Others ]----------------------------------------------------------

drfver:
	docker exec -it 124dja_dev pip show djangorestframework


