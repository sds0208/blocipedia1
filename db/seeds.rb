require 'faker'

20.times do 
    User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password")
end
Users = User.all

50.times do
    Wiki.create!(user: Users.sample, title: Faker::Hipster.sentence, body: Faker::Hipster.paragraphs(3))
end
Wikis = Wiki.all

# Create an admin user
admin = User.create!(
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
