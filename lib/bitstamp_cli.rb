require 'json'
require 'bitstamp'
require_relative 'env'

orders = -> {
  Bitstamp.orders.all
}

cancel = -> (order_id)  {
  return unless order_id
  order = Bitstamp::Order.new id: order_id
  order.cancel!
}

CACHE = {}


ticker = -> {
  CACHE[:ticker] ? CACHE[:ticker] : Bitstamp.ticker
}

price = -> (from = :bid) {
  ticker.().send from
}

price_print = -> {
  tick = ticker.()
  puts "\nPrice: #{tick.last} (low/high: #{tick.low}<->#{tick.high})\n\n"
}

balance = -> {
  bal = Bitstamp.balance
  puts "Available:\n$ #{bal["usd_available"]} - ~#{bal["btc_available"].to_f.round(4)} BTC\n\n"
}

buy = -> (amount) {
  Bitstamp.orders.buy amount: amount, price: price.(:ask)
}

sell = -> (amount) {
  Bitstamp.orders.sell amount: amount, price: price.(:bid)
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
  puts "Open orders: \n#{"-"*35}\n#{ords.map(&display_order).join("\n")}\n\n"
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
  puts "Executing: #{name}(#{amount})\n"

  output = case name
  when "buy"
    buy.(amount)
  when "sell"
    sell.(amount)
  when "cancel"
    cancel.(order_id)
  end
  puts "-"*35
  if output.is_a? Bitstamp::Order
    if output.error
      puts "Error: #{output.error["__all__"].join(", ")}"
    else
      p output
    end
  else
    puts output
  end
  puts "-"*35

  puts "done!\n\n"
  orders_show.()
}

buy    = wrap buy
sell   = wrap sell
cancel = wrap cancel

@price_print = price_print
@balance = balance
@orders_show = orders_show
@buy = buy
@sell = sell
@cancel = cancel
@get_action = get_action
@process_action = process_action
