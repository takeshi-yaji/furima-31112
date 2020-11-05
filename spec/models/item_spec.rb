require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品登録' do
      context '商品登録がうまくいくとき' do
        it '全て入力した時登録できる' do
          expect(@item).to be_valid
        end
      end
  
      context '商品登録がうまくいかないとき' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'contentが空では登録できない' do
          @item.content = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it 'category_idが空では登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end
        it 'status_idが空では登録できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
        end
        it 'charges_idが空では登録できない' do
          @item.charges_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Charges can't be blank", "Charges is not a number")
        end
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
        end
        it 'priceが空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
        end
        it 'day_idが空では登録できない' do
          @item.day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
        end
        it 'priceが299以下では登録できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが10000000以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
        it 'category_idが1では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'status_idが1では登録できない' do
          @item.status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it 'charges_idが1では登録できない' do
          @item.charges_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Charges must be other than 1")
        end
        it 'prefecture_idが1では登録できない' do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'day_idが1では登録できない' do
          @item.day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Day must be other than 1")
        end
        it 'priceが半角数字出ないと登録できない' do
          @item.price = '１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
