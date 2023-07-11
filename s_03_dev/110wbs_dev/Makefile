#.PHONY:

CONT_NAME:=110wbs_dev

init.dev.wbs: ## Initilazing only frontend devlopment containers.
	cd .. && docker compose --env-file ../dev.env up $(CONT_NAME) -d

insert.code.wbs:
	@docker cp ../s_01_src/110wbs_src/public 110wbs_dev:usr/src/app
	@docker cp ../s_01_src/110wbs_src/src 110wbs_dev:usr/src/app

init.tailwindcss:
	@docker container exec -it 110wbs_dev npm install -D tailwindcss@3.2.4 postcss@8.4.19 autoprefixer@10.4.13
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/postcss.config.js 110wbs_dev:usr/src/app
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/tailwind.config.js 110wbs_dev:usr/src/app
	@docker cp ../s_03_dev/110wbs_dev/TailwindCSS/index.css 110wbs_dev:usr/src/app/src
	@docker restart 110wbs_dev

