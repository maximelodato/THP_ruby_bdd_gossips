require "faker"

# Supprimer toutes les entrées existantes
User.destroy_all
City.destroy_all
Gossip.destroy_all

# Créer 10 villes aléatoires
cities = 10.times.map do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.postcode
  )
end

# Créer 10 utilisateurs aléatoires
users = 10.times.map do
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,  # Ajout du username
    description: Faker::Lorem.paragraph(sentence_count: 5), 
    email: Faker::Internet.email, 
    age: Faker::Number.between(from: 13, to: 60),
    city: cities.sample,
    password: "password",
    password_confirmation: "password"
  )
end

# Créer 10 gossips aléatoires
10.times do
  title = Faker::Lorem.words(number: 3).join(" ")  # Générer le titre
  # S'assurer que le titre ne dépasse pas 14 caractères
  title = title[0...14] if title.length > 14

  Gossip.create!(
    title: title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample  # Utiliser le tableau des utilisateurs créés
  )
end
