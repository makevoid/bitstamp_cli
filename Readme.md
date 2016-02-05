# Bitstamp-CLI

A script to check your Bitstap open orders via CLI, place a buy order, a sell order or cancel an existing one.

### Configuration

Download the repo and enter the `bitstamp_cli` directory.

Copy the default configurations:

    cp config/bitstamp.default.json config/bitstamp.json

### Setup

From the repo dir:

    gem i bundler

    bundle

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

The `./stamp` alias is also available, instead of `bitstamp_cli` you can use:

    ./stamp

Then, you can put a instant (market) `BUY` order:

    ./bitstamp_cli buy 0.015

This will put a BUY order for `0.015` BTC (at the moment ~5$ - @ ~380$/BTC)

A `SELL` instant order:

    ./bitstamp_cli sell 0.015

And finally cancel an order:

    ./bitstamp_cli cancel ORDER_ID

You can check your order id from the `Open orders` output, an example is `#123123123`, you have to pass `123123123` without the `#` sign. Bare in mind the minimum order on Bitstamp is 5$.

Enjoy,

[@makevoid](https://twitter.com/makevoid)
