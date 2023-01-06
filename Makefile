build:
	pip install -e .

#                                Change app_name below
	rm -rf app_name.egg-info
 
clean:
#                                Change app_name below
	rm -rf app_name.egg-info
	
	pip uninstall app_template -y