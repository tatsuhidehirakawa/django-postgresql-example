#.PHONY:

#---[ 1. Env params ]------------------------------------------------------



#---[ 2. System initialize ]-----------------------------------------------

init.all: ## Initializing all containers and services.
	cd s_03_dev && make init.dev

#---[ 3. System boot ]-----------------------------------------------------

boot.all: ## booting all containers and services.
	cd s_03_dev && make boot.dev

#---[ 4. Container Manipulation ]------------------------------------------



#---[ 5. Purge Container ]-------------------------------------------------

purge:
	make purge.dev
	make purge.tst
	make purge.stg
	docker builder prune

purge.dev:
	cd s_03_dev && make purge.dev

purge.tst:
	cd s_05_tst && make purge.tst

purge.stg:
	cd s_07_stg && make purge.stg

#---[ 6. Other Commands ]--------------------------------------------------


