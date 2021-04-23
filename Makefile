setuptools: ## Install project required tools
	@./setup.sh

generate: ## Generate projects, workspace and install pods
	@$(MAKE) clean
	@$(MAKE) generateprojects
	@$(MAKE) installpods

generateprojects: ## Generate only .xcodeproj projects using Xcodegen	
	@echo "\nGenerating modules projects"
	@find Modules -type d -depth 1 -exec sh -c "cd {}; [ -f ./project.yml ] && xcodegen" \;
	
	@echo "\nGenerating main projects"
	@xcodegen

installpods: ## Install Cocoapods dependencies and generate workspace
	@echo "\nRunning bundle install"
	@bundle install --quiet
	
	@echo "\nInstalling Pods"
	@bundle exec pod install || bundle exec pod install --repo-update

clean: ## Cleanup projects
	-@rm -Rf ./Routes.xcodeproj 
	-@find Modules -maxdepth 2 -name "*.xcodeproj" -exec rm -r {} \;

open: ## Cleanup projects
	@open ./Routes.xcworkspace 
