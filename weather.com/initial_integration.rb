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

  it 'displays valid menu items' do
  	elements = @driver.find_elements(:class => "header-menu__link")
  	expect(elements[0].text).to eq('FORECASTS')
  	expect(elements[1].text).to eq('MAPS')
  	expect(elements[2].text).to eq('VIDEO')
  	expect(elements[3].text).to eq('PHOTOS')
  	expect(elements[4].text).to eq('NEWS')
  	expect(elements[5].text).to eq('TV')
  	expect(elements[6].text).to eq('WINTER STORMS')
	end
	
	it 'tests city lookup with zipcode' do
		element = @driver.find_element(:class => "input--search")
		element.send_keys "08034"
		element.send_keys :enter

	end

	it 'displays proper city' do
		element = @driver.find_element(:class => "ng-binding")

	end

end
