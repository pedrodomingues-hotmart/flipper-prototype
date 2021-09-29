if User.first.present?
  puts '== Seeds already generated. skipping seed =='
else
  puts '== Creating Users =='
  User.create(
    [
      { name: 'Admin User 1', role: :admin},
      { name: 'Admin User 2', role: :admin},
      { name: 'Vip User', role: :vip},
      { name: 'User User', role: :user},
    ]
  )
end

puts '== Done! =='
