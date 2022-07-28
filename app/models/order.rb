class Order < ApplicationRecord
  belongs_to :item
  include ActiveModel::Model
  attr_accessor :token
  validates :price, presence: true
end