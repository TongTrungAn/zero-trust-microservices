#!/bin/bash
# Zero Trust Identity Acquisition Script
# This script fetches a JWT token from Keycloak for testing identity propagation.

KC_PORT=$(kubectl get svc -n iam keycloak -o jsonpath='{.spec.ports[0].nodePort}')
KC_URL="http://localhost:8080" # Assuming port-forward is running

echo "Attempting to fetch JWT for user: trungan..."
curl -s -X POST "$KC_URL/realms/ZeroTrustLab/protocol/openid-connect/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "username=trungan" \
     -d "password=123456" \
     -d "grant_type=password" \
     -d "client_id=bookinfo-client" | jq -r .access_token
