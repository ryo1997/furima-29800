require 'rails_helper'

RSpec.describe BuyerManagement, type: :model do
  describe '商品購入機能実装' do
    before do
      @buyer_management = FactoryBot.build(:buyer_management)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_management).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @buyer_management.token = nil
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @buyer_management.postal_code = nil
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end

      it 'postal_codeにハイフンが無いと保存できないこと' do
        @buyer_management.postal_code = '1234567'
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが空だと保存できないこと' do
        @buyer_management.prefecture_id = ''
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it 'prefecture_idが1だと保存できないこと' do
        @buyer_management.prefecture_id = 1
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空だと保存できないこと' do
        @buyer_management.city = nil
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @buyer_management.house_number = nil
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @buyer_management.phone_number = nil
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと保存できないこと' do
        @buyer_management.phone_number = '000000000000'
        @buyer_management.valid?
        expect(@buyer_management.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
