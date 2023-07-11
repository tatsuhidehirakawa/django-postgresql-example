#.PHONY:

#---[ 4. DB Container(124dja_dev) Manipulation ]--------------------------------------

DB_CONT_NAME:=134dbs_dev
AAA:=backup_20221217215050_134dbs_dev.sql

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(DB_CONT_NAME) -d

boot.dev.dbs: ## Booting only frontend devlopment containers.
	docker compose --env-file ../dev.env up 134dbs_dev -d

insert.data.dbs:
	@docker exec -it 134dbs_dev /usr/src/dbstore/pg_restore.sh $(AAA) bash