class Repair < ApplicationRecord
  belongs_to :car
  default_scope -> { order(repair_date: :desc) }
  mount_uploader :file, FileUploader
  validates :repair_date, :title, :description, :billings_amount, :garage, :presence=>true
end
