#.PHONY:

#---[ 1. Env Params ]------------------------------------------------------

include ../dev.env
ENV_LOC:=dev.env

#---[ 2. System Initialize ]-----------------------------------------------

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(WBS_CNT) -d
	make init.tailwindcss
	make insert.code.wbs
	make eject.code.wbs

#---[ 3. System Boot ]-----------------------------------------------------

boot.dev.wbs: ## Booting only frontend devlopment containers.
	cd .. && docker compose --env-file $(ENV_LOC) up $(WBS_CNT) -d
	make init.tailwindcss
	make insert.code.wbs

#---[ 4. Container Manipulation ]------------------------------------------

init.tailwindcss:
	@docker container exec -it $(WBS_CNT) npm install -D tailwindcss@3.2.4 postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../../s_03_dev/$(WBS_CNT)/TailwindCSS/postcss.config.js $(WBS_CNT):usr/src/app
	@docker cp ../../s_03_dev/$(WBS_CNT)/TailwindCSS/tailwind.config.js $(WBS_CNT):usr/src/app
	@docker cp ../../s_03_dev/$(WBS_CNT)/TailwindCSS/index.css $(WBS_CNT):usr/src/app/src
	@docker restart $(WBS_CNT)

insert.code.wbs:
	@docker cp ../../s_01_src/$(WBS_SRC)/public $(WBS_CNT):usr/src/app
	@docker cp ../../s_01_src/$(WBS_SRC)/src $(WBS_CNT):usr/src/app

eject.code.wbs:
	docker cp $(WBS_CNT):usr/src/app/public ../../s_01_src/$(WBS_SRC)/
	docker cp $(WBS_CNT):usr/src/app/src ../../s_01_src/$(WBS_SRC)/
	docker cp $(WBS_CNT):usr/src/app/package.json ../../s_01_src/$(WBS_SRC)/

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.wbs:
	docker container ls -a
	docker system df
	docker stop $(WBS_CNT)
	docker rm $(WBS_CNT)
	docker volume rm $(WBS_VOL)
	docker image rm $(WBS_IMG)
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------


