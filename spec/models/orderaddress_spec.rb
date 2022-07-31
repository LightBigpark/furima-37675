require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @orderaddress = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @orderaddress.post_code = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @orderaddress.post_code = '1234567'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること' do
        @orderaddress.area_id = '1'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が必須であること' do
        @orderaddress.city = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @orderaddress.addresses = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が必須であること' do
        @orderaddress.phone_number = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @orderaddress.phone_number = '090123456789'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is invalid")
      end
    end

    context '内容に問題ない場合' do
      it '建物名は任意であること' do
        @orderaddress.building = ''
        expect(@orderaddress).to be_valid
      end
    end
  end
end
