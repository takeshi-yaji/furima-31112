require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  describe '購入者情報の保存' do
    before do
      @buyer_form = FactoryBot.build(:buyer_form)
    end

    it "全てあれば保存ができること" do
      expect(@buyer_form).to be_valid
    end

    it "tokenが空では保存ができないこと" do
      @buyer_form.token = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Token can't be blank")
    end

    it "postが空では保存ができないこと" do
      @buyer_form.post = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Post can't be blank", "Post is invalid")
    end

    it "prefecture_idが空では保存ができないこと" do
      @buyer_form.prefecture_id = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it "municipalityが空では保存ができないこと" do
      @buyer_form.municipality = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では保存ができないこと" do
      @buyer_form.address = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Address can't be blank")
    end

    it "phoneが空では保存ができないこと" do
      @buyer_form.phone = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
    end

    it "postの記述が間違えていると保存ができないこと" do
      @buyer_form.post = '0000000'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Post is invalid")
    end

    it "phoneの記述が間違えていると保存ができないこと" do
      @buyer_form.phone = '090-1234-5678'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Phone is invalid")
    end

    it "prefecture_idが間違えていると保存ができないこと" do
      @buyer_form.prefecture_id = 1
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Prefecture must be other than 1")
    end

  end
end
