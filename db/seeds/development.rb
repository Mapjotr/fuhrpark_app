User.create!(name:  "Peter Schmitz",
             email: "peter.schmiz@gmx.de",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Peter Schmitz",
             email: "peter@schmiz.de",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
    name  = Faker::GameOfThrones.character
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!( name:  name,
                email: email,
                password:              password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now
    )
end


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

users = User.order(:created_at).take(3)
15.times do
  car_name_and_model = car_names_and_models.sample
  users.each { |user| user.cars.create!(
        car_name: car_name_and_model[0],
        car_brand: car_name_and_model[1],
        car_model: car_name_and_model[2],
        purchase_price: 23.45, #sprintf("%.2f",rand(5000.00...40000.00).round(2)),
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
        liability: 23.45, #rand(30.00...500.00).round(2),
        comprehensive_part: 23.45, #sprintf("%.2f",rand(30.00...500.00).round(2)),
        comprehensive_full: 23.45, #rand(30.00...500.00).round(2),
        tax: 23.45,#rand(30.00...500.00).round(2),
        sold: [true, false].sample,
        sold_date: Time.at((2.years.ago.to_f - 1.years.ago.to_f)*rand + Time.zone.now.to_f),
        sale_price: rand(5000.0...40000.0).round(-3),
        buyer: buyers.sample
    ) }
end

## REFUELLING SAMPLES
station_names_and_cities = [['Aral Ostallee','Trier'],
                            ['Total Lux','Wasserbillig'],
                            ['Shell Görli','Berlin']]

cars_sample = Car.order(:created_at).take(15)

20.times do
  station_name_and_city = station_names_and_cities.sample
  cars_sample.each { |car| car.refuellings.create!(
        refuel_date: Time.at((2.years.ago.to_f - 1.years.ago.to_f)*rand + Time.zone.now.to_f),
        milage: rand(5000...80000).round(-2),
        cents_per_liter:rand(80...140),
        filling_station: station_name_and_city[0],
        location: station_name_and_city[1],
        liters:rand(30.0...75.0).round(2),
        filled_up:[true, false].sample
    ) }
end

## Repairs SAMPLES
titles_and_descriptions = [
    ['Reifenwechsel','Alle vier Reifen wurden durch Allzweckreifen getauscht'],
    ['Licht','Licht vorne links wurde ausgetauscht'],
    ['Tüv','Tüv wurde erneuert. Gilt jetzt bis 07/2016'],
    ['Bremsscheibe','Bremsscheiben wurde erneurt. Bremsblock vorne links musste auch ausgetauscht werden']
]

garages = ['Herr Schmitz', 'Autohaus Subaru Berlin Spandau', 'Auto Hoff Trier']

cars_sample = Car.order(:created_at).take(15)

20.times do
  title_and_description = titles_and_descriptions.sample
  cars_sample.each { |car| car.repairs.create!(
        repair_date: Time.at((3.years.ago.to_f - 1.years.ago.to_f)*rand + Time.zone.now.to_f),
        title: title_and_description[0],
        description: title_and_description[1],
        billings_amount: rand(30.0...850.0).round(2),
        garage: garages.sample
    ) }
end