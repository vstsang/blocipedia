User.create!(email: 'standard@wiki.com', password: 'password', role: 0, confirmed_at: Time.now.utc)
User.create!(email: 'premium@wiki.com', password: 'password', role: 1, confirmed_at: Time.now.utc)
User.create!(email: 'premium1@wiki.com', password: 'password', role: 1, confirmed_at: Time.now.utc)
User.create!(email: 'admin@wiki.com', password: 'password', role: 2, confirmed_at: Time.now.utc)

5.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: 'password',
    role: Faker::Number.between(0, 2),
    confirmed_at: Time.now.utc
  )
end

users = User.where('id <= 3').pluck(:id)

10.times do
  Wiki.create!(
    title: Faker::StarWars.character,
    body: Faker::StarWars.quote,
  )
end

wikis = Wiki.where('id <= 3').pluck(:id)

10.times do
  Collaborator.create!(
    user_id: Faker::Number.between(1, 9),
    wiki_id: wikis.sample
  )
end

10.times do
  Owner.create!(
    user_id: users.sample,
    wiki_id: Faker::Number.unique.between(1, 10)
  )
end

Wiki.all.each do |wiki|
  puts wiki.owner.user.email
  if wiki.owner.user.role == "premium"
    wiki.update_attribute(:private, true)
  end
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created, of which #{Wiki.where(private: true).count} are private wikis"
puts "#{Collaborator.count} collaborators created"
puts "#{Owner.count} owners created"
