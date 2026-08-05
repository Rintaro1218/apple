# 動作確認用のサンプル在庫データです。
# `bin/rails db:seed`（または docker compose 起動時の db:prepare）で投入されます。
# 何度実行しても重複しないよう、商品名をキーに find_or_create_by! を使っています。

sample_products = [
  { name: "ボールペン（黒）",          quantity: 120, category: "文房具", status: "in_stock" },
  { name: "コピー用紙 A4",            quantity: 45,  category: "文房具", status: "in_stock" },
  { name: "ふせん 75mm角",            quantity: 30,  category: "文房具", status: "ordering" },
  { name: "ミネラルウォーター 500ml", quantity: 200, category: "飲料",   status: "in_stock" },
  { name: "緑茶 500ml",               quantity: 80,  category: "飲料",   status: "in_stock" },
  { name: "ドリップコーヒー",          quantity: 60,  category: "飲料",   status: "ordering" },
  { name: "ウェットティッシュ",        quantity: 25,  category: "日用品", status: "in_stock" },
  { name: "ゴミ袋 45L",               quantity: 50,  category: "日用品", status: "in_stock" },
  { name: "乾電池 単3形",             quantity: 0,   category: "電池",   status: "out_of_stock" },
  { name: "乾電池 単4形",             quantity: 15,  category: "電池",   status: "in_stock" },
]

sample_products.each do |attrs|
  Product.find_or_create_by!(name: attrs[:name]) do |product|
    product.quantity = attrs[:quantity]
    product.category = attrs[:category]
    product.status = attrs[:status]
  end
end

puts "サンプル在庫データを #{Product.count} 件用意しました。"
