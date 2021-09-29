require 'flipper/adapters/active_record'

Flipper.configure do |config|
  config.adapter { Flipper::Adapters::ActiveRecord.new }
end

Flipper.register(:admins) do |actor|
  actor.role === 'admin'
end

Flipper.register(:vips) do |actor|
  actor.role === 'vip'
end
