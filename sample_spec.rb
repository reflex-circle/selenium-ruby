require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium

describe "ログイン" do

  before do
    visit 'https://twitter.com/?lang=ja'
  end

  it "トップページが表示されること" do
    expect(page).to have_title 'Twitterへようこそ - ログインまたは新規登録'
  end

  it "ログイン画面が表示できること" do
    #puts CGI.pretty(page.body)
    click_on "ログイン"
    expect(current_path).to eq '/login/error'
  end

  it "ログインできること" do
    fill_in 'session[username_or_email]', with: ENV['TWITTER_ID']
    fill_in 'session[password]',          with: ENV['TWITTER_PW']
    click_on "ログイン"

    expect(current_path).to eq '/'
  end

  it "ツイートできること" do
    fill_in 'tweet', with: Time.now
    click_on "ツイート"

    expect(current_path).to eq '/'
  end

end
