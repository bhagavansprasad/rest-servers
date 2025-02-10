#!/bin/bash

BASE_FOLDER="/home/bhagavan/my-git-repos/rest-servers"
LOGS_FOLDER="$BASE_FOLDER/logs"
declare -A SERVICES=(
    ["stock_details"]=7777
    ["news_service"]=8888
    ["company_details"]=9999
)

mkdir -p "$LOGS_FOLDER"
echo "Starting all FastAPI servers..."

for service in "${!SERVICES[@]}"; do
    port=${SERVICES[$service]}
    echo "Starting $service on port $port..."
    (cd "$BASE_FOLDER/$service" && nohup uvicorn app.main:app --host 0.0.0.0 --port "$port" --reload > "$LOGS_FOLDER/$service.log" 2>&1 &)
    echo "$service started. Logs: $LOGS_FOLDER/$service.log"
done

echo "All servers started successfully!"
