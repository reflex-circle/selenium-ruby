require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium

describe "gitHubにログインしてBioを更新する" do

  before do
    visit 'https://github.com/'
  end

  it "ログインできること" do
    #puts CGI.pretty(page.body)
    fill_in 'session[username_or_email]', with: ENV['TWITTER_ID']
    fill_in 'session[password]',          with: ENV['TWITTER_PW']
    puts CGI.pretty(page.body)
    #find('.primary-btn').click
    click_on 'Log in'
    puts ENV['TWITTER_PW']
    puts current_path
    #expect(current_path).to eq '/'
    
    #puts CGI.pretty(page.body)
    first('#global-new-tweet-button').click
    first('#tweet-box-global').set('Time.now')
    first('.js-tweet-btn').click
    #puts CGI.pretty(page.body)
    #find('#tweet-box-home-timeline').click
    #find('#tweet-box-home-timeline').set('Time.now')
    #find('.js-tweet-btn').click
  end

end
