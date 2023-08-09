#.PHONY:

#---[ 1. Env Params ]------------------------------------------------------

include ../dev.env
ENV_LOC:=dev.env

#---[ 2. System Initialize ]-----------------------------------------------

init.dev.wbs: ## Initilazing only frontend devlopment container.
	cd .. && docker compose --env-file $(ENV_LOC) up $(WBS_CON) -d
	make init.tailwindcss
	make insert.code.wbs
	make eject.code.wbs

#---[ 3. System Boot ]-----------------------------------------------------

boot.dev.wbs: ## Booting only frontend devlopment container.
	cd .. && docker compose --env-file $(ENV_LOC) up $(WBS_CON) -d
	make init.tailwindcss
	make insert.code.wbs

#---[ 4. Container Manipulation ]------------------------------------------

init.tailwindcss:
	@docker container exec -it $(WBS_CON) npm install -D tailwindcss@3.2.4 \
	postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../../s_04_dev/$(WBS_CON)/TailwindCSS/postcss.config.js \
	$(WBS_CON):usr/src/app
	@docker cp ../../s_04_dev/$(WBS_CON)/TailwindCSS/tailwind.config.js \
	$(WBS_CON):usr/src/app
	@docker cp ../../s_04_dev/$(WBS_CON)/TailwindCSS/index.css \
	$(WBS_CON):usr/src/app/src
	@docker restart $(WBS_CON)

insert.code.wbs:
	@docker cp ../../s_01_src/$(WBS_SRC)/public $(WBS_CON):usr/src/app
	@docker cp ../../s_01_src/$(WBS_SRC)/src $(WBS_CON):usr/src/app

eject.code.wbs:
	docker cp $(WBS_CON):usr/src/app/public ../../s_01_src/$(WBS_SRC)/
	docker cp $(WBS_CON):usr/src/app/src ../../s_01_src/$(WBS_SRC)/
	docker cp $(WBS_CON):usr/src/app/package.json ../../s_01_src/$(WBS_SRC)/

#---[ 5. Purge Container ]-------------------------------------------------

purge.dev.wbs:
	docker container ls -a
	docker system df
	docker stop $(WBS_CON)
	docker rm $(WBS_CON)
	docker volume rm $(WBS_VOL)
	docker image rm $(WBS_IMG)
	docker builder prune -f
	docker system df

#---[ 6. Other Commands ]--------------------------------------------------


