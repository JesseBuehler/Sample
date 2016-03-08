require 'selenium-webdriver'
require 'rspec'

describe "Login" do

  before do
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "https://rubygems.org/sign_in"
  end

  after do
    @driver.quit
  end 

  it 'test with an email login' do
    element = @driver.find_element(:id => "session_who")
    puts element.inspect
    element.send_keys "jessebuehler27@gmail.com"
    element = @driver.find_element(:id => "session_password")
    element.send_keys "hellohello90"
    element = @driver.find_element(:class => "form__submit")
    element.click
    text = @driver.find_element(:class => 'page__heading').text
    expect(text).to eq('Dashboard')
  end

  it 'test with an account id' do
    element = @driver.find_element(:id => "session_who")
    puts element.inspect
    element.send_keys "JesseBuehler27"
    element = @driver.find_element(:id => "session_password")
    element.send_keys "hellohello90"
    element = @driver.find_element(:class => "form__submit")
    element.click
    text = @driver.find_element(:class => 'page__heading').text
    expect(text).to eq('Dashboard')
  end

  it "fails with wrong password" do
    element = @driver.find_element(:id => "session_who")
    puts element.inspect
    element.send_keys "JesseBuehler27"
    element = @driver.find_element(:id => "session_password")
    element.send_keys "banana"
    element = @driver.find_element(:class => "form__submit")
    element.click
    text = @driver.find_element(:class => "t-link--black").text
    expect(text).to eq('Sign in')
    text = @driver.find_element(:class => "l-wrap--b").text
    expect(text).to eq('Bad email or password.')
  end

it "fails with wrong user name" do
    element = @driver.find_element(:id => "session_who")
    puts element.inspect
    element.send_keys "banana"
    element = @driver.find_element(:id => "session_password")
    element.send_keys "hellohello90"
    element = @driver.find_element(:class => "form__submit")
    element.click
    text = @driver.find_element(:class => "t-link--black").text
    expect(text).to eq('Sign in')
    text = @driver.find_element(:class => "l-wrap--b").text
    expect(text).to eq('Bad email or password.')
  end

end