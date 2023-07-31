CURRENT_DIR := $(shell pwd)

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: avd_build
avd_build: ## Generate AVD configs
	cd $(CURRENT_DIR)/avd_inventory; ansible-playbook playbooks/avd-build.yml

.PHONY: avd_deploy
avd_deploy: ## Deploy AVD configs via CVP
	cd $(CURRENT_DIR)/avd_inventory; ansible-playbook playbooks/avd-deploy-cvp.yml
