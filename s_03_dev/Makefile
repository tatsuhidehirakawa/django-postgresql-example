#.PHONY:

WEB_CONT:=110wbs_dev
API_CONT:=124dja_dev
DBS_CONT:=134dbs_dev

#---[ 1. system initialize ]-----------------------------------------------

init.dev: ## Initializing only frontend devlopment containers.
	make init.dev.dbs
	make init.dev.api
	make init.dev.wbs
	echo "Succeful initializing devlopment environment!"

#---[ 2. system booting ]---------------------------------------------------

boot.dev:
	make boot.dev.dbs
	make boot.dev.dja
	make boot.dev.wbs	
	echo "Succeful booting devlopment environment!"

#---[ 2. Web Container(110wbs_dev) Manipulation ]---------------------------

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	cd $(WEB_CONT) && make init.dev.wbs

boot.dev.dja: ## Booting  Django devlopment containers.
	cd $(API_CONT) && make boot.dev.dja

init.dev.dja: ## Initializing DRF devlopment containers.
	cd $(API_CONT) && make init.dev.dja

init.dev.dbs: ## Booting only frontend devlopment containers.
	cd $(DBS_CONT) && make init.dev.dbs

#---[ 5. system booting ]-----------------------------------------------



set.code.dev:
	@make insert.data.dbs
	@make insert.code.wbs

API_IMAGE:=s_03_dev-124dja_dev

purge.api.cont:
	# docker container ls -a
	# docker system df
	# docker stop $(CONT_NAME)
	docker volume rm $(API_IMAGE)
	# docker container prune -f
	# docker image prune -a -f
	# docker builder prune -f
	# docker images -a -f
	# docker container ls -a
	# docker system df

ddd:
	docker image prune -a -f

ccc:
	docker container ls -a; docker system df; docker stop $(docker ps -q); docker volume rm $(docker volume ls -qf dangling=true); docker container prune -f; docker image prune -a -f; docker builder prune -f; docker images -a -f; docker container ls -a; docker system df

insert.data.dbs:
	@docker exec -it 134dbs_dev /usr/src/dbstore/pg_restore.sh backup_20221217215050_134dbs_dev.sql bash