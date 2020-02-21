# README

## 設定
- Install gem
```
$ bundle install --path=vendor/bundle
```

- Create database
```
$ bundle exec rails db:migrate
```

- Seed data
```
$ bundle exec rails db:seed
```

## サーバー起動
```
$ bundle exec rails s
```
アクセス: http://localhost:3000/graphiql

## テスト
Example:
```
query {
  comments {
    id
    user {
      id
      name
    }
  }
}
```

## 参考URL
- graphql-ruby
https://github.com/rmosolgo/graphql-ruby

- graphql-rails
https://github.com/rmosolgo/graphiql-rails

- guides
https://graphql-ruby.org/guides
