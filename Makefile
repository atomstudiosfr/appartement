PYTHON_VERSION := python3

.PHONY: install run stop restart

install:
	echo 'Nothing'

stop:
	docker-compose stop

restart:
	docker-compose restart

run:
	docker-compose -f docker-compose.app.yml up --detach --build --remove-orphans
	docker image prune -a -f
	docker volume prune -f
