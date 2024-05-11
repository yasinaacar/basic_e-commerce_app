class Category < ApplicationRecord
  validates :name, presence:{message: "Kategori adı boş geçilemez"}
end
