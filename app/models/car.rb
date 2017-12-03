class Car < ApplicationRecord
  belongs_to :user
  has_many :refuellings, dependent: :destroy
  has_many :repairs, dependent: :destroy
  has_many :rentals, dependent: :destroy
  accepts_nested_attributes_for :refuellings
  default_scope -> { order(car_name: :asc) }
  mount_uploader :picture, PictureUploader
  validates :car_name, :car_model, :car_brand, :numberplate, :presence=>true
  validates :car_name, length: { maximum: 30 }
  validates :car_model, length: { maximum: 50 }
  validates :milage_purchase_date, numericality: { only_integer: true }
  VALID_CURRENCY_REGEX = /\A\d+\.?\d{0,2}\z/
  validates :tax,:comprehensive_full, :comprehensive_part, :liability, :purchase_price, 
    format: { with: VALID_CURRENCY_REGEX, 
      :message => "Zahl muss wie folgt aussehen: 123.54 (kein Komma oder andere Zeichen)"  },
      :allow_blank => true
  before_save :default_values
#\A\d+.{1}\d{2}\z
  #validates :milage_purchase_date, presence: true
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 3.megabytes
        errors.add(:picture, "should be less than 3MB")
      end
    end

    def default_values
      self.tax ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
      self.comprehensive_full ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
      self.comprehensive_part ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
      self.liability ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
      self.purchase_price ||= 0.00 # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
    end


end
