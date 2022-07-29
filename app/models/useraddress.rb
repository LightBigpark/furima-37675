class Useraddress < ApplicationRecord
  belongs_to :order
  with_options presence: true
  validates :post_code
  validates :area_id
  validates :city
  validates :addresses
  validates :building
  validates :phone_number
end
end
