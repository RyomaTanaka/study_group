# study_group
勉強会やもくもく会を企画できるアプリケーションです。プログラミングスクールの同期と卒業してからも勉強会などで交流出来ればと思い作成しました。

![demo](https://gyazo.com/2f2961aea25dce80dde2c494e019b622/raw)

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
![AWS Networking (updated)](https://user-images.githubusercontent.com/26785257/69001806-81d84e80-0928-11ea-8c63-1888db10a518.png)

# 機能一覧
- ユーザー登録、ログイン機能全般(devise)
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
