# Bitstamp-CLI

A script to check your Bitstap open orders via CLI, place a buy order, a sell order or cancel an existing one.

### Configuration

Copy the default configurations:

    cp config/bitstamp.default.json config/bitstamp.json

### Setup

    gem i bitstamp

### Execute

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
