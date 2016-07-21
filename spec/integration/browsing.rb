require 'selenium-webdriver'

describe "Test video browsing" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
  end

  before(:each) do 
    @driver.navigate.to("http://52.10.113.111:3000")
  end

  after(:all) do 
    @driver.quit
  end

  it "Click page 2" do
    @driver.find_element(:xpath, "//a[@href='/videos?page=2']").click
    sleep 1
    expect(@driver.find_element(:css, "div.pagination > em.current").text).to eq("2")
  end

  it "Click next page" do
    @driver.find_element(:xpath, "//a[@class='next_page']").click
    sleep 1
    expect(@driver.find_element(:css, "div.pagination > em.current").text).to eq("2")
  end

  it "Search exist keyword" do
    @driver.find_element(:id, "search").send_keys("sample1")
    @driver.find_element(:css, "div.search > form > input[type='submit']").click
    sleep 1
    elems = @driver.find_elements(:css, "div.content-grid")
    expect(elems[0].find_element(:css, "h3").text).to include("SAMPLE1")
    expect(elems[1].find_element(:css, "h3").text).to include("SAMPLE1")
  end

  it "Search non-exist keyword" do
    @driver.find_element(:id, "search").send_keys("sssssss")
    @driver.find_element(:css, "div.search > form > input[type='submit']").click
    sleep 1
    elem = @driver.find_element(:css, "div.content-grids > ul > div > span")
    expect(elem.text).to eq("There is no videos matching the search keyword \"sssssss\"")
  end
end

describe "Test video detail page" do
  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
  end

  before(:each) do 
    @driver.navigate.to("http://52.10.113.111:3000/login")
    @driver.find_element(:id, "email").send_keys("a1@c3.com") 
    @driver.find_element(:id, "password").send_keys("0000") 
    @driver.find_element(:xpath, "//input[@value='Log in']").click
    @driver.navigate.to("http://52.10.113.111:3000/videos/1")
  end

  after(:all) do 
    @driver.quit
  end

  it "Rating a video" do
    elem = @driver.find_element(:css, "div.video-rate > div.star > img[alt='4']")
    elem.click
    expect(elem["src"]).to include("star-on")
  end

  it "Search videos by tag" do
    elems = @driver.find_elements(:css, "div.tags > ul > li")
    text = elems[1].find_element(:css, "span > a").text
    elems[1].find_element(:css, "span > a").click
    sleep 1
    expect(@driver.find_element(:id, "search")["value"]).to eq(text)
  end

  it "Voting a video" do
    @driver.navigate.to("http://52.10.113.111:3000/videos/1?cid=1")
    elems = @driver.find_elements(:css, ".rate-and-vote > .video-vote")
    vote = elems[1].find_elements(:css, "span")[0]
    votes = vote.text
    elems[1].find_element(:css, "a").click
  end
end

