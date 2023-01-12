build:
	pip install build
	pip install twine
	python -m build
	python -m twine upload dist/*
	$(MAKE) doc
	$(MAKE) clear

test-build:
	pip install -e .
	$(MAKE) doc
	$(MAKE) clear

doc:
	bash scripts/build.sh

clear:
	rm -rf {{cookiecutter.app_slug}}.egg-info
	rm -rf dist
	
uninstall:
	pip uninstall {{cookiecutter.app_slug}} -y

env-create:
	conda env create -n {{cookiecutter.app_slug}} --file environment.yml

env-clear:
	conda env remove -n {{cookiecutter.app_slug}}