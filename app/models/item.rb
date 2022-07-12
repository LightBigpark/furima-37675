class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :date
  belongs_to :delivery

  with_options presence: true
    validates :image
    validates :items_name
    validates :explain
  end
  with_options numericality: { other_than: 1 message: "can't be blank"}
  validates :category_id
  validates :condition_id
  validates :delivery_id
  validates :area_id
  validates :date_id
  end

  validates :price,      presence: true, numericality: { in: 300..9999999 }, format: { with: /^[0-90-9]+$/}
end
