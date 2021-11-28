# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_admin = User.new(email:"admin@gmail.com", password:"123456")
user_admin.add_role(:admin)
user_admin.save

user_modulator = User.new(email:"modulator@gmail.com", password:"123456")
user_modulator.add_role(:modulator)
user_modulator.save

user_anonymous = User.new(email:"anonymous@gmail.com", password:"123456")
user_anonymous.add_role(:anonymous)
user_anonymous.save

user = User.new(email:"user@gmail.com", password:"123456")
user.save

(1..3).each do |i| 
    Product.create(name: "product #{i} admin", qty: i, user_id: user_admin.id)
    Product.create(name: "product #{i} modulator", qty: i, user_id: user_modulator.id)
    Product.create(name: "product #{i} user", qty: i, user_id: user.id)
end
