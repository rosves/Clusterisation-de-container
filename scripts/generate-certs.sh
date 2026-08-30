#!/bin/bash
set -e

CERTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/certs"
mkdir -p "$CERTS_DIR"

echo "Création des certificats SSL"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$CERTS_DIR/site.key" \
  -out "$CERTS_DIR/site.crt" \
  -subj "/C=FR/ST=Paris/L=Paris/O=ESGI/OU=Cluster/CN=app.local" \
  -addext "subjectAltName=DNS:app.local,DNS:localhost,IP:127.0.0.1"

chmod 600 "$CERTS_DIR/site.key"
chmod 644 "$CERTS_DIR/site.crt"

echo "Certificats disponibles dans: $CERTS_DIR"
echo "  - Certificat : $CERTS_DIR/site.crt"
echo "  - Clé privée : $CERTS_DIR/site.key"
