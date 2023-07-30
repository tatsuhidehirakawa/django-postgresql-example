#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

CONT_NAME:=134dbs_dev
VOLUME_NAME=s_03_dev_dbs-vol
IMAGE_NAME:=piostgres
ENV_LOC:=../dev.env
# BKUP_FILE:=backup_20221217215050_134dbs_dev.sql
BKUP_FILE:=backup_20230725104542_134dbs_dev.sql

#---[ 2. System initialize ]-----------------------------------------------

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(CONT_NAME) -d

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.dbs: ## Booting only frontend devlopment containers.
	make init.dev.dbs
	make pg_restore

#---[ 4. Container Manipulation ]------------------------------------------

pg_dump: ## Dump db backupfile to local.(cf."meke pg_dump container_name=134dbs_dev")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(CONT_NAME)" /usr/src/dbstore/pg_dump.sh "$(CONT_NAME)" bash

pg_restore: ## Restore by local file.(cf."make pg_restore container_name=130dbs_tst file_name=sample.sql")
	make lookcrlf
	make rplccrlf
	@docker exec -it "$(CONT_NAME)" /usr/src/dbstore/pg_restore.sh "$(BKUP_FILE)" bash

#---[ 5. Others ]----------------------------------------------------------

purge:
	docker container ls -a
	docker system df
	docker stop $(CONT_NAME)
	docker rm $(CONT_NAME)
	docker volume rm $(VOLUME_NME)
	docker images rm $(IMAGE_NAME)
	docker system df

#---[ 6. Others ]----------------------------------------------------------

lookcrlf:
	docker exec $(CONT_NAME) /bin/sh -c "cat -e /usr/src/dbstore/*.sh"

rplccrlf:
	docker exec $(CONT_NAME) /bin/sh -c "sed -i 's/\r//' /usr/src/dbstore/*.sh"


	docker container prune -f
	docker image prune -a -f
	docker builder prune -f
