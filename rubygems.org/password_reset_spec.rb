require 'selenium-webdriver'
require 'rspec'

describe "Changing Password" do

  before do
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "https://rubygems.org/sign_in"
  end

  after do
    @driver.quit
  end 

  it 'test with an email login' do
    element = @driver.find_element(:css => ".sign_in_links > p > a")
    element.click
    text = @driver.find_element(:class => 't-link--black').text
    expect(text).to eq('Change your password')
    element = @driver.find_element(:id => "password_email")
    element.send_keys "JesseBuehler27@gmail.com"
    element = @driver.find_element(:class => "form__submit")
    element.click
  end

 

end