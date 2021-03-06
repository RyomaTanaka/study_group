# study_group
勉強会やもくもく会を企画できるアプリケーションです。プログラミングスクールの同期と卒業してからも勉強会などで交流出来ればと思い作成しました。

![demo](https://gyazo.com/803dee1c9d808c4e4e72e8c0872ab9c3/raw)

![demo](https://gyazo.com/f20b5c5043003b2e1cb4bc013f5bbdd7/raw)

# テストユーザーログイン
- email: test@gmail.com
- password: password

※ログイン、アカウント作成画面からテストユーザーログインボタンで、emailとパスワードを入力しなくてもテストユーザーとしてログイン可能です。

# リンク
https://study-group62.work

# 注目して欲しいところ
- 環境開発にDockerを使用。
- circleciを使って自動テスト、デプロイを実行。
- インフラにAWSの各種サービスを使用。

# 使用技術

## 開発環境
- Docker
- CircleCI
- GitHub

## フロントエンド
- haml
- scss
- jquery
- bootstrap

## バックエンド
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6

## インフラ
- AWS
  - EC2
  - RDS for MySQL
  - S3
  - Route53
  - VPC


# クラウドアーキテクチャ
![study-group](https://user-images.githubusercontent.com/49609619/72677891-47379180-3ae4-11ea-9130-6ad3cb84a37a.png)


# 機能一覧
- ユーザー登録、ログイン機能全般(gem:devise)
- 簡単ログイン
- ユーザー間でのフォローフォロワー機能
- イベント作成機能(CRUD)
- 画像投稿機能(gem:carrierwave, aws/fog)
- 外部API(google_map_API)を叩いてコンテンツを表示
- タグ機能(gem:acts-as-taggable-on)
- イベント、ユーザー検索機能(gem:ransack)

# テスト
- RSpec
  - 単体テスト
  - コントローラーテスト
  - システムテスト(capybara)