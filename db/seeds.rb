# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

businesses = Business.create([
  { name: 'Applebees' },
  { name: 'Amazon' },
  { name: 'Google' },
  { name: 'Telecom First International'}
])

Job.create(title: 'Server', description: 'stuff a server does', pay: 9.75, available: true, business: businesses.first)
Job.create(title: 'Host', description: 'greet the people', pay: 6.50, available: true, business: businesses.first)
Job.create(title: 'Manager', description: 'tell everyone what to do', pay: 15.00, available: true, business: businesses.first)
Job.create(title: 'Line cook', description: 'cook stuff fast', pay: 8.92, available: true, business: businesses.first)

Job.create(title: 'Warehouse worker', description: 'slave away on a line', pay: 20.00, available: true, business: businesses.second)
Job.create(title: 'Front End Developer', description: 'make things pretty', pay: 35.00, available: true, business: businesses.second)
Job.create(title: 'Systems Administrator', description: 'live inside the terminal', pay: 80.88, available: true, business: businesses.second)
Job.create(title: 'CEO', description: 'You are Jeff Bezos', pay: 1000000000000000, available: false, business: businesses.second)
