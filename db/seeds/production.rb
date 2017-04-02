User.create!(name:  "Peter Schmitz",
             email: "peter.schmiz@gmx.de",
             password:              "GrosseFuge133",
             password_confirmation: "GrosseFuge133",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Klaus Schmitz",
             email: "info@schmiz.de",
             password:              "GrosseFuge133",
             password_confirmation: "GrosseFuge133",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Peter Schmitz",
             email: "peter@schmiz.de",
             password:              "GrosseFuge133",
             password_confirmation: "GrosseFuge133",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)


users = User.order(:created_at).take(3)

## CAR SAMPLES
car_names_and_models =   [['BMW Papa','BMW', '7'],
                        ['Mercedes','Mercedes','E320'],
                        ['Audi','Audi','A3'], 
                        ['Astra','Opel','Astra Kombi'], 
                        ['Caddy','VW','Caddy 1.6'], 
                        ['Mamas Citroen','Citroen','Picasso'], 
                        ['Golf Zicka','VW',' Golf 5']
                        ]

sellers = ['Autohaus', 'Privat']
fuel_types = ['Diesel', 'Benzin', 'Elektro', 'Gas']
numberplates = ['TR-ES 48','TR-FS 85','TR-CS 43','B-AS 80','E-MS 79']
insurance_nrs = ["51.213.726  466","51.213.726","51.213.720  466"]
buyers = ["Verschenkt and Ursula und Guntram", "Werner,Trier","Russe, St.Petersburg"]

car_name_and_model = car_names_and_models.sample
users.each { |user| user.cars.create!(
      car_name: car_name_and_model[0],
      car_brand: car_name_and_model[1],
      car_model: car_name_and_model[2],
      purchase_price: rand(5000.0...40000.0).round(-3),
      registrationdate: Time.at((7.years.ago.to_f - 3.years.ago.to_f)*rand + 1.years.ago.to_f),
      purchase_date: Time.at((5.years.ago.to_f - 1.years.ago.to_f)*rand + 1.years.ago.to_f),
      milage_purchase_date: rand(1000...80000).round(-2), 
      seller:sellers.sample,
      fuel_type: fuel_types.sample,
      numberplate: numberplates.sample,
      cubic_capacity: rand(1600...4200).round(-2),
      engine_power: rand(80...400).round(-2),
      emission_class: "EUR #{rand(1..6)}",
      insurance_nr: insurance_nrs.sample,
      sf_class: rand(1...30),
      sf_perc: rand(1...100),
      liability: rand(30.0...500.0).round(2),
      comprehensive_part: rand(30.0...500.0).round(2),
      comprehensive_full: rand(30.0...500.0).round(2),
      tax: rand(30.0...500.0).round(2),
      sold: [true, false].sample,
      sold_date: Time.at((2.years.ago.to_f - 1.years.ago.to_f)*rand + Time.zone.now.to_f),
      sale_price: rand(5000.0...40000.0).round(-3),
      buyer: buyers.sample
  ) }
