class Refuelling < ApplicationRecord
	belongs_to :car
	default_scope -> { order(refuel_date: :desc) }
	validates :refuel_date, :milage, :cents_per_liter, :liters, :filling_station,:location, :presence=>true
	validates :milage, numericality: { only_integer: true, greater_than: 1000 }, allow_nil: true #skips validation when value is nil
	#validates :cents_per_liter, presence: true
	#validates :liters, presence: true
	validates :filling_station, length: { maximum: 100 }, allow_nil: true
	validates :location,length: { maximum: 50 }, allow_nil: true
end