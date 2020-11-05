class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :day
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
  validates :image
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :charges_id
  validates :prefecture_id
  validates :day_id
  end
  
  validates  :price, numericality: { only_integer: true,
    greater_than_or_equal_to: 300, less_than: 10000000}
  validates :price, format: { with: /\A[0-9]+\z/ }
end
