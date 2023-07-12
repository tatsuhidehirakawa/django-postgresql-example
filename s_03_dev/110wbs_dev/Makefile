#.PHONY:

#---[ 1. Env params ]------------------------------------------------------

WEB_CONT:=110wbs_dev

#---[ 2. System initialize ]-----------------------------------------------

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(WEB_CONT) -d
	make init.tailwindcss
	make insert.code.wbs
	make eject.data.wbs

#---[ 3. System boot ]-----------------------------------------------------

boot.dev.wbs: ## Initilazing only frontend devlopment containers.
	make init.dev.wbs
	make insert.code.wbs

#---[ 4. Container Manipulation ]------------------------------------------

init.tailwindcss:
	@docker container exec -it $(WEB_CONT) npm install -D tailwindcss@3.2.4 postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../../s_03_dev/$(WEB_CONT)/TailwindCSS/postcss.config.js $(WEB_CONT):usr/src/app
	@docker cp ../../s_03_dev/$(WEB_CONT)/TailwindCSS/tailwind.config.js $(WEB_CONT):usr/src/app
	@docker cp ../../s_03_dev/$(WEB_CONT)/TailwindCSS/index.css $(WEB_CONT):usr/src/app/src
	@docker restart $(WEB_CONT)

insert.code.wbs:
	@docker cp ../../s_01_src/110wbs_src/public $(WEB_CONT):usr/src/app
	@docker cp ../../s_01_src/110wbs_src/src $(WEB_CONT):usr/src/app

eject.data.wbs:
	docker cp 110wbs_dev:usr/src/app/public ../../s_01_src/110wbs_src/
	docker cp 110wbs_dev:usr/src/app/src ../../s_01_src/110wbs_src/
	docker cp 110wbs_dev:usr/src/app/package.json ../../s_01_src/110wbs_src/

#---[ 5. Others ]----------------------------------------------------------


