#.PHONY:

#---[ 4. DB Container(124dja_dev) Manipulation ]--------------------------------------

DBS_CONT:=134dbs_dev
BKUP_DATA:=backup_20221217215050_134dbs_dev.sql

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(DBS_CONT) -d

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make insert.data.dbs

insert.data.dbs:
	@docker exec -it $(DBS_CONT) /usr/src/dbstore/pg_restore.sh $(BKUP_DATA) bash


