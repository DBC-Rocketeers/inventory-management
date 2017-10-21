Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')

seattle = Warehouse.create!(name: "Seattle")
houston = Warehouse.create!(name: "Houston")
nose = Part.create(name: "Nose Cone", number: 1234)
flux = Part.create(name: "Flux capacitor", number: 2345)
oxidizer = Part.create(name: "Oxidizer", number: 3456)
fuel_pump = Part.create(name: "Fuel Pump", number: 4567)

seattle.parts << nose
seattle.parts << nose
seattle.parts << flux
seattle.parts << oxidizer
seattle.parts << oxidizer

houston.parts << nose
houston.parts << fuel_pump


warehouses_locations = [seattle, houston]

6.times do
  Order.create!(warehouse: warehouses_locations.sample)
end

rocket_parts = {'Shock Cord Mount': 13253, 'Parachute': 53453,'Shroud lines': 12144322,'Recovery Wadding': 22342,'Body Tube': 854,'Launch Lug': 13455, 'Fins': 967765,'Engine Block': 1242412,'Rocket Engine': 136,'Igniter': 745376}

rocket_parts.each do |name, code|
  Part.create!(name: name, number: code)
end

30.times do
  Entry.create!(order: Order.all.sample, part: Part.all.sample, ordered_quantity: 10 + Random.rand(11), received_quantity: 0)
end
