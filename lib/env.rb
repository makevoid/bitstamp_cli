path = File.expand_path "../../", __FILE__
PATH = path

config = File.read "#{path}/config/bitstamp.json"
config = JSON.parse config

Bitstamp.setup do |setup|
  setup.client_id = config["client_id"]
  setup.key       = config["key"]
  setup.secret    = config["secret"]
end
