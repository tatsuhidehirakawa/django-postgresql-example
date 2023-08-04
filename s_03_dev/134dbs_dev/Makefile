#.PHONY:

#---[ 1. Env Params ]------------------------------------------------------

include ../dev.env
ENV_LOC:=dev.env

BKUP_FILE:=backup_20230731214606_134dbs_dev.sql
# BKUP_FILE:=
# BKUP_FILE:=

#---[ 2. System Initialize ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(DBS_CON) -d

#---[ 3. System Boot ]-----------------------------------------------------

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make pg_restore

#---[ 4. Container Manipulation ]------------------------------------------

pg_dump: ## Dump db backupfile to local.(cf."meke pg_dump container_name=134dbs_dev")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(DBS_CON)" /usr/src/dbstore/pg_dump.sh "$(DBS_CON)" bash

pg_restore: ## Restore by local file.(cf."make pg_restore container_name=130dbs_tst file_name=sample.sql")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(DBS_CON)" /usr/src/dbstore/pg_restore.sh "$(BKUP_FILE)" bash

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.dbs:
	docker container ls -a
	docker system df
	docker stop $(DBS_CON)
	docker rm $(DBS_CON)
	docker volume rm $(DBS_VOL)
	docker image rm $(DBS_IMG)
	docker builder prune -f
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------

lookcrlf:
	docker exec $(DBS_CON) /bin/sh -c "cat -e /usr/src/dbstore/*.sh"

rplccrlf:
	docker exec $(DBS_CON) /bin/sh -c "sed -i 's/\r//' /usr/src/dbstore/*.sh"


	docker container prune -f
	docker image prune -a -f
	docker builder prune -f
