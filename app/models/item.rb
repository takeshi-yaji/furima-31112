class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :content
  validates :category_id
  validates :status_id
  validates :charges_id
  validates :prefecture_id
  validates :price
  validates :day_id
  end
end
