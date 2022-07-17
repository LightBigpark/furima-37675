require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @items = FactoryBot.build(:item, user_id: user.id)
  end

  context '内容に問題がある場合' do
  describe '商品出品機能' do
    it 'imageが空では登録できない' do
      @items.image = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'items_nameが空では登録できない' do
      @items.items_name = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("Items name can't be blank")
    end
    it 'explainが空では登録できない' do
      @items.explain = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("Explain can't be blank")
    end
    it 'category_idが値に---が入っていると登録できない' do
      @items.category_id = '1'
      @items.valid?
      expect(@items.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが値に---が入っていると登録できない' do
      @items.condition_id = '1'
      @items.valid?
      expect(@items.errors.full_messages).to include("Condition can't be blank")
    end
    it 'delivery_idが値に---が入っていると登録できない' do
      @items.delivery_id = '1'
      @items.valid?
      expect(@items.errors.full_messages).to include("Delivery can't be blank")
    end
    it 'area_idが値に---が入っていると登録できない' do
      @items.area_id = '1'
      @items.valid?
      expect(@items.errors.full_messages).to include("Area can't be blank")
    end
    it 'shipping_date_idが値に---が入っていると登録できない' do
      @items.shipping_date_id = '1'
      @items.valid?
      expect(@items.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'priceが空では登録できない' do
      @items.price = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("Price is invalid")
    end
    it 'priceが300円未満では保存できないこと' do
      @items.price = 0
      @items.valid?
      expect(@items.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @items.price = 10000000
      @items.valid?
      expect(@items.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが半角英数でないと登録できない' do
      @items = build(:items, price: "aiueo") 
      @items.valid?
      expect(@items.errors[:price]).to include("is invalid")
    end
    it 'userが紐付いていないと保存できない' do
      @items.user = nil
      @items.valid?
      expect(@items.errors.full_messages).to include('User must exist')
    end
  end

    context '内容に問題ない場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@items).to be_valid
      end
    end

  end
end
