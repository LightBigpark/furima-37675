class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :date
  belongs_to :delivery

  validates 
end
