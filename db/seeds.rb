# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'Book', description: "The best and most diverse books", id: 1)
Category.create(title: 'Magazine', description: "The best and most diverse magazines", id: 2)
#
#
Category.create(title: 'Manga', description: "The best and most diverse manga", id: 3)
#
10.times do |n|
  Product.create(title: "Book#{n}", description: "Book#{n} is a very interesting book", price: rand(1..200), category_ids: ["1"])
end
#
10.times do |n|
  Product.create(title: "Magazine#{n}", description: "Magazine#{n} is a very interesting magazine", price: rand(1..200), category_ids: ["2"])
end
#
10.times do |n|
  Product.create(title: "Manga#{n}", description: "Manga#{n} is a very interesting manga", price: rand(1..200), category_ids: ["3"])
end
#
User.create([email: 'admin@example.com', password: 'AdminPassword', admin: true])
