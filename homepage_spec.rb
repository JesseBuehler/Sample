require 'selenium-webdriver'
require 'rspec'

describe "Homepage" do

  before do
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "http://rubygems.org"
  end

  after do
    @driver.quit
  end 

  it 'works with valid terms' do
    element = @driver.find_element(:id => "home_query")
    element.send_keys "dev_panel"
    element.submit
    text = @driver.find_element(:class => 't-link--black').text
    expect(text).to eq('dev_panel')
  end

  it 'works with invalid terms' do
    element = @driver.find_element(:id => "home_query")
    element.send_keys "dev_panel1234"
    element.submit
     text = @driver.find_element(:class => 'gems__meter').text
     expect(text).to eq('NO GEMS FOUND')
  end 


	it 'sample' do 
    expect(1).to eq(1)
  end
end