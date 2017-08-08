5.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: 'password',
    role: Faker::Number.between(0, 2),
    confirmed_at: Time.now.utc
  )
end

User.create!(email: 'standard@wiki.com', password: 'password', role: 0, confirmed_at: Time.now.utc)
User.create!(email: 'premium@wiki.com', password: 'password', role: 1, confirmed_at: Time.now.utc)
User.create!(email: 'admin@wiki.com', password: 'password', role: 2, confirmed_at: Time.now.utc)

10.times do
  Wiki.create!(
    title: Faker::StarWars.character,
    body: Faker::StarWars.quote,
    user_id: Faker::Number.between(1, 5)
  )
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
