class Useraddress < ApplicationRecord
  belongs_to :order
  with_options presence: true
  validates :post_code format:  { with: ^\d{3}-\d{4}$}
  validates :area_id
  validates :addresses
  validates :building
  validates :phone_number format: { with: ^0\d{10,11}$}
end
end
