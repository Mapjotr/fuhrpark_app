# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Peter Schmitz",
             email: "peter.schmiz@gmx.de",
             password:              "password",
             password_confirmation: "password",
             admin: true,
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

users = User.order(:created_at).take(6)
50.times do
  content = Faker::ChuckNorris.fact[0..139]
  users.each { |user| user.microposts.create!(content: content) }
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


users = User.order(:created_at).take(3)
15.times do
  car_name_and_model = car_names_and_models.sample
  users.each { |user| user.cars.create!(
        car_name: car_name_and_model[0],
        car_brand: car_name_and_model[1],
        car_model: car_name_and_model[2],
        purchase_price: rand(5000...40000).round(-3),
        registrationdate: Time.at((7.years.ago.to_f - 3.years.ago.to_f)*rand + 1.years.ago.to_f),
        purchase_date: Time.at((5.years.ago.to_f - 1.years.ago.to_f)*rand + 1.years.ago.to_f),
        milage_purchase_date: rand(1000...80000).round(-2), 
        seller:sellers.sample,
        fuel_type: fuel_types.sample,
        numberplate: numberplates.sample,
        cubic_capacity: rand(1600...4200).round(-2),
        engine_power: rand(80...400).round(-2),
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
        liters:rand(30.0...75.0).round(1),
        filled_up:[true, false].sample
    ) }
end