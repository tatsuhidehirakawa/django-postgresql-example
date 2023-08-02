#.PHONY:

#---[ 1. Env Params ]------------------------------------------------------

include dev.env

#---[ 2. System Initialize ]-----------------------------------------------

init.dev: ## Initializing only frontend devlopment containers.
	make init.dev.dbs
	make init.dev.api
	make init.dev.wbs
	@echo "Succeful initializing devlopment environment!"

init.dev.wbs: ## Initilazing Webserver devlopment containers.
	cd $(WBS_CON) && make init.dev.wbs

init.dev.api: ## Initializing DRF devlopment containers.
	cd $(API_CON) && make init.dev.api

init.dev.dbs: ## Initializing DBserver devlopment containers.
	cd $(DBS_CON) && make init.dev.dbs

#---[ 3. System Boot ]-----------------------------------------------------

boot.dev:
	make boot.dev.dbs
	make boot.dev.api
	make boot.dev.wbs
	@echo "Succeful booting devlopment environment!"

boot.dev.wbs: ## Booting Webserver devlopment containers.
	cd $(WBS_CON) && make boot.dev.wbs

boot.dev.api: ## Booting DRF devlopment containers.
	cd $(API_CON) && make boot.dev.api

boot.dev.dbs: ## Booting DBserver devlopment containers.
	cd $(DBS_CON) && make init.dev.dbs

#---[ 4. Container Manipulation ]------------------------------------------

pg_dump:
	cd $(DBS_CON) && make pg_dump

pg_restore:
	cd $(DBS_CON) && make pg_restore

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev:
	make purge.dev.wbs
	make purge.dev.api
	make purge.dev.dbs
	docker builder prune -f

purge.dev.front:
	make purge.dev.wbs
	docker builder prune -f

purge.dev.back:
	make purge.dev.api
	make purge.dev.dbs
	docker builder prune -f

purge.dev.wbs:
	cd $(WBS_CON) && make purge.dev.wbs

purge.dev.api:
	cd $(API_CON) && make purge.dev.api

purge.dev.dbs:
	make pg_dump
	cd $(DBS_CON) && make purge.dev.dbs

#---[ 6. Other Commands ]--------------------------------------------------

ddd:
	docker image prune -a -f

ccc:
	docker container ls -a; docker system df; docker stop $(docker ps -q); docker volume rm $(docker volume ls -qf dangling=true); docker container prune -f; docker image prune -a -f; docker builder prune -f; docker images -a -f; docker container ls -a; docker system df

