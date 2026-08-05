class Product < ApplicationRecord
  # 名前は必須項目（空のまま登録できないようにする）
  validates :name, presence: true
end
