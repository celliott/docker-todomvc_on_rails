# docker-todomvc_on_rails makefile

RAILS_ENV ?= development
APP_URL = http://$(DOCKER_IP):5000
PORTS = -p 5000:5000
CONTAINER = todomvc_on_rails
VOLUMES = -v $(HOME)/data/$(CONTAINER)/db:/data/db
ENVS = -e RAILS_ENV=$(RAILS_ENV)

.PHONY: container run

clean:
	rm -rf $(HOME)/data/$(CONTAINER)

clone:
	rm -rf ./build/*
	git clone git@github.com:$(GITHUB_ACCOUNT)/$(REPO).git build
	sed -i -e 's:db/:/data/db/:g' build/$(REPO)/config/database.yml

container:
	docker build -t $(CONTAINER) .

docker_up:
	boot2docker init
	boot2docker up
	$(eval $(boot2docker shellinit))

data_dir:
	sudo mkdir -p $(HOME)/data
	sudo chown 777 $(HOME)/data

run:
	docker run --name $(CONTAINER) --restart=always -i -d $(PORTS) $(ENVS) $(VOLUMES)  -t $(CONTAINER)
	echo "app url: $(APP_URL)"
	echo "rails env: $(RAILS_ENV)"

kill:
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)

restart:
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
	docker run --name $(CONTAINER) --restart=always -i -d $(PORTS) $(ENVS) $(VOLUMES)  -t $(CONTAINER)
	echo "app url: $(APP_URL)"
	echo "rails env: $(RAILS_ENV)"

open:
	open -a Safari $(APP_URL)

tail:
	docker logs -f $(CONTAINER)
