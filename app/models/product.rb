class Product < ApplicationRecord
  validates :name, presence:{message: "Ürün adı boş geçilemez"}
  validates :price, numericality: {greater_than_or_equal_to: 18}
  validates :stock, numericality: {greater_than_or_equal_to: 0}
end
