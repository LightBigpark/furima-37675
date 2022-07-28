class Order < ApplicationRecord
  include ActiveModel::Model
  validates :price, presence: true
end