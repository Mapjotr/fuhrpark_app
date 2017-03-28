class Refuelling < ApplicationRecord
	belongs_to :car
	default_scope -> { order(created_at: :desc) }
	validates :refuel_date, presence: true
	validates :milage, presence: true, numericality: true
	validates :cents_per_liter, presence: true
	validates :liters, presence: true
	validates :filling_station, presence: true,length: { maximum: 100 }
	validates :location, presence: true, length: { maximum: 60 }
end