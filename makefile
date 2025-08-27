TARGET := .profile
.PHONY: check-deps all build clean build-hugo build-mdbooks prod-build serve-hugo serve-mdbook serve-prod

# List of all mdbook projects
MDBOOK_PROJECTS = configureProjects react rust ts

# Final build output directory
DIST_DIR = .dist

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

# Production build (everything in one directory)
prod-build: clean check-deps
	@echo "🚀 Building production site..."
	@mkdir -p $(DIST_DIR)

	@echo "📦 Building Hugo..."
	@hugo --minify -d $(DIST_DIR)

	@echo "📦 Building mdBook projects..."
	@for project in $(MDBOOK_PROJECTS); do \
		echo "Building $$project..."; \
		cd notebooks/$$project && mdbook build && cd - >/dev/null; \
		mkdir -p $(DIST_DIR)/notebooks/$$project; \
		rsync -a notebooks/$$project/book/ $(DIST_DIR)/notebooks/$$project/; \
	done

	@echo "✅ Production build complete in $(DIST_DIR)/"

# Check system dependencies
REQUIRED_CMDS = git mdbook hugo rsync python3

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
	@rm -rf public/ $(DIST_DIR)/
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

# Serve the merged production build locally
serve-prod: prod-build
	@echo "Serving production build from $(DIST_DIR)..."
	@cd $(DIST_DIR) && python3 -m http.server 8080
