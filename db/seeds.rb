# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Coffee.delete_all
Origin.delete_all
User.delete_all

origin = ['Sul de Minas', 'Mantiqueira de Minas (Denominação de Origem)', 'Matas de Minas (Montanhas de Minas)',
          'Cerrado Mineiro (Denominação de Origem)', 'Alta Mogiana (Indicação de Procedência)', 'Chapada Diamantina',
          'Montanhas do Espírito Santo', 'Norte Pioneiro do Paraná (Indicação de Procedência)', 'Rondônia',
          'Ceará','Caparaó (ES)', 'Caparaó (MG)']
origin.each do |orig|
  Origin.create!(name: orig)
end

user1 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste1@teste')
user2 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste2@teste')
user3 = User.create!(first_name: 'teste', about: 'teste', password: '123123', email:'teste3@teste')

roast = ['clara', 'média', 'escura']
users = [user1, user2, user3]
sensory = ['frutado', 'achocolatado', 'floral']
taste = ['doce', 'ácido', 'equilibrado', 'amargo']

3.times do
  a = Origin.find_by_name(origin.sample)
  coffee = Coffee.create!(
    name: Faker::Coffee.blend_name,
    brand: Faker::App.name,
    sensory: sensory.sample,
    taste: taste.sample,
    origin_id: a.id,
    roast: roast.sample,
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


