require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium

describe 'github test' do

  before do
    @outtime = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  it 'gitHubにログインしてBioを更新する' do
    # case1 - input
    visit 'https://github.com/login'
    fill_in 'login',    with: ENV['GITHUB_ID']
    fill_in 'password', with: ENV['GITHUB_PW']
    click_on 'Sign in'
    # case1 - output
    expect(page).to have_content 'Discover interesting projects and people to populate your personal news feed.'

    # case2 - input
    click_link '@reflex-circle'
    click_link 'Your profile'
    # case2 - output
    expect(page).to have_title ENV['GITHUB_ID']

    # case3 - input 
    visit 'https://github.com/settings/profile'
    # case3 - output
    expect(page).to have_title 'Your Profile'

    # case4 - input
    fill_in 'user_profile_bio', with: @outtime + ' by CircleCI'
    click_on 'Update profile'
    visit 'https://github.com/' + ENV['GITHUB_ID']
    # case4 - output
    expect(page).to have_title ENV['GITHUB_ID']

    # case5 - output
    expect(page).to have_content @outtime
  end
end
