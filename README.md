## Top view
剣道の上達を目指すためのアプリです。

なぜ有効打突にならないのかわからないという課題を解決します。３人の審判のうち2人以上が旗をあげると有効打突と認められます。

自分の試合動画や稽古動画を投稿し、自分の技を上級者と比較して改善点を記録します。公開非公開を選べ、公開するとコメント機能があるのでアドバイスが得られる仕様になっております。
  
[![Image from Gyazo](https://i.gyazo.com/3911f7f51fe14fced51f21da8eaf8ff9.gif)](https://gyazo.com/3911f7f51fe14fced51f21da8eaf8ff9)
## 本番環境 URL
http://18.178.123.245/
ログインしなくても比較記録やクイズをみることは可能です。
コメントや投稿するためにゲストログインお使いください。

## 開発環境
- フロントエンド
・HTML
・CSS
・JavaScript
- バックエンド
Ruby/Ruby on Rails/Javascript/MariaDB/nginx/Unicorn/Github/AWS/Visual Studio Code

## インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/9247e36c11a35669334ce6b2da2f8166.png)](https://gyazo.com/9247e36c11a35669334ce6b2da2f8166)

## ER図
[![Image from Gyazo](https://i.gyazo.com/df1b4a1984b5781a46c561ceabdbd2a8.png)](https://gyazo.com/df1b4a1984b5781a46c561ceabdbd2a8)

## 機能
ユーザー登録機能(devise)
  ・新規登録機能
  ・ログイン機能
  ・ユーザー詳細機能 
  ・ユーザー編集削除機能 

動画比較機能
  ・動画投稿機能(active storage)  
  ・技に応じたyoutubeが数秒ループする機能(Iframe API)
  ・記録投稿機能  
  ・コメント機能  
  ・動画・記録編集削除機能
  ・記録詳細機能

クイズ機能
  ・クイズ投稿機能
  ・クイズ回答機能


## テスト
RSpec  
単体テスト(6model)  
結合テスト(3system)