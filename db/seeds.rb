require 'faker'

# Supprime tous les articles existants
Article.delete_all

# Seed for creating 30 articles
30.times do
  user = User.all.sample
  Article.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs.join("\n\n"), # Ajout de la virgule ici
    user: user
  )
end

puts "Articles seeded successfully"

# Assigning the first three articles to the first three users
first_three_users = User.limit(3) # Correction ici, User.limit(3) au lieu de User.limit(2)

Article.all.each_with_index do |article, index|
  article.user = first_three_users[index]
  article.save
end

puts "Users assigned to articles successfully"

