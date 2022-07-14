class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    has_many :area
    has_many :category
    has_many :condition
    has_many :shipping_date
    has_many :delivery
    
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

