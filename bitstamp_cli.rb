require_relative "lib/bitstamp_cli"
orders_show = @orders_show
buy = @buy
sell = @sell
cancel = @cancel
price = @price
get_action = @get_action
process_action = @process_action

price.()

orders_show.()

action = get_action.()
process_action.(action) if action

# p Bitstamp.user_transactions.all
