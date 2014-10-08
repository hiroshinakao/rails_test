source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  # テスト毎にデータをクリアする
  gem 'database_rewinder'

  # ダミーデータの作成
  gem 'faker'
end

group :development do
  # rails console を pry にします
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'

  # rails のエラー画面を見やすくする
  gem 'better_errors'
  gem 'binding_of_caller'

  # ActiveRecord のデータをテーブル形式で表示
  gem 'hirb'
  gem 'hirb-unicode'

  # DBの定義情報を読み取り、ModelのクラスファイルにコメントでDBの情報を書き込む
  # モデル生成後、以下のコマンドを実行
  # $ bundle exec annotate
  gem 'annotate', github: 'ctran/annotate_models'

  # Modelからer図を自動生成します
  # Graphvizが必須です
  # Macの場合
  # $ brew install gts
  # $ brew install graphviz
  # ER図の出力は以下のコマンドを実行すると、 erd.pdf が出力されます
  # $ rake erd
  gem 'rails-erd'
end

# haml を使います
gem 'haml-rails'
gem 'html2haml' # ERB -> Haml の変換に使用

# 認証には devise を使います
gem 'devise'
