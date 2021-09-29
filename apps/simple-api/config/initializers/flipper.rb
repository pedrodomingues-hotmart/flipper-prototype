require 'flipper/adapters/active_record'

Flipper.configure do |config|
  config.default do
    adapter = Flipper::Adapters::ActiveRecord.new
    Flipper.new(adapter)
  end
end

Flipper.register(:admins) do |actor|
  actor.role === 'admin'
end

Flipper.register(:vips) do |actor|
  actor.role === 'vip'
end
