require 'selenium-webdriver'

describe "Test registration & login" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
  end

  before(:each) do 
    @driver.navigate.to("http://52.10.113.111:3000")
  end

  after(:all) do 
    @driver.quit
  end

  it "Register a user" do
    @driver.find_element(:xpath, "//a[@href='/login']").click
    sleep 1
    @driver.find_element(:css, "form[action='/sessions'] > p.message > a").click
    @driver.find_element(:id, "user_email").send_keys("test@c3.com") 
    @driver.find_element(:id, "user_password").send_keys("0000")
    @driver.find_element(:id, "user_password_confirmation").send_keys("0000")
    @driver.find_element(:xpath,"//input[@value='Register']").click
    sleep 1

    @driver.find_element(:xpath, "//a[@href='/login']").click
    sleep 1
    @driver.find_element(:id, "email").send_keys("test@c3.com") 
    @driver.find_element(:id, "password").send_keys("0000") 
    @driver.find_element(:xpath,"//input[@value='Log in']").click
    expect(@driver.page_source).to include("Hi, test@c3.com")
  end

  it "Invalid Login" do
    @driver.find_element(:xpath, "//a[@href='/login']").click
    sleep 1
    @driver.find_element(:id, "email").send_keys("a1@c3.com") 
    @driver.find_element(:id, "password").send_keys("invalid") 
    @driver.find_element(:xpath,"//input[@value='Log in']").click
    expect(@driver.find_element(:id, "email").text).to eq("")
    expect(@driver.find_element(:id, "password").text).to eq("")
  end
  
  it "Login successfully" do
    @driver.find_element(:xpath, "//a[@href='/login']").click
    sleep 1
    @driver.find_element(:id, "email").send_keys("a1@c3.com") 
    @driver.find_element(:id, "password").send_keys("0000") 
    @driver.find_element(:xpath,"//input[@value='Log in']").click
    expect(@driver.page_source).to include("Hi, user1")
    sleep 5
  end 
end
