class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token
  validates :price, presence: true
end