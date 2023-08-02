#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

include ../dev.env
ENV_LOC:=dev.env

PRJ_001:=config
# PRJ_002:=
# PRJ_003:=

APP_001:=users
APP_002:=profiles
# APP_003:=messages
# APP_004:=
APP_011:=plans
# APP_011:=contracts
# APP_012:=
# APP_098:=settings
# APP_099:=systems

#---[ 2. System initialize ]-----------------------------------------------

init.dev.api: ## Initializing DRF devlopment containers.
	make contup.dja
	make pipset.dja
	make statprj.dja
	make statapp.dja
	docker cp ../../s_01_src/124dja_src/$(PRJ_001) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_001) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_002) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_011) $(API_CNT):code/
	make eject.dja
	make run.dja
	docker volume rm $(WBS_VOL)

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.api: ## Booting  Django devlopment containers.
	make contup.dja
	make pipset.dja
	make insert.dja
	make run.dja
	docker volume rm $(WBS_VOL)

#---[ 4. Container Manipulation ]------------------------------------------

createuser.dja:
	docker exec -it $(API_CNT) python manage.py createsuperuser --email $(E_MAIL) --username $(USER_NAME)

contup.dja:
	cd .. && docker compose --env-file $(ENV_LOC) up $(API_CNT) -d

run.dja:
	docker exec -itd $(API_CNT) python manage.py runserver 0.0.0.0:8000

pipset.dja:
	docker cp ../$(API_CNT)/requirements.txt $(API_CNT):code
	docker exec -it $(API_CNT) pip install --upgrade pip
	docker exec -it $(API_CNT) pip install -r requirements.txt

statprj.dja:
	docker exec -it $(API_CNT) django-admin startproject $(PRJ_001) .

statapp.dja:
	docker exec -it $(API_CNT) python manage.py startapp $(APP_001)
	docker exec -it $(API_CNT) python manage.py startapp $(APP_002)
	docker exec -it $(API_CNT) python manage.py startapp $(APP_011)

migrate.dja:
	docker exec -it $(API_CNT) python manage.py makemigrations
	docker exec -it $(API_CNT) python manage.py migrate

insert.dja:
	docker cp ../../s_01_src/124dja_src/$(PRJ_001) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_001) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_002) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/$(APP_011) $(API_CNT):code/
	docker cp ../../s_01_src/124dja_src/manage.py $(API_CNT):code/

eject.dja:
	docker cp $(API_CNT):code/manage.py ../../s_01_src/124dja_src/
	docker cp $(API_CNT):code/$(PRJ_001)/ ../../s_01_src/124dja_src/
	docker cp $(API_CNT):code/$(APP_001) ../../s_01_src/124dja_src/
	docker cp $(API_CNT):code/$(APP_002) ../../s_01_src/124dja_src/
	docker cp $(API_CNT):code/$(APP_011) ../../s_01_src/124dja_src/

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.api:
	docker container ls -a
	docker system df
	docker stop $(API_CNT)
	docker rm $(API_CNT)
	docker volume rm $(API_VOL)
	docker image rm $(API_IMG)
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------

drfver: ## Command for checking DRF version.
	docker exec -it 124dja_dev pip show djangorestframework


