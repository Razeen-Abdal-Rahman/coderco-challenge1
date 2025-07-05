##variables
USER=appuser
DIR=/opt/coderco-app
SVR_FILE=server.py
ENV_FILE=.env

##user target, this creates the user if it doesn't exisit. If it does exist nothing is done
user:
	@echo "creating user $(USER)..."
	@if ! id -u $(USER) >/dev/null 2>&1; then \
		sudo useradd -r -s /bin/false $(USER); \
		echo "User $(USER) created."; \
	else \
		echo "User $(USER) already exists."; \
	fi

##directory target, this creates a working directory and gives full access to the prevously created user
directory:
	@echo "creating directory $(DIR)..."
	sudo mkdir -p $(DIR)
	@echo "directory $(DIR) created"
	@echo "granting access to user $(USER)..."
	sudo chown $(USER):$(USER) $(DIR)
	sudo chmod 750 $(DIR)
	@echo "access granted"

##server target, this adds the server and env files to the VM and gives ownership to the previously created user
server:
	@echo "installing server files..."
	sudo cp $(SVR_FILE) $(DIR)/
	sudo cp $(ENV_FILE) $(DIR)/
	sudo chown $(USER):$(USER) $(DIR)/$(SVR_FILE) $(DIR)/$(ENV_FILE)
	@echo "server files sucessfully installed"




