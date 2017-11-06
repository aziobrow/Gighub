# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean

Category.create!([{
  name: "Technology"
},{
  name: "Home Repair"
}])

User.create!([{
  username: "user",
  password: "1234",
  email: "aziobrow@gmail.com"
},{
  username: "admin",
  password: "1234",
  email: "anna@gmail.com",
  role: :admin
}])

Item.create!([{
  title: "Build a Website",
  description: "I'll make you a cool website!",
  category: Category.first,
  price: 1099,
  image_url: "http://www.makeawebsiteguru.com/wp-content/uploads/2015/04/ways-to-build-a-website.png"
},{
  title: "Plumbing",
  description: "I'll unclog your sink!",
  category: Category.last,
  price: 15000,
  image_url: "https://www.homedepot.com/hdus/en_US/DTCCOMNEW/fetch/Category_Pages/Kitchen/Sinks/bar-prep-sink-400x400-2.png"
}])

Order.create!([{
  user: User.default.first
},{
  user: User.default.first
}])

OrderItem.create!([{
  order: Order.first,
  item: Item.first,
  quantity: 2
},{
  order: Order.first,
  item: Item.last,
  quantity: 1
},{
  order: Order.last,
  item: Item.first,
  quantity: 3
}])
