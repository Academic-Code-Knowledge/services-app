# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# System roles are [admin, operator, user]

u1 = User.create({first_name: 'Admin', last_name: 'System', password: '123456', email: 'admin@admin.com', role: 'admin', status: true})
u2 = User.create({first_name: 'Operator', last_name: 'System', password: '123456', email: 'operator@admin.com', role: 'operator', status: true})
u3 = User.create({first_name: 'User', last_name: 'System', password: '123456', email: 'user@admin.com', role: 'user', status: true})
