# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{name: "Technology"}, {name: "Home Repair"}])
User.create([{username: "aziobrow", password: "1234", email: "aziobrow@gmail.com"}])
Item.create([{title: "Build a Website", image_url: "http://www.makeawebsiteguru.com/wp-content/uploads/2015/04/ways-to-build-a-website.png", price: 10, description: "I'll make you a cool website!", category: Category.first},
             {title: "Plumbing", image_url: "https://www.homedepot.com/hdus/en_US/DTCCOMNEW/fetch/Category_Pages/Kitchen/Sinks/bar-prep-sink-400x400-2.png", price: 50, description: "I'll unclog your sink!", category: Category.last}])
Order.create([{shipping_address: "123 Main St.", user: User.first}])
