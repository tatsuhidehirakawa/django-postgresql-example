#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

DBS_CONT:=134dbs_dev
BKUP_DATA:=backup_20221217215050_134dbs_dev.sql

#---[ 1. System boot ]-----------------------------------------------------

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make insert.data.dbs

#---[ 1. System initialize ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(DBS_CONT) -d

#---[ 4. Container Manipulation ]------------------------------------------

insert.data.dbs:
	@docker exec -it $(DBS_CONT) /usr/src/dbstore/pg_restore.sh $(BKUP_DATA) bash


eject.data.dbs:



#---[ 5. Others ]----------------------------------------------------------


