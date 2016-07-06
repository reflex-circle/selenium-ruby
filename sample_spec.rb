require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
Capybara.app_host = 'https://twitter.com?lang=en'


describe "ログイン" do

  before do
    visit 'https://twitter.com?lang=en'
  end

  it "トップページが表示されること" do
    puts page.body
    expect(page).to have_content('Welcome to Twitter.')
  end
  it "ログイン画面が表示できること" do
    click_link "Log in"
    expect(current_path).to eq '/login/error?redirect_after_login=%2F%3Flang%3Den'
    puts CGI.pretty(page.body)
  end
=begin
  it "ログインできること" do
    click_link "Sign in"

    # テキストフィールドに入力し、ボタンをクリック(id, name, value属性などを指定できる)
    fill_in 'login_field', with: 'GitHubのユーザ名'
    fill_in 'password',    with: 'GitHubのパスワード'
    click_button "Sign in"

    expect(current_path).to eq '/'
  end
=end
end
