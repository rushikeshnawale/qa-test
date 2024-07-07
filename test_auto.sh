#!/bin/bash

frontend_url="http://<minikube-ip>:<frontend-port>"  # Replace with your frontend service URL
backend_endpoint="$frontend_url/greet"
expected_message="Hello from the Backend!"

# Make a GET request to the backend endpoint
response=$(curl -sS $backend_endpoint)

# Check if the response contains the expected message
if echo "$response" | grep -q "$expected_message"; then
    echo "Integration test passed! Frontend correctly displays message from backend."
    exit 0  # Exit with success status
else
    echo "Integration test failed! Frontend did not display expected message."
    echo "Received message: $response"
    exit 1  # Exit with failure status
fi

