class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :useraddress
  attr_accessor :token
  validates :token, presence: true
end