# rails_test


## 前提

Mac の以下の環境で動作を確認しています。
Windows では確認をしておりません。

* ruby 2.1.0p0
* SQLite version 3.7.13

また ER 図を pdf 出力するため Graphviz が必要です
Mac(homebrew)の場合

```
$ brew install gts
$ brew install graphviz
```


## 環境構築

databalse.yml, email.yml コミットしていません。
環境に応じで変更をお願いします。

```
$ bundle install
$ cp config/database.yml.example config/database.yml
$ cp config/email.yml.example config/email.yml

$ rake db:migrate
$ rake db:seed
```


## 確認方法

サーバ起動

```
$ rails s
```

http://localhost:3000
にてご確認いただけます。


## テスト実行方法

```
$ rake db:migrate RAILS_ENV=test
$ rake spec
```

今回、テストはモデル層のみ記載しています。
spec/models 以下を参照ください。


## ER図

erd.pdf を参照ください

テストでは学年の概念はありませんでしたが、DBの正規化目的で学年モデルを追加しております。