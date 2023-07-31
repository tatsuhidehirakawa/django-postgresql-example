#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

include ../../dev.env
ENV_LOC:=../dev.env

BKUP_FILE:=backup_20230731214606_134dbs_dev.sql
# BKUP_FILE:=
# BKUP_FILE:=

#---[ 2. System initialize ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(DBS_CONT) -d

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make pg_restore

#---[ 4. Container Manipulation ]------------------------------------------

pg_dump: ## Dump db backupfile to local.(cf."meke pg_dump container_name=134dbs_dev")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(DBS_CONT)" /usr/src/dbstore/pg_dump.sh "$(DBS_CONT)" bash

pg_restore: ## Restore by local file.(cf."make pg_restore container_name=130dbs_tst file_name=sample.sql")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(DBS_CONT)" /usr/src/dbstore/pg_restore.sh "$(BKUP_FILE)" bash

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.dbs:
	docker container ls -a
	docker system df
	docker stop $(DBS_CONT)
	docker rm $(DBS_CONT)
	docker volume rm $(DBS_VOLUME)
	docker image rm $(DBS_IMAGE)
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------

lookcrlf:
	docker exec $(DBS_CONT) /bin/sh -c "cat -e /usr/src/dbstore/*.sh"

rplccrlf:
	docker exec $(DBS_CONT) /bin/sh -c "sed -i 's/\r//' /usr/src/dbstore/*.sh"


	docker container prune -f
	docker image prune -a -f
	docker builder prune -f
