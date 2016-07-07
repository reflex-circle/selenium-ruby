# SeleniumとCapybaraでE2Eテストをする

## テスト対象

github - https://github.com

## CI(Sass)環境
CircleCI  - https://circleci.com/signup/  
LoginID - reflex-circle

## 環境

* gem "selenium-webdriver"
* gem "capybara"
* gem "rspec"
* gem "pry-byebug"
* gem "capybara-webkit"
* gem "headless"

## テストケース

#### 1. ログイン画面 -> ホーム画面
　![case1](https://raw.githubusercontent.com/wiki/reflex-circle/selenium-ruby/github_login.png)

#### 2. ホーム画面 -> プロフィール画面
　![case2](https://raw.githubusercontent.com/wiki/reflex-circle/selenium-ruby/github_home.png)
　
#### 3. プロフィール画面 -> 編集画面
　![case3](https://raw.githubusercontent.com/wiki/reflex-circle/selenium-ruby/github_profile.png)

#### 4. 編集画面 -> プロフィール画面
　![case4](https://raw.githubusercontent.com/wiki/reflex-circle/selenium-ruby/github_edit.png)

#### 5. Bioの値がビルドを実行した時間に更新されているか確認　

#テストが通ったか

<img src="https://circleci.com/gh/reflex-circle/selenium-ruby.svg?style=shield&circle-token=fbadcabe515d1f7d0d54175159cfe12ebb5a01ab">

#覚書
_________________________________________________________________________________________________________
###■Capybara

* 現在の表示しているHTMLを成形して出力

```
puts CGI.pretty(page.body)
```

* buttonやlinkをクリックしたいがvalueが設定されていない場合

```
find("#id or .class").click #cssのidかclassを探してクリック 「#」「.」を指定しないと見つからないので注意
```

* 入力対象がInput、textareaではなくて、fill_inが使用できない場合

```
find('#id').set('Text') 
```

* CapybaraにJavaSripctの動作を待たせる

```
describe "ログイン", js: true do
```
_________________________________________________________________________________________________________
###■CircleCI

* seleniumがインストールされておらず、自分でServerをRunさせる必要がある

```
dependencies:
  override:
   - wget http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar
   - java -jar selenium-server-standalone-2.53.0.jar:
       background: true #バックグラウンドで実行しないと後続処理が動かない
```
_________________________________________________________________________________________________________
###■Rspec

* itは並列化して動くので、直列でテストしたい場合は、注意
* itごとにbeforeは動くので、beforeはテスト準備では使わないこと

_________________________________________________________________________________________________________
###■Rails

* bundleを並列実行して高速化(1:30 -> 1:04 に短縮)

```
bundle install -j4
```
_________________________________________________________________________________________________________
