require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium

describe "gitHubにログインしてBioを更新する" do

  before do
    visit 'https://github.com/login'
  end

  it "ログインできること" do
    #puts CGI.pretty(page.body)
    fill_in 'login',    with: ENV['GITHUB_ID']
    fill_in 'password', with: ENV['GITHUB_PW']
    click_on 'Sign in'

    first('#global-new-tweet-button').click
    first('#tweet-box-global').set('Time.now')
    first('.js-tweet-btn').click
    #puts CGI.pretty(page.body)
    #find('#tweet-box-home-timeline').click
    #find('#tweet-box-home-timeline').set('Time.now')
    #find('.js-tweet-btn').click
  end

end
