require 'json'
require 'bitstamp'
require_relative 'env'

orders = -> {
  Bitstamp.orders.all
}

cancel = -> (order_id)  {
  order = Bitstamp::Order.new id: order_id
  order.cancel!
}

CACHE = {}

price = -> (from = :bid) {
  tick = CACHE[:ticker] ? CACHE[:ticker] : Bitstamp.ticker
  puts "\nPrice is #{tick.last} (low/high: #{tick.low}<->#{tick.high})\n\n"
  tick.send from
}

buy = -> (amount) {
  result = Bitstamp.orders.buy amount: amount, price: price.(:bid)
  p result
}

sell = -> (amount) {
  Bitstamp.orders.sell amount: amount, price: price.(:ask)
}

get_action = -> {
  name, value = ARGV[0], ARGV[1]
  {
    name:  name,
    value: value,
  } if name || value
}

display_order = -> (order) {
  amount = order.amount.to_s.gsub /0+$/, ''
  "##{order.id}\t- #{amount}Ƀ @ #{order.price}$"
}

orders_show = -> {
  ords = orders.()
  puts "Your Open orders: \n#{ords.map(&display_order).join("\n")} \n"
}

def wrap(function)
  # puts "Executing action..."
  function
  # puts "done!"
  # orders_show
end

process_action = -> (action) {
  name     = action[:name]
  amount   = action[:value]
  order_id = action[:value]
  puts "\nExecuting: #{name}(#{amount})\n\n"

  case name
  when "buy"
    buy.(amount)
  when "sell"
    sell.(amount)
  when "cancel"
    cancel.(order_id)
  end

  puts "done!"
  orders_show.()
}

buy    = wrap buy
sell   = wrap sell
cancel = wrap cancel

@orders_show = orders_show
@buy = buy
@sell = sell
@cancel = cancel
@price = price
@get_action = get_action
@process_action = process_action
