# README

## 環境構築

### rubyのinstall

```
$ rbenv install $(cat .ruby-version)
```

### bundler install

```
$ gem install bundler
```

### mecabの設定
```
$ brew install mecab
$ brew install mecab-ipadic
```

### 依存gemのinstall
初回

```
$ bundle install --path vendor/bundle --without production
```

2回目以降

```
$ bundle install
```

### db migration
```
$ rake db:migrate
```

### seedの投入
```
$ rake db:seed
```



## サーバの起動
```
$ bin/rails s
```
