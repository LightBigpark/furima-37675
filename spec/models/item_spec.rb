require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品機能' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'items_nameが空では登録できない' do
      @item.items_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Items name can't be blank")
    end
    it 'explainが空では登録できない' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it 'category_idが値に---が入っていると登録できない' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが値に---が入っていると登録できない' do
      @item.condition_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'delivery_idが値に---が入っていると登録できない' do
      @item.delivery_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end
    it 'area_idが値に---が入っていると登録できない' do
      @item.area_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it 'shipping_date_idが値に---が入っていると登録できない' do
      @item.shipping_date_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが300円未満では保存できないこと' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが半角英数でないと登録できない' do
      @item = build(:item, price: "aiueo") 
      @item.valid?
      expect(@item.errors[:price]).to include("is invalid")
    end

  end
end
