class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :addresses, :building, :phone_number, :user_id, :item_id,:token
   with_options presence: true do
   validates :city
   validates :addresses
   validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :phone_number, format: { with: /\A\d{10,11}\z/}
   validates :user_id
   validates :item_id
   validates :token
   end
  

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(order_id: order.id,post_code: post_code, area_id: area_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
  end
end