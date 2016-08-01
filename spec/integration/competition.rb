require 'selenium-webdriver'
require 'rails_helper'

describe "Test Competition Video Management" do
  root_path = "http://52.10.113.111:3000/"

  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.navigate.to(root_path + "logout")
  end

  before(:each) do 
    @driver.navigate.to(root_path + "competitions/admin")
    sleep 1
  end

  after(:all) do 
    @driver.quit
  end

  it "can link to show competition" do
    @driver.find_element(:xpath, "//a[@href='/competitions/1']").click
    sleep 1
    url = @driver.current_url
    expect(url).to eq(root_path + "competitions/1")
  end 

  it "can link to edit competition" do
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1
    url = @driver.current_url
    expect(url).to eq(root_path + "competitions/1/edit")
  end

  it "can edit the title of a competition" do
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    url = @driver.current_url
    @driver.find_element(:id, "competition_title").clear()
    @driver.find_element(:id, "competition_title").send_keys("modified competition title") 
    @driver.find_element(:xpath, "//input[@name='commit']").click
    sleep 1
    expect(@driver.find_element(:tag_name, "td").text).to eq("modified competition title")
  end

  after("can edit the title of a competition") do 
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    @driver.find_element(:id, "competition_title").clear()
    @driver.find_element(:id, "competition_title").send_keys("The funniest videos in the world 1") 
    @driver.find_element(:xpath, "//input[@name='commit']").click
  end

  it "can edit the description of a competition" do
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    url = @driver.current_url
    @driver.find_element(:id, "competition_desc").clear()
    @driver.find_element(:id, "competition_desc").send_keys("modified competition description") 
    @driver.find_element(:xpath, "//input[@name='commit']").click
    sleep 1
    tds = @driver.find_elements(:tag_name, "td")
    expect(tds[1].text).to eq("modified competition description")
  end

  after("can edit the description of a competition") do 
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    @driver.find_element(:id, "competition_desc").clear()
    @driver.find_element(:id, "competition_desc").send_keys("Funny videos 2016 : try not to laugh, smile, or grin while watching this funniest video ever of stupid people doing stupid things compilation. This video is so hilarious and impossible to not laugh includes funny vines, funny pranks and funny fails") 
    @driver.find_element(:xpath, "//input[@name='commit']").click
  end

  it "can edit the start date of a competition" do
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    my_select = @driver.find_element(:id, "competition_start_date_1i")
    options = my_select.find_elements( :tag_name => "option")
    options.each {
      |option| option.click if option.text == '2015'
    }
    @driver.find_element(:xpath, "//input[@name='commit']").click
    sleep 1
    tds = @driver.find_elements(:tag_name, "td")
    expect(tds[2].text).to eq("2015-06-20")
  end

  after("can edit the start date of a competition") do 
    @driver.find_element(:xpath, "//a[@href='/competitions/1/edit']").click
    sleep 1 
    my_select = @driver.find_element(:id, "competition_start_date_1i")
    options = my_select.find_elements( :tag_name => "option")
    options.each {
      |option| option.click if option.text == '2016'
    }
    @driver.find_element(:xpath, "//input[@name='commit']").click
  end
  
end