## 1. アプリ概要
剣道の上達を目指すためのアプリです。
http://18.178.123.245/

以下の３つの機能により「自分の改善点がわからない」という課題を解決します。<br>
**1. 比較**<br>自分の試合動画や稽古動画を投稿し、自分の技を上級者と比較する。<br>
**2. 改善点記録**<br>できている部分、足りない部分、次回の稽古で直すことを記録します。<br>
**3. アドバイス**<br>コメント機能により他者からアドバイスが得る。<br>
[![Image from Gyazo](https://i.gyazo.com/7fb8e728c2ff720056b4b4d11d201424.gif)](https://gyazo.com/7fb8e728c2ff720056b4b4d11d201424)

## 2. 機能
### 2.1 機能一覧
* ユーザー登録機能(devise)
  * 新規登録機能
  * ログイン機能
  * ユーザー詳細機能
  * ユーザー編集削除機能
* 動画投稿機能(active storage)
  * 動画と技名を投稿する機能
* 改善点記録機能
  * 自分の動画とお手本動画が並んで表示される機能
  * 技に応じたYoutubeの動画が数秒ループする機能(Iframe API)
  * 動画・記録の編集削除機能
* アドバイス機能
  * 他人の記録にコメントをしてアドバイスができる。
* クイズ機能
  * クイズ投稿機能
  * クイズ回答機能

### 2.2 ER図
[![Image from Gyazo](https://i.gyazo.com/df95d67074fe5a3da39ba2c4ff49b1fd.png)](https://gyazo.com/df95d67074fe5a3da39ba2c4ff49b1fd)

## 3. 使用技術
### 3.1 技術一覧
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

### 3.2 テスト
* RSpec
  * 単体テスト(6 models)
  * 結合テスト(3 systems)

### 3.3 インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/2f9385c53c574a75ba342e09df8505c0.png)](https://gyazo.com/2f9385c53c574a75ba342e09df8505c0)

### 4. デモ
### 4.1 動画比較
[![Image from Gyazo](https://i.gyazo.com/675fc381e3c52ebb25dac8c3f28ce0c9.gif)](https://gyazo.com/675fc381e3c52ebb25dac8c3f28ce0c9)

### 4.2 クイズ機能
[![Image from Gyazo](https://i.gyazo.com/af9eb2cac1e3924c2b55f50f65611f89.gif)](https://gyazo.com/af9eb2cac1e3924c2b55f50f65611f89)
