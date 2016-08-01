require 'selenium-webdriver'
require 'rails_helper'

describe "Test uploading video" do
  root_path = "http://52.10.113.111:3000/"

  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.navigate.to(root_path + "logout")
  end

  before(:each) do 
    @driver.navigate.to(root_path)
    sleep 1
  end

  after(:all) do 
    @driver.quit
  end

  it "needs login" do
  	@driver.navigate.to(root_path + "upload_videos")
  	sleep 1
  	current_url = @driver.current_url
  	expect(current_url).to eq(root_path + "login")
  end

  context "after it is logged in, " do
  	before :all do
  		@driver.navigate.to(root_path + "login")
  		@driver.find_element(:id, "email").send_keys("a1@c3.com") 
    	@driver.find_element(:id, "password").send_keys("0000") 
    	@driver.find_element(:xpath,"//input[@value='Log in']").click
    	sleep 1
  	end

  	before(:each) do 
	    @driver.navigate.to(root_path + "upload_videos/new")
	    sleep 1
  	end

  	it "validates title" do
  		@driver.find_element(:xpath,"//input[@value='Upload']").click
  		expect(@driver.find_elements(:id, "no_title").size()).to eq(1)
  	end

  	it "validates the existence of uploading video" do
  		@driver.find_element(:xpath,"//input[@value='Upload']").click
  		expect(@driver.find_elements(:id, "no_video").size()).to eq(1)
  	end

  	it "validates the existence of uploading poster" do
  		@driver.find_element(:xpath,"//input[@value='Upload']").click
  		expect(@driver.find_elements(:id, "no_poster").size()).to eq(1)
  	end

  	it "upload successfully if title, video and poster exists" do
  		@driver.find_element(:id, "video_title").send_keys("Selenium Test")
  		fileInput = @driver.find_element(:id, "video_video_url")
		fileInput.send_keys("/Users/zipingz/Dropbox/M16-Studio/All examples used for uploading videos/sample1.mp4")
  		fileInput2 = @driver.find_element(:id, "video_poster_url")
  		fileInput2.send_keys("/Users/zipingz/Dropbox/M16-Studio/All examples used for uploading videos/001.jpg")
  		@driver.find_element(:xpath,"//input[@value='Upload']").click
  		sleep 1
  		progressBar = @driver.find_element(:class, "bar")
  		current_url = @driver.current_url.split('?').first
  		while current_url == root_path + "upload_videos/new" do
  			if @driver.find_elements(:class, "bar").size() > 0
  				if progressBar.text == "Failed"
	  				break
	  			end
  			end
  			
  			current_url = @driver.current_url.split('?').first
  			puts current_url
  			sleep 1
  		end

  		sleep 3
  		current_url = @driver.current_url.split('?').first
  		puts current_url
  		expect(current_url).to eq(root_path + "upload_videos")
  	end

  	it "goes back if \"Back\" button is clicked" do
  		@driver.find_element(:class,"ph-button").click
  		sleep 1
  		current_url = @driver.current_url
  		expect(current_url).to eq(root_path + "upload_videos")
  	end
  end
end