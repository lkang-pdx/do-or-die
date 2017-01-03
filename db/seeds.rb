50.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

50.times do
  Item.create!(
    name:  Faker::Hacker.say_something_smart,
    created_at: (rand*15).days.ago,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
