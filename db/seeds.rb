# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  internet_name = Faker::Internet.user_name
  User.create(email: Faker::Internet.email, password: 'password', full_name: Faker::Name.name, birthday: Faker::Date.birthday,
  hometown: Faker::Address.city, current_city: Faker::Address.city, education: Faker::Educator.university, pic_url: Faker::Avatar.image(internet_name))
end

1000.times do
  Post.create(body: Faker::Lorem.paragraph(2), author: User.all.sample, receiver: User.all.sample)
end

1000.times do
  User.all.sample.add_friend(User.all.sample)
end
