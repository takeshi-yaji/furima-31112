class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      pay_item
      @buyer_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.permit(:post, :prefecture_id, :municipality, :address, :building, :phone, :token, :item_id).merge(user_id: current_user.id) # item_idをいれる記述が必要
  end

  def pay_item
    # binding.pry
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: buyer_params[:token], # カードトークン
      currency: 'jpy'          # 通貨の種類(日本円)
    )
  end
end
