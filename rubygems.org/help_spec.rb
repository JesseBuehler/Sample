require 'selenium-webdriver'
require 'rspec'

describe "Help Page" do

  before do
	@driver = Selenium::WebDriver.for :firefox
	@driver.get "https://rubygems.org"
  end

  after do
   @driver.quit
  end 

  it 'test help page' do
  	element = @driver.find_element(:class => "nav--v__link")
  	puts element.inspect
  end	

end