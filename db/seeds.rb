Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')

seattle = Warehouse.create(name: "Seattle")
houston = Warehouse.create(name: "Houston")
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
