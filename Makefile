#.PHONY:

#---[ 1. Env params ]------------------------------------------------------



#---[ 2. System boot ]-----------------------------------------------------

boot.all: ## booting all containers and services.
	cd s_03_dev && make boot.dev

#---[ 3. System initialize ]-----------------------------------------------

init.all: ## Initializing all containers and services.
	cd s_03_dev && make init.dev

#---[ 4. Container Manipulation ]------------------------------------------



#---[ 5. Others ]----------------------------------------------------------


