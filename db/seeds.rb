# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Category.destroy_all
User.destroy_all

Category.create!([{name: "Technology"}, {name: "Home Repair"}])
User.create!([{username: "aziobrow", password: "1234", email: "aziobrow@gmail.com", role: 1}, {username: "anna", password: "1234", email: "anna@gmail.com", role: 0}])
Item.create!([{title: "Build a Website", image_url: "http://www.makeawebsiteguru.com/wp-content/uploads/2015/04/ways-to-build-a-website.png", price: 10, description: "I'll make you a cool website!", category: Category.first},
             {title: "Plumbing", image_url: "https://www.homedepot.com/hdus/en_US/DTCCOMNEW/fetch/Category_Pages/Kitchen/Sinks/bar-prep-sink-400x400-2.png", price: 50, description: "I'll unclog your sink!", category: Category.last}])
Order.create!([{service_address: "123 Main St.", purchaser_name: "Aurora", status: 0, user: User.first}])
OrderItem.create![{order: Order.first, item: Item.first, unit_cost: Item.first.price, quantity: 3}]
