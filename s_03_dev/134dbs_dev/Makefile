#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

DBS_CONT:=134dbs_dev
BKUP_DATA:=backup_20221217215050_134dbs_dev.sql
FILE_NAME:=backup_20221217215050_134dbs_dev.sql

#---[ 2. System initialize ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(DBS_CONT) -d

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make pg_restore

#---[ 4. Container Manipulation ]------------------------------------------

pg_dump: ## Dump db backupfile to local.(cf."meke pg_dump container_name=134dbs_dev")
	@docker exec -it "$(DBS_CONT)" /usr/src/dbstore/pg_dump.sh "$(DBS_CONT)" bash

pg_restore: ## Restore by local file.(cf."make pg_restore container_name=130dbs_tst file_name=sample.sql")
	@docker exec -it "$(DBS_CONT)" /usr/src/dbstore/pg_restore.sh "$(FILE_NAME)" bash

#---[ 5. Others ]----------------------------------------------------------

rplccrlf:
	docker exec 134dbs_dev /bin/sh -c "sed -i 's/\r//' /usr/src/dbstore/*.sh"

lookcrlf:
	docker exec 134dbs_dev /bin/sh -c "cat -e /usr/src/dbstore/*.sh"



