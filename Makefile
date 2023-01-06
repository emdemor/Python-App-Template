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
#                                Change app_name below
	rm -rf emmapp.egg-info
	rm -rf dist
	
uninstall:
#                                Change app_name below
	pip uninstall emmapp -y