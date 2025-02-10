# Define variables
BASE_FOLDER=/home/bhagavan/my-git-repos/rest-servers
LOGS_FOLDER=$(BASE_FOLDER)/logs

# Default target (help)
help:
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo "  make start     - Start all FastAPI servers"
	@echo "  make stop      - Stop all running servers"
	@echo "  make restart   - Restart all servers"
	@echo "  make status    - Show the status of all servers"
	@echo "  make clean     - Clean logs and temporary files"
	@echo ""
	@echo "Example: make start"

# Start all servers
start:
	@echo "Starting all servers..."
	@bash start-servers.sh

# Stop all servers
stop:
	@echo "Stopping servers on ports 7777, 8888, 9999..."
	@for port in 7777 8888 9999; do \
	    pid=$$(lsof -ti :$$port); \
	    if [ -n "$$pid" ]; then \
	        echo "Killing process on port $$port (PID: $$pid)..."; \
	        kill -9 $$pid; \
	    else \
	        echo "No process running on port $$port."; \
	    fi; \
	done
	@echo "All servers stopped."

# Check server status
status:
	@echo "Checking server status..."
	@for port in 7777 8888 9999; do \
	    pid=$$(lsof -ti :$$port | head -n 1); \
	    if [ -n "$$pid" ]; then \
	        echo "Server running on port $$port (PID: $$pid)"; \
	    else \
	        echo "No server running on port $$port"; \
	    fi; \
	done

# Restart all servers
restart: stop start

# Clean log files
clean:
	@echo "Cleaning log files..."
	@rm -rf $(LOGS_FOLDER)/*.log
	@find $(BASE_FOLDER) -name __pycache__ -exec rm -rf {} +
	@echo "Log files cleaned."
