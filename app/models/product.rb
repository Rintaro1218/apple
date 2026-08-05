class Product < ApplicationRecord
  # ステータスの選択肢と、それぞれの日本語表示ラベル
  STATUS_LABELS = {
    "in_stock"     => "在庫あり",
    "ordering"     => "発注中",
    "out_of_stock" => "欠品"
  }.freeze

  # ステータスはこの3択のみを許可する
  enum :status, { in_stock: "in_stock", ordering: "ordering", out_of_stock: "out_of_stock" }, default: :in_stock

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

  # ステータスの日本語表示ラベル
  def status_label
    STATUS_LABELS[status]
  end
end
