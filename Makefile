all: clean install lint test

clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
	find . -name '*.egg-info' -delete

install:
	pip install -e .[test]

lint:
	flake8 aws_es_query.py
	isort --check-only --diff aws_es_query.py

release:
	pip install twine wheel
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload -s dist/*
