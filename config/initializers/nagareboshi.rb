Nagareboshi.configure do |config|
  config.send = Rails.env.production?
end
