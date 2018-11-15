# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.destroy_all
User.destroy_all
Category.destroy_all
Comment.destroy_all
Follow.destroy_all
Heart.destroy_all


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'developer@gmail.com', password: 'developer')

puts 'Create User............................................................................................'

15.times do
  category = Category.create!(title: Faker::Book.title,
                              user: User.first)
end

puts 'Create Categories......................................................................................'

# 25.times do
#   comment = Comment.create!()
# end



#
#   15.times do
#     book = Book.create!(
#       title: Faker::Book.title,
#       description: Faker::Lorem.sentence(50, true).chop,
#       price: Faker::Commerce.price,
#       in_stock: Faker::Commerce.price(range = 1..10),
#       author: Author.first,
#       category: category
#     )
#
#     Author.create!(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       biography: Faker::Lorem.paragraph(3, true),
#       books: [book]
#     )
#   end
# end
#
#
# unless Image.none?
#   3.times do
#     Image.find(Random.rand(25)).comments.create!(body: 'Its amazing', user_id: 1)
#   end
# end
