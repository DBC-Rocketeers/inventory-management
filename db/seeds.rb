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

rocket_parts = {'1212': 'Shock Cord Mount','3424':  'Parachute','12565612':  'Shroud lines','6542':  'Recovery Wadding','12906312':  'Body Tube','5225':  'Launch Lug','75785':  'Fins','5356':  'Engine Block','8757':  'Rocket Engine','957464':  'Igniter'}

rocket_parts.each do |code, name|
  Part.create!(name: name, number: code)
end

30.times do
  Entry.create!(order: Order.all.sample, part: Part.all.sample, ordered_quantity: 10 + Random.rand(11), received_quantity: 0)
end
