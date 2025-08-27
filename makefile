TARGET := .profile
.PHONY: check-deps all build clean build-hugo build-mdbooks

# List of all mdbook projects
MDBOOK_PROJECTS = configureProjects react rust ts

# Default target
all: check-deps build

build: build-hugo build-mdbooks

# Build Hugo site
build-hugo:
	@echo "Building Hugo site..."
	@hugo --minify

# Build all mdbook projects
build-mdbooks:
	@echo "Building MDBook projects..."
	@for project in $(MDBOOK_PROJECTS); do \
		echo "Building $$project..."; \
		cd notebooks/$$project && mdbook build && cd -; \
	done

# Check system dependencies
REQUIRED_CMDS = git mdbook hugo rsync

check-deps:
	@echo "Checking system dependencies..."
	@for cmd in $(REQUIRED_CMDS); do \
		if ! command -v $$cmd >/dev/null 2>&1; then \
			echo "❌ Missing: $$cmd"; \
			exit 1; \
		else \
			echo "✅ Found: $$cmd"; \
		fi; \
	done
	@echo "All dependencies satisfied."

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf public/
	@for project in $(MDBOOK_PROJECTS); do \
		echo "Cleaning $$project..."; \
		rm -rf notebooks/$$project/book; \
	done
	@echo "Clean complete."


serve-hugo:
	@echo "Serving Hugo site locally..."
	@hugo server -D

# Serve a specific mdbook project
# Usage: make serve-mdbook PROJECT=rust
serve-mdbook:
	@if [ -z "$(PROJECT)" ]; then \
		echo "Please specify a project: make serve-mdbook PROJECT=project_name"; \
		exit 1; \
	fi
	@echo "Serving $(PROJECT) mdbook..."
	@cd notebooks/$(PROJECT) && mdbook serve

