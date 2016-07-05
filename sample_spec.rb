require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
Capybara.app_host = 'https://github.com/'


describe "GitHub" do

  before do
    visit '/'
  end

  it "トップページが表示されること" do
    expect(page).to have_content('How people build software')
  end

  it "ログイン画面が表示できること" do
    click_link "Sign in"
    expect(current_path).to eq '/login'
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
