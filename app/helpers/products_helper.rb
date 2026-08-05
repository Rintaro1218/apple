module ProductsHelper
  STATUS_BADGE_CLASSES = {
    "in_stock"     => "bg-emerald-50 text-emerald-700",
    "ordering"     => "bg-amber-50 text-amber-700",
    "out_of_stock" => "bg-red-50 text-red-700"
  }.freeze

  # ステータスに応じたバッジの色クラスを返す
  def status_badge_classes(status)
    STATUS_BADGE_CLASSES.fetch(status, "bg-gray-100 text-gray-600")
  end
end
