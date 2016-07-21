require 'selenium-webdriver'

describe "Test login" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
  end

  before(:each) do 
    @driver.navigate.to("http://52.10.113.111:3000")
    sleep 1
  end

  after(:all) do 
    @driver.quit
  end

  # it "Invalid Login" do
  #   @driver.find_element(:id, "username").send_keys("agileway") 
  #   @driver.find_element(:id, "password").send_keys("changeme") 
  #   @driver.find_element(:xpath,"//input[@value='Sign in']").click 
  #   expect(@driver.page_source).to include("Invalid email or password")
  # end
  
  it "Login successfully" do
    @driver.find_element(:xpath, "//a[@href='/login']").click
    sleep 1

    @driver.find_element(:id, "email").send_keys("a1@c3.com") 
    @driver.find_element(:id, "password").send_keys("0000") 
    @driver.find_element(:xpath,"//input[@value='Log in']").click expect(@driver.page_source).to include("Hi, user1")
  end 
end