.phony = help install serve-dev

venv:
	@echo "Creating virtual environment..."
	python3 -m venv .venv

install:
	@echo "Installing dependencies..."
	.venv/bin/pip install --upgrade pip
	.venv/bin/pip install -r requirements.txt

build:
	@echo "Building the project..."
	docker build --no-cache -t maturin/kem_bot:latest .

make deploy:
	@echo "Deploying the project..."
	chmod +x deploy.sh
	./deploy.sh
	docker run -d -p 8006:80 maturin/kem_bot

serve:
	@echo "Starting development server..."
	.venv/bin/fastapi dev src/main.py

test:
	@echo "Running tests..."
	.venv/bin/pytest
