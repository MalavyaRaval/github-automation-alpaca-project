#!/bin/bash
"""
Alpaca Trader Script

This script automates Alpaca trading tasks:
- Check account balance.
- Place limit orders.
- Cancel orders.
- Check open orders.
"""

# Load environment variables
source .env

# Alpaca API endpoints
BASE_URL="https://paper-api.alpaca.markets/v2"

# Check account balance
check_balance() {
    curl -s -X GET "$BASE_URL/account" \
         -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
         -H "APCA-API-SECRET-KEY: $APCA_API_SECRET_KEY" | jq '.cash'
}

# Place a limit order
place_limit_order() {
    local symbol="$1"
    local qty="$2"
    local side="$3"  # buy/sell
    local limit_price="$4"
    
    curl -s -X POST "$BASE_URL/orders" \
         -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
         -H "APCA-API-SECRET-KEY: $APCA_API_SECRET_KEY" \
         -H "Content-Type: application/json" \
         -d "{\
             \"symbol\": \"$symbol\",\
             \"qty\": \"$qty\",\
             \"side\": \"$side\",\
             \"type\": \"limit\",\
             \"time_in_force\": \"day\",\
             \"limit_price\": \"$limit_price\"\
         }" | jq '.'
}

# Cancel an order
cancel_order() {
    local order_id="$1"
    
    curl -s -X DELETE "$BASE_URL/orders/$order_id" \
         -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
         -H "APCA-API-SECRET-KEY: $APCA_API_SECRET_KEY"
}

# Check open orders
check_open_orders() {
    curl -s -X GET "$BASE_URL/orders" \
         -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
         -H "APCA-API-SECRET-KEY: $APCA_API_SECRET_KEY" | jq '.'
}

# Main
case "$1" in
    "balance")
        echo "Account Balance: $"$(check_balance)
        ;;
    "buy")
        place_limit_order "$2" "$3" "buy" "$4"
        ;;
    "sell")
        place_limit_order "$2" "$3" "sell" "$4"
        ;;
    "cancel")
        cancel_order "$2"
        ;;
    "orders")
        check_open_orders
        ;;
    *)
        echo "Usage: $0 {balance|buy|sell|cancel|orders}"
        echo "Examples:"
        echo "  $0 balance"
        echo "  $0 buy AAPL 1 170.00"
        echo "  $0 sell AAPL 1 180.00"
        echo "  $0 cancel <order_id>"
        echo "  $0 orders"
        ;;
esac