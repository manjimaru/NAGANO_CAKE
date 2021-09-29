class Item < ApplicationRecord


  validates :genre_id, :name, :price, presence: true
  validates :introduction, length: {maximum: 200}
  validates :price, numericality: { only_integer: true }

  attachment :image
  belongs_to :genre

  has_many :item_orders, dependent: :destroy

  has_many :cart_items, dependent: :destroy

end