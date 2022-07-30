class UserAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :addresses, :building, :phone_number, :price, :user_id
  with_options presence: true
  validates :post_code format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id
  validates :addresses
  validates :building
  validates :phone_number format: { with: ^0\d{10,11}$}
  validates :price,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :user_id
end
 def save
  order = Order.create(price: price, user_id: user_id)

  Address.create(post_code: post_code, area_id: area_id, addresses: addresses, building: building, phone_number: phone_number)
end
