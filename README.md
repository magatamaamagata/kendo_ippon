## Top view
剣道の上達を目指すためのアプリです。

なぜ有効打突にならないのかわからないという課題を解決します。(3人の審判のうち2人以上が旗をあげると有効打突と認められます。)

自分の試合動画や稽古動画を投稿し、自分の技を上級者と比較して改善点を記録します。

公開非公開を選べ、公開するとコメント機能があるのでアドバイスが得られる仕様になっております。
  
[![Image from Gyazo](https://i.gyazo.com/7fb8e728c2ff720056b4b4d11d201424.gif)](https://gyazo.com/7fb8e728c2ff720056b4b4d11d201424)

## 本番環境 URL
http://18.178.123.245/

ログインしなくても比較記録やクイズをみることは可能です。

コメントや投稿するためにゲストログインお使いください。

## 開発環境

* フロントエンド
  * HTML
  * CSS
  * JavaScript

* バックエンド
  * Ruby
  * Ruby on Rails
  * Javascript

* インフラ
  * MariaDB
  * Nginx
  * Unicorn
  * Github
  * AWS(S3,EC2)
  * Visual Studio Code

## インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/2f9385c53c574a75ba342e09df8505c0.png)](https://gyazo.com/2f9385c53c574a75ba342e09df8505c0)

## ER図
[![Image from Gyazo](https://i.gyazo.com/df95d67074fe5a3da39ba2c4ff49b1fd.png)](https://gyazo.com/df95d67074fe5a3da39ba2c4ff49b1fd)

## 機能
* ユーザー登録機能(devise)
  * 新規登録機能
  * ログイン機能
  * ユーザー詳細機能
  * ユーザー編集削除機能

* 動画比較機能
  * 動画投稿機能(active storage)
  * 技に応じたYoutubeの動画が数秒ループする機能(Iframe API)
  * 記録投稿機能
  * コメント機能
  * 動画・記録の編集削除機能
  * 記録詳細機能

* クイズ機能
  * クイズ投稿機能
  * クイズ回答機能

## テスト
* RSpec
  * 単体テスト(6model)
  * 結合テスト(3system)

## アプリの様子

### 動画比較
[![Image from Gyazo](https://i.gyazo.com/675fc381e3c52ebb25dac8c3f28ce0c9.gif)](https://gyazo.com/675fc381e3c52ebb25dac8c3f28ce0c9)



<!-- ### 記録詳細
[![Image from Gyazo](https://i.gyazo.com/246398a70aa5fe5ac36e704b495dc2a7.gif)](https://gyazo.com/246398a70aa5fe5ac36e704b495dc2a7)

 -->

### クイズ機能
[![Image from Gyazo](https://i.gyazo.com/af9eb2cac1e3924c2b55f50f65611f89.gif)](https://gyazo.com/af9eb2cac1e3924c2b55f50f65611f89)
