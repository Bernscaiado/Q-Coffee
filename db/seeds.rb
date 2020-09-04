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

origin = ['Sul de Minas', 'Mantiqueira de Minas', 'Matas de Minas',
          'Cerrado Mineiro', 'Alta Mogiana', 'Chapada Diamantina (BA)',
          'Montanhas do Espírito Santo', 'Norte Pioneiro do Paraná', 'Rondônia',
          'Ceará','Caparaó (ES)', 'Caparaó (MG)', 'Mococa (SP)']
origin.each do |orig|
  Origin.create!(name: orig)
end

User.create!(first_name: 'teste1', about: 'teste', password: '123123', email:'teste1@teste')
User.create!(first_name: 'teste2', about: 'teste', password: '123123', email:'teste2@teste')
User.create!(first_name: 'teste3', about: 'teste', password: '123123', email:'teste3@teste')

roast = ['clara', 'média', 'escura']
sensory = ['frutado', 'achocolatado', 'floral']
taste = ['doce', 'ácido', 'equilibrado', 'amargo']
name = ['teste1','teste2','teste3']

5.times do
  a = Origin.find_by_name(origin.sample)
  b = User.find_by(first_name: name.sample)
  coffee = Coffee.create!(
    name: Faker::Coffee.blend_name,
    brand: Faker::App.name,
    sensory: sensory.sample,
    taste: taste.sample,
    origin_id: a.id,
    roast: roast.sample,
    farm: Faker::Team.name,
    user: b)

  5.times do
      b = User.find_by(first_name: name.sample)
    Review.create!(
      content: Faker::Lorem.sentence,
      rating: rand(1..5),
      user:  b,
      coffee: coffee)
  end
end


