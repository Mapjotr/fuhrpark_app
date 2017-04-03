class Refuelling < ApplicationRecord
  belongs_to :car
  #default_scope -> { order(refuel_date: :desc) }
  validates :refuel_date, :milage, :cents_per_liter, :liters, :location, :presence=>true
  validates :milage, numericality: { only_integer: true, greater_than: 1000 }, allow_nil: true #skips validation when value is nil
  validates :filling_station, length: { maximum: 100 }, allow_nil: true
  validates :location,length: { maximum: 50 }, allow_nil: true
  before_save :default_values

  private

    def default_values
      self.liters ||= 0.0 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
      self.cents_per_liter ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
    end

end