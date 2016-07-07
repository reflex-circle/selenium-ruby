require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium

describe "ログイン", js: true do

  before do
    visit 'https://twitter.com/?lang=ja'
  end

  it "トップページが表示されること" do
    #puts CGI.pretty(page.body)
    expect(page).to have_title 'Twitterへようこそ - ログインまたは新規登録'
  end

  it "ログイン画面が表示できること" do
    #puts CGI.pretty(page.body)
    click_on "ログイン"
    expect(current_path).to eq '/login/error'
  end

  it "ログインできること" do
    #puts CGI.pretty(page.body)
    fill_in 'session[username_or_email]', with: ENV['TWITTER_ID']
    fill_in 'session[password]',          with: ENV['TWITTER_PW']
    click_on "ログイン"
    expect(current_path).to eq '/'
    
    #puts CGI.pretty(page.body)
    #find('#tweet-box-global').set('Time.now')
    find('global-new-tweet-button').click
    find('#tweet-box-global').set('Time.now')
    find('.js-tweet-btn').click
    #puts CGI.pretty(page.body)
    #find('#tweet-box-home-timeline').set('Time.now')
    #find('.js-tweet-btn').click
  end
=begin
  it "ツイートできること" do
    puts CGI.pretty(page.body)
    find('global-new-tweet-button').click
    expect(current_path).to eq '/'
  end
=end
end
