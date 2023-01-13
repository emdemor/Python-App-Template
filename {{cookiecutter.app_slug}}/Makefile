build:
	bumpversion build
	pip install build
	python -m build
	$(MAKE) doc

release:
	bumpversion release --tag
	pip install build
	python -m build
	$(MAKE) doc

pypi:
	pip install twine
	python -m twine upload dist/*

release-up:
	bumpversion release

patch:
	bumpversion patch

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