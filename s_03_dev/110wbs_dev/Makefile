#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

CONT_NAME:=110wbs_dev
ENV_LOC:=../dev.env

#---[ 2. System initialize ]-----------------------------------------------

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(CONT_NAME) -d
	make init.tailwindcss
	make insert.code.wbs
	make eject.data.wbs

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.wbs: ## Initilazing only frontend devlopment containers.
	make init.dev.wbs
	make insert.code.wbs

#---[ 4. Container Manipulation ]------------------------------------------

init.tailwindcss:
	@docker container exec -it $(CONT_NAME) npm install -D tailwindcss@3.2.4 postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../../s_03_dev/$(CONT_NAME)/TailwindCSS/postcss.config.js $(CONT_NAME):usr/src/app
	@docker cp ../../s_03_dev/$(CONT_NAME)/TailwindCSS/tailwind.config.js $(CONT_NAME):usr/src/app
	@docker cp ../../s_03_dev/$(CONT_NAME)/TailwindCSS/index.css $(CONT_NAME):usr/src/app/src
	@docker restart $(CONT_NAME)

insert.code.wbs:
	@docker cp ../../s_01_src/110wbs_src/public $(CONT_NAME):usr/src/app
	@docker cp ../../s_01_src/110wbs_src/src $(CONT_NAME):usr/src/app

eject.data.wbs:
	docker cp 110wbs_dev:usr/src/app/public ../../s_01_src/110wbs_src/
	docker cp 110wbs_dev:usr/src/app/src ../../s_01_src/110wbs_src/
	docker cp 110wbs_dev:usr/src/app/package.json ../../s_01_src/110wbs_src/

#---[ 5. Others ]----------------------------------------------------------


