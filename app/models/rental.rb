class Rental < ApplicationRecord
  belongs_to :car
  default_scope -> { order(rental_date_out: :desc) }
  validates :customer, :rental_date_out, :presence=>true
end
