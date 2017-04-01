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