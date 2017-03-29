class Car < ApplicationRecord
  belongs_to :user
  has_many :refuellings, dependent: :destroy
  has_many :repairs, dependent: :destroy
  accepts_nested_attributes_for :refuellings
  default_scope -> { order(car_name: :asc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :car_name, presence: true, length: { maximum: 30 }
  validates :car_model, presence: true, length: { maximum: 50 }
  validate  :picture_size


  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 3.megabytes
        errors.add(:picture, "should be less than 3MB")
      end
    end

end
