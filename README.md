# SeleniumとCapybaraでE2Eテストをする

## テスト対象
twitter - https://twitter.com/

## テストケース
* ログイン
* ツイート

## 覚書

###Capybara
現在の表示しているHTMLを成形して出力

`puts CGI.pretty(page.body)`
