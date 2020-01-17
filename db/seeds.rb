# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do |product_index|
  product = Product.create!(name: Faker::NatoPhoneticAlphabet.code_word, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Nation.nationality)
  product.save
  5.times do |review_index|
    review = Review.create!(author: Faker::Name.first_name, content_body: Faker::Lorem.characters(number: 100), rating: Faker::Number.between(from: 1, to: 5), product_id: product.id)
    review.save
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
