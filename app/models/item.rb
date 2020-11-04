class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 }
  
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
end
