.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test --verbose -s --cov=hello_world --cov-report=xml
run:
	PYTHONPATH=. FLASK_APP=hello_world flask run
lint:
	flake8 hello_world test main.py
docker_build:
	docker build -t hello-world-printer .
docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer
