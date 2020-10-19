## 製品名
先生の図書館

## 製品概要
小学校教員の教材作り、指導案の参考、所見の参考となるwebアプリ。
日本の教員の労働時間は世界的に見てもかなり長い。学校現場で求められることが非常に多くなっており、残業が多い。その忙しさを解決するアプリ。
一人一人の教員が日頃作成したワークシートや、指導案を持ち寄り、全国の小学校教員の作成したものを共有することで、残業時間を減らすことを目的としている。

## コンセプト
ワークシート、指導案などを掲載しているサイトはあるが、検索しやすく、使いやすいものがないように感じた。朝の忙しい時間や休み時間でも素早くアクセスし、検索できることをコンセプトとして作りたい。

## バージョン情報
- Ruby 2.6.5
- Ruby on Rails 5.2.4
- PostgreSQL
- Nginx(Webサーバ)
- unicorn(アプリケーションサーバ)
- AWS(EC2,S3)
- RSpec(自動テスト)
- JavaScript
- HTML/CSS
- Bootstrap4

## 機能一覧
システムを構成する機能
1. csv,pdf,画像ファイルをアップロードする機能
2. 閲覧したファイルのお気に入り機能
3. 投稿内容ソート機能
4. アップロードしたファイルのタグづけ機能
5. ユーザ登録/ログイン機能
6. ゲストログイン機能
7. ユーザ情報閲覧機能
8. 管理者機能
9. プロフィール編集機能
10. 投稿ファイルフリーワード検索機能
11. 投稿ファイルタグ検索機能
12. アップロードしたPDF,CSVダウンロード機能
## カタログ設計,テーブル定義書,ER図,画面遷移図,ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1DaYEDnCQL7vPeiQ1hxnlrxwWCbHFa1e9tcc9jl2v0K0/edit#gid=0
## 使用Gem

- font-awesome-rails
- unicorn
- rails_admin
- kaminari
- carrierwave
- mini_magick
- fog-aws
- devise
- devise_i18n
- rspec-rails
- capybara
