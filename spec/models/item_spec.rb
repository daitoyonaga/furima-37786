require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'condition_idが「---」以外であれば登録できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_charge_idが「---」以外であれば登録できる' do
        @item.delivery_charge_id = 2
        expect(@item).to be_valid
      end
      it 'prefecture_idが「---」以外であれば登録できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_day_idが「---」以外であれば登録できる' do
        @item.delivery_day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        item = Item.new(title: "")
        item.valid?
        expect(item.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では登録できない' do
        item = Item.new(content: "")
        item.valid?
        expect(item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが未選択では登録できない' do
        item = Item.new(category_id: "")
        item.valid?
        expect(item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが未選択では登録できない' do
        item = Item.new(condition_id: "")
        item.valid?
        expect(item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_charge_idが未選択では登録できない' do
        item = Item.new(delivery_charge_id: "")
        item.valid?
        expect(item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが未選択では登録できない' do
        item = Item.new(prefecture_id: "")
        item.valid?
        expect(item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが未選択では登録できない' do
        item = Item.new(delivery_day_id: "")
        item.valid?
        expect(item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空では登録できない' do
        item = Item.new(price: "")
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは、¥300~¥9,999,999の間のみ保存可能であること' do
        item = Item.new(price: 100)
        item.valid?
        expect(item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが全角数字では登録できない' do
        item = Item.new(price: "１０００")
        item.valid?
        expect(item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
