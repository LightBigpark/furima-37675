class Order < ApplicationRecord
  belongs_to :item
  has_one :useraddress
  include ActiveModel::Model
  attr_accessor :token
end