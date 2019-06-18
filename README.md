# アプリ名：cafe-de-shibuya

## https://cafe-de-shibuya.herokuapp.com/
※ご覧頂く際、アカウント登録は必要ございません。

## ご利用イメージ
![ダウンロード](https://user-images.githubusercontent.com/11900792/59652005-fb77df00-91c6-11e9-8f40-b200e34b266a.gif)

## 概要
- 主要なカフェチェーンのおすすめ・かわいい商品を紹介。
- 渋谷周辺の店舗情報を地図で表示。

## コンセプト
- 渋谷でカフェを探すときの煩わしさを解消したい。
- 各店舗の一押し商品をいち早く知りたい。  

このようなニーズをアプリで解決することを目的に作成。

## 技術的なアプローチ
- スクレイピングによる商品情報の取得
    - gem "nokogiri"を使用
- Ruby on RailsをWeb API化
    - スクレイピングした情報をJSON形式で出力
- Vue.jsを導入
    - Ruby on RailsにWebpackerを使用し、Vue.jsを導入。
- Service層を導入
    - スクレイピング処理を担当するコードをモジュール化し、再利用を容易にした。
    ※ Fat controllerとなっているが、可読性を重視し、この構成をとった。

## その他使用した技術
### フロントエンド
- Vue.js
  - Vue Router
  - axios
  - Bootstrap

### サーバーサイド
- Ruby on Rails 5.2.3(Ruby 2.6.3)
- Heroku  


