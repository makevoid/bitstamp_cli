require_relative "lib/bitstamp_cli"

# imports
orders_show = @orders_show
price_print = @price_print
balance = @balance
buy = @buy
sell = @sell
cancel = @cancel
get_action = @get_action
process_action = @process_action

# config: set your own currency
LOCAL_CURR = "GBP"

# ------------------------------
#  Main
# ------------------------------

# first print the price of BTC
price_print.()

# then query the balance
balance.()

# then show your open orders
orders_show.()

# and finally parse the action if any
action = get_action.()
process_action.(action) if action


# TODO:
# p Bitstamp.user_transactions.all
