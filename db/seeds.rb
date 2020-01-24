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

role_list = [
  ["Admin","Has access to all functions on the site"],
  ["Vendor","Has access to add, modify, and delete product records pertaining to their vendor"],
  ["Moderator","Has access to modify and delete comments to moderate their contents outside of our guidelines"],
  ["Curator","Has access to add, modify, and delete any product records"]
]
role_list.each do |name, description|
  Role.create(name: name, description: description)
end

vendor_list = [
  ["Boxes Limited", "We sell a limited number of boxes!"],
  ["Test Company Please Ignore","Write your corporation description here."]
  ]

vendor_list.each do |name, description|
  Vendor.create(name: name, description: description)
end

user_list = [
  ["admin@store.net", "123456"],
  ["vendor@store.net","123456", 1],
  ["moderator@store.net","123456"],
  ["curator@store.net","123456"]
]
user_list.each do |email, password, vendor_id|
  User.create(email: email, password: password, vendor_id: vendor_id)
end

User.all.each do |user|
  role = Role.find(user.id)
  user.roles << role
end
p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
p "Created #{Role.count} roles"
p "Created #{User.count} users"
