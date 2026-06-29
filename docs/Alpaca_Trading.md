# Alpaca Trading Best Practices

This document outlines best practices for Alpaca trading, including API usage, order placement, and local state management.

## API Key Management
Store API keys in `.env`:
```bash
APCA_API_KEY_ID="your_alpaca_api_key_id_here"
APCA_API_SECRET_KEY="8bB8iPZF4KW9fzkfJVd734VyWhxpXEo2KePLWJC1gDbd"
```

## Order Placement

### Limit Orders
Set a limit price slightly below the current market price for buys:
```bash
curl -X POST "https://paper-api.alpaca.markets/v2/orders" \
     -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
     -H "APCA-API-SECRET-KEY: $APCA_API_SECRET_KEY" \
     -H "Content-Type: application/json" \
     -d '{
         "symbol": "AAPL",
         "qty": "1",
         "side": "buy",
         "type": "limit",
         "time_in_force": "day",
         "limit_price": "170.00"
     }'
```

### Fractional Shares
Use `time_in_force: "day"` for fractional orders:
```bash
curl -X POST "https://paper-api.alpaca.markets/v2/orders" \
     -H "APCA-API-KEY-ID: $APCA_API_KEY_ID" \
     -H "APCA-API-SECRET-KEY: $APCA_API_KEY_SECRET" \
     -H "Content-Type: application/json" \
     -d '{
         "symbol": "AAPL",
         "notional": "100",
         "side": "buy",
         "type": "market",
         "time_in_force": "day"
     }'
```

## Local State Management
Maintain a local JSON file (`alpaca_state.json`) to track:
- Open orders.
- Filled trades.
- Account balance.

Example:
```json
{
  "open_orders": [
    {
      "symbol": "AAPL",
      "qty": "1",
      "side": "buy",
      "limit_price": "170.00"
    }
  ],
  "filled_trades": [],
  "account_balance": "10000.00"
}
```

## Scripts
See [scripts/alpaca_trader.sh](../scripts/alpaca_trader.sh) for a shell script to automate Alpaca trading tasks.