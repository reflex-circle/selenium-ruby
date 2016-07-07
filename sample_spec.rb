require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara-webkit'
require 'pry'
require 'headless'

RSpec.configure do |config|
  config.include Capybara::DSL
end

headless = Headless.new
headless.start

Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  #config.allow_url('https://abs.twimg.com')
  #config.allow_url('https://twitter.com')
  config.allow_url('*')
end

describe "ログイン", js: true do

  before do
    visit 'https://twitter.com/login?lang=ja'
  end

=begin
  it "トップページが表示されること" do
    #puts CGI.pretty(page.body)
    expect(page).to have_title 'Twitterへようこそ - ログインまたは新規登録'
  end

  it "ログイン画面が表示できること" do
    #puts CGI.pretty(page.body)
    click_on "ログイン"
    expect(current_path).to eq '/login/error'
  end
=end

  it "ログインできること" do
    #puts CGI.pretty(page.body)
    fill_in 'session[username_or_email]', with: ENV['TWITTER_ID']
    fill_in 'session[password]',          with: ENV['TWITTER_PW']
    click_button 'ログイン'
    puts ENV['TWITTER_ID']
    puts current_path
    expect(current_path).to eq '/'
    
    #puts CGI.pretty(page.body)
    #find('#tweet-box-global').set('Time.now')
    #find('#global-new-tweet-button').click
    #find('#tweet-box-global').set('Time.now')
    #find('.js-tweet-btn').click
    #puts CGI.pretty(page.body)
    find('#tweet-box-home-timeline').set('Time.now')
    find('.js-tweet-btn').click
  end

end
