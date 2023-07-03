#.PHONY:


#---[ 1. system boot ]-------------------------------------------------------

init.all: ## Initialize and booting all containers and services.
	make init.dev
	make init.tst
	# make init.stg

init.dev: ## Booting only frontend devlopment containers.
	cd s_03_dev && make init.dev.dja

init.tst: ## Booting only backend testing containers.
	cd s_05_tst && make init.tst

init.stg: ## Booting only backend staging containers.
	cd s_06_tst && make init.stg

#---[ 3. Tst env boot ]------------------------------------------------

drfver:
	cd s_03_dev && make drfver
