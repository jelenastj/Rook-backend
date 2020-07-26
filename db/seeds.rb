# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username:"Jelena", email:"jelena@gmail.com", password_digest:"pass")
g1 = Gear.create(name: "tent", brand:"some", notes:"tra", geartype:"camping", url: "web", quantity: 1, user_id: 1, weight: 1)
t1= Trip.create(user_id: 1, location:"rockies")

