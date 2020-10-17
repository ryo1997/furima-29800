require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいく時' do
      it '全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'imageが空ならNG' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空ならNG' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空ならNG' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'genre_idが空ならNG' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank", "Genre is not a number")
      end
      
      it 'condition_idが空ならNG' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end
      
      it 'shipping_charge_idが空ならNG' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank", "Shipping charge is not a number")
      end

      it 'prefecture_idが空ならNG' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      
      it 'preparation_day_idが空ならNG' do
        @item.preparation_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank", "Preparation day is not a number")
      end
      
      it 'priceが空ならNG' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字のみならNG' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300円以下ならNG' do
        @item.price = '280'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999円以上ならNG' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
