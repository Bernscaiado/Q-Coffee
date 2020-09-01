# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Coffee.delete_all
User.delete_all

user1 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste1@teste')
user2 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste2@teste')
user3 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste3@teste')

roast_types = ['light', 'medium', 'dark']
users = [user1, user2, user3]

3.times do
  coffee = Coffee.create!(
    name: Faker::Coffee.blend_name,
    brand: Faker::App.name,
    sensory: Faker::Coffee.notes,
    origin: Faker::Coffee.origin,
    roast: roast_types.sample,
    farm: Faker::Team.name,
    user: user2)

  3.times do
    Review.create!(
      content: Faker::Lorem.sentence,
      rating: rand(1..5),
      user:  user1,
      coffee: coffee)
  end

end


