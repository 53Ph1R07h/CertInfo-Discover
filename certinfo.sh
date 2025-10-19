#!/bin/bash
# getcertinfo.sh
# Simple wrapper to fetch and print SSL certificate details using openssl
# Preserves original behavior — only function name lowercased.

getcertinfo() {
    local domain=$1
    echo "Fetching SSL certificate for: $domain"
    
    # Use OpenSSL to retrieve the certificate
    cert_info=$(echo | openssl s_client -servername "$domain" -connect "$domain:443" -showcerts 2>/dev/null | openssl x509 -inform PEM -noout -text)

    echo "$cert_info"

    # Extract Serial Number and Format Hex as Decimal (human-readable-ish)
    echo "Serial Number (Human-readable):"
    echo "$cert_info" | grep -A 1 "Serial Number" | tail -n 1 | tr -d '[:space:]' | sed 's/:/ /g'

    # Extract Public Key in readable format
    echo "Public Key (Formatted Hex to ASCII if applicable):"
    echo "$cert_info" | grep -A 10 "Public-Key" | tail -n 10 | sed 's/:/ /g'
}

# Check if domain argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

# Run the function with the provided domain
getcertinfo "$1"
