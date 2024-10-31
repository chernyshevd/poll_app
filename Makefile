# Makefile
.PHONY: test
test:
	poetry run python mysite/manage.py test --noinput polls

.PHONY: linting
linting:
	poetry run isort mysite
	poetry run black --line-length 120 mysite
	poetry run flake8 --ignore=E226,E302,E41,W191,W503 --max-complexity=13 --max-line-length=120 mysite

.PHONY: mypy
mypy:
	poetry run mypy mysite

.PHONY: run_server
run_server:
	poetry run python mysite/manage.py runserver

.PHONY: migrate
migrate:
	poetry run python mysite/manage.py migrate

.PHONY: make_migrations
make_migrations:
	poetry run python mysite/manage.py makemigrations polls