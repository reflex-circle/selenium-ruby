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
    fill_in 'login',    with: ENV['GITHUB_ID']
    fill_in 'password', with: ENV['GITHUB_PW']
    click_on 'Sign in'
    click_lick '@reflex-circle'
    #visit 'https://github.com/settings/profile'
    fill_in 'user_profile_bio', with: Time.now.strftime("%Y-%m-%d %H:%M:%S") + ' by CircleCI'
    
    click_on 'Update profile'
  end

end
