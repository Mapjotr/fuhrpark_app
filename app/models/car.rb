class Car < ApplicationRecord
  belongs_to :user
  has_many :refuellings, dependent: :destroy
  default_scope -> { order(car_name: :asc) }
  validates :user_id, presence: true
  validates :car_name, presence: true, length: { maximum: 30 }
  validates :car_model, presence: true, length: { maximum: 50 }
end
