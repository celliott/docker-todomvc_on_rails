#docker-todomvc_on_rails

Ruby on rails docker container for pulling and running todomvc_on_rails app. `make` is used an api for the container. Data is persisted after container restarts. ruby version is 2.0.0 <- specified by app

###Run app:

- set ruby env, optional

```
$ export RAILS_ENV=test		# default is development. production not supported in todomvc_on_rails app
```

- start boot2docker

```
$ make docker_up && eval "$(boot2docker shellinit)"
```

- delete $HOME/build/* and checkout repo

```
$ make clone
```

- build container

```
$ make container
```

- run container

```
$ export DOCKER_IP=$(boot2docker ip)	# manual step
$ make run
```

- open in safari

```
$ make open
```

###Rebuild and run app:

- rebuild, run and open in safari

```
$ make container && make restart && sleep 5 && make open
```


###Other useful commands:

```
# delete $HOME/data/$(CONTAINER)
$ make clean
	
# restart container
$ make restart
	
# kill container
$ make kill
	
# tail container logs
$ make tail
```

###Persistent Data:

```
# located in 
$HOME/data/$(CONTAINER)/db/$RAILS_ENV.sqlite3
```
