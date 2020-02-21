# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create(name: Faker::JapaneseMedia::DragonBall.character)
  post = Post.create(user: user, subject:Faker::Lorem.sentence , body: Faker::Quote.matz)
  Comment.create(user: user, post: post, body: Faker::Quote.matz)
end
