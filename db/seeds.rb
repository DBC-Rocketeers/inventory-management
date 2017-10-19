# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')
#   Character.create(name: 'Luke', movie: movies.first)


seattle = Warehouse.create(name: "Seattle")

seattle.parts << Part.create(name: "Nose Cone", number: 1234)
seattle.parts << Part.create(name: "Nose Cone", number: 1234)
seattle.parts << Part.create(name: "Flux capacitor", number: 2345)
seattle.parts << Part.create(name: "Oxidizer", number: 3456)
seattle.parts << Part.create(name: "Fuel Pump", number: 4567)
