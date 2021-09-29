class CartItem < ApplicationRecord


  belongs_to :customer
  belongs_to :item

  validates :quantity, numericality: { only_integer: true }


end