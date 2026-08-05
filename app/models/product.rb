class Product < ApplicationRecord
  # 名前は必須項目（空のまま登録できないようにする）
  validates :name, presence: true

  # 商品名の部分一致検索（大文字小文字を区別しない）
  scope :search_by_name, ->(keyword) {
    keyword.present? ? where("name ILIKE ?", "%#{sanitize_sql_like(keyword)}%") : all
  }

  # カテゴリの完全一致による絞り込み
  scope :filter_by_category, ->(category) {
    category.present? ? where(category: category) : all
  }
end
