# SeleniumとCapybaraでE2Eテストをする

## テスト対象
twitter - https://twitter.com/

## テストケース
* ログイン
* ツイート

## 覚書
_________________________________________________________________________________________________________
###■Capybara
* 現在の表示しているHTMLを成形して出力

```
puts CGI.pretty(page.body)
```

* buttonやlinkをクリックしたいがvalueが設定されていない場合

     cssのidかcalssを探してクリック 「#」「.」を指定すると見つからないので注意

```
find("#id or .class").click
```
_________________________________________________________________________________________________________
###■CircleCI

* seleniumがインストールされておらず、自分でServerをRunさせる必要がある

```
circle.yml
aaa
```
_________________________________________________________________________________________________________
###■Rspec

* itは並列化して動くので、直列でテストしたい場合は、注意
* itごとにbeforeは動くので、beforeはテスト準備では使わないこと
_________________________________________________________________________________________________________
###■Rails

* bundleを並列実行して高速化

     1:30 -> 1:04 に短縮 [^注釈]:注釈テキスト注釈テキスト注釈テキスト

```
bundle install -j4
```
_________________________________________________________________________________________________________
