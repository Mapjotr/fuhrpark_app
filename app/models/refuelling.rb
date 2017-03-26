class Refuelling < ApplicationRecord
	belongs_to :car
	default_scope -> { order(created_at: :desc) }
end