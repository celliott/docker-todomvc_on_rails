#docker-todomvc_on_rails

Ruby on rails docker container for pulling and running todomvc_on_rails app. `make` is used an api for the container. Data is persisted after container restarts. ruby version is 2.0.0 <- specified by app

Usage:

	1. set envvars
	$ export RAILS_ENV=test		# default is development. production not supported in todomvc_on_rails app
	
	2. start boot2docker
	$ make docker_up
	$ eval "$(boot2docker shellinit)"	# manual step
	
	3. delete $(HOME)/build/* and checkout repo
	$ make clone
	
	4. pull repo and build container
	$ make container
	
	5. run container
	$ export DOCKER_IP=$(boot2docker ip)	# manual step
	$ make run
	
	6. open in safari
	$ make open
	
	# other commands
	# delete $(HOME)/data/$(CONTAINER) dir
	$ make clean
	
	# restart container
	$  make restart
	
	# kill container
	$ make kill
	
	# tail container logs
	$ make tail

Persistent Data:

	# located in 
	$HOME/data/$(CONTAINER)/db/$RAILS_ENV.sqlite3
