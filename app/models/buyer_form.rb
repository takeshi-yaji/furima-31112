class BuyerForm 
  include ActiveModel::Model
  attr_accessor :token, :post, :prefecture_id, :municipality, :address, :building, :phone, :user_id, :item_id
  with_options presence: true do
    validates :token
    validates :post,          format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone,         format: {with: /\A\d{10,11}\z/}
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post: post, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone ,buyer_id: buyer.id )
  end
end