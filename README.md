# study_group
勉強会やもくもく会を企画できるアプリケーションです。プログラミングスクールの同期と卒業してからも勉強会などで交流出来ればと思い作成しました。

# テストユーザーログイン
- email: test@gmail.com
- password: password

※ログイン、アカウント作成画面からテストユーザーログインボタンで、emailとパスワードを入力しなくてもテストユーザーとしてログイン可能です。

# リンク
- https://study_group62.work

# 注目して欲しいところ
- 環境開発にDockerを使用。
- circleciを使って自動テスト、デプロイを実行。
- インフラにAWSの各種サービスを使用。

# 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6
- SASS
- AWS
  - EC2
  - RDS for MySQL
  - S3
  - Route53
  - VPC
- Docker
- CircleCI
- GitHub

# クラウドアーキテクチャ
![AWS Networking (updated)](https://user-images.githubusercontent.com/26785257/69001806-81d84e80-0928-11ea-8c63-1888db10a518.png)

# 機能一覧
- ユーザー登録、ログイン機能全般
- 簡単ログイン
- ユーザー間でのフォローフォロワー機能
- 記事投稿機能(CRUD)
- 画像投稿機能（carrierwave, aws/fog）
- 外部API(google_map_API)を叩いてコンテンツを表示
- タグ機能(gem:acts-as-taggable-on)

# テスト
- RSpec
  - 単体テスト
