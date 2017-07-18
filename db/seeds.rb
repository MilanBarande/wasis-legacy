# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
User.destroy_all


user1 = User.create(name: "Milan", address:"5333 rue Casgrain", city:"Montreal", email:"milan@milan.com", password:"12345678")
user2 = User.create(name: "Bob", address:"7342 rue drolet", city:"Montreal", email:"bob@milan.com", password:"12345678")
user3 = User.create(name: "Romain", address:"3725 av Carlton", city:"Montreal", email:"romain@milan.com", password:"12345678")
user4 = User.create(name: "Melissa", address:"4475 Av Coronation", city:"Montreal", email:"melissa@milan.com", password:"12345678")
user5 = User.create(name: "Sarah", address:"1822 rue sherbrooke ouest", city:"Montreal", email:"sarag@milan.com", password:"12345678")
user6 = User.create(name: "Edward", address:"434 av victoria", city:"Montreal", email:"edward@milan.com", password:"12345678")

Product.create!([{name: 'Pikolo Espresso Bar',
                 type: 'coffee shop',
                 description:'Single origin coffees, latte art & homemade goods lure locals to this snug, retro-industrial outfit.',
                 photo_url:'https://goo.gl/iqqjc9',
                 features: '',
                 user_id: user1.id},
                 {name: 'Café Humble Lion',
                 type: 'coffee shop',
                 description:'Rustic-chic indie cafe turning out a variety of coffee drinks, teas & hot chocolate, plus pastries.',
                 photo_url:'goo.gl/Y8R8SLcontent_copyCopy short URL',
                 features: '',
                 user_id: user2.id},])


