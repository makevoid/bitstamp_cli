# Bitstamp-CLI

A script to check your Bitstap open orders via CLI, place a buy order, a sell order or cancel an existing one.

### Configuration

Copy the default configurations:

    cp config/bitstamp.default.json config/bitstamp.json

### Setup

    gem i bitstamp

### Usage:

Whithout arguments, it returns the price, your balance (USD and BTC), and your open orders.

    ./bitstamp_cli


Example output:

    Price: 390.00 (low/high: 380.00<->399.00)
    
    Available:
    $ 50.00 - ~0.2 BTC
    
    Open orders: 
    -----------------------------------
    #123123123	- 0.15Ƀ @ 350.00$
    #123123124	- 0.25Ƀ @ 320.00$
    ...

You can put a instant (market) `BUY` order:

    ./bitstamp_cli buy 0.0001
    
A `SELL` instant order:
    
    ./bitstamp_cli sell 0.0001
    
And finally cancel an order:

    ./bitstamp_cli cancel ORDER_ID

You can check your order id from the `Open orders` output, an example is `#123123123`, you have to pass `123123123` without the `#` sign.

Enjoy,

[@makevoid](https://twitter.com/makevoid)
