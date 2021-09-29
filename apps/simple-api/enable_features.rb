
puts '== Disabling features =='
Flipper.disable(:alpha_feature)
Flipper.disable(:beta_feature)
Flipper.disable(:vip_feature)

puts '== Enabling features =='
Flipper.enable(:alpha_feature)

Flipper.enable_group(:beta_feature, :admins)

Flipper.enable_group(:vip_feature, :vips)
Flipper.enable_actor(:vip_feature, User.find_by(id: 1))