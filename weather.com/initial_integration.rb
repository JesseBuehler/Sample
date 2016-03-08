require 'selenium-webdriver'
require 'rspec'

describe "Homepage" do

  before do
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "http://weather.com"
  end

  after do
    @driver.quit
  end

  it 'loads the page' do
  	element = @driver.find_element(:id => "wx-twc-logo-img")
  end

end