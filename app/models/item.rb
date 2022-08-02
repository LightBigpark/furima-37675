class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one :order

    has_one_attached :image
    belongs_to :area
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_date
    belongs_to :delivery
    
    with_options presence: true do
      validates :image
      validates :items_name
      validates :explain
    end
    
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :area_id
    validates :shipping_date_id
    end
    
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end

