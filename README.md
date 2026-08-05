# 在庫管理アプリ（バイブコーディング学習用ベースアプリ）

このリポジトリは、非エンジニア向け「バイブコーディング入門」カリキュラムで使う**学習用のベースアプリ**です。
商品を **登録・一覧・編集・削除（CRUD）** できる、シンプルな在庫管理アプリになっています。

受講者はこのリポジトリの **「Use this template」から自分のリポジトリを作り**、それをクローンして、カリキュラムに沿って
Claude Code への指示（バイブコーディング）で「検索機能」「項目の追加」「表示切り替えタブ」などを足していきます。

## 使用技術

- Ruby on Rails 8
- PostgreSQL
- Tailwind CSS（tailwindcss-rails）
- Docker / Docker Compose（ローカル開発）
- Fly.io（デプロイ先）

## 動かし方（ローカル）

事前に **Docker Desktop を起動**しておいてください。

```bash
# 1. このリポジトリの「Use this template」→「Create a new repository」で自分のリポジトリを作る

# 2. 作った自分のリポジトリをクローンする
git clone https://github.com/<あなたのユーザー名>/vibe-coding-inventory-app.git
cd vibe-coding-inventory-app

# 3. アプリとデータベースを起動する（初回はビルドに数分かかります）
docker compose up
```

起動したら、ブラウザで以下を開きます。

```
http://localhost:3000
```

在庫一覧の画面が表示され、サンプルの商品データがいくつか登録されていれば成功です。

アプリを止めるときは、`docker compose up` を実行したターミナルで `Ctrl + C` を押します。

## 補足

- データベース（PostgreSQL）も Docker コンテナとして一緒に立ち上がるため、別途インストールする必要はありません。
- 起動時に、データベースの作成・マイグレーション・サンプルデータ投入（`db:prepare`）と Tailwind CSS のビルドが自動で実行されます。
- 商品が持っている情報は「名前」「数量」「カテゴリ」の3つです。

## デプロイ時の秘密鍵について

このリポジトリには、秘密情報である `config/master.key` と `config/credentials.yml.enc` は含まれていません（学習用テンプレートのため、あえて配布対象から外しています）。クローンした手元に master.key が無くても問題ありません。

- **ローカル開発**：master.key 無しでそのまま動きます（Rails が開発用の秘密鍵を自動生成します）。
- **Fly.io へのデプロイ**：本番用の秘密鍵 `SECRET_KEY_BASE` を新しく生成し、Fly.io のシークレットに設定します。

```bash
# 本番用の秘密鍵を生成（ランダムな文字列が出力される）
bin/rails secret

# 出力された文字列を Fly.io のシークレットに登録
fly secrets set SECRET_KEY_BASE=（生成した文字列）
```
