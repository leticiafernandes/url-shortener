require File.expand_path '../spec_helper.rb', __FILE__
require 'selenium-webdriver'

describe "UrlShortener interface tests" do

  before(:each) do
  	options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for(:chrome, options: options)
    @driver.get "http://localhost:9292/"
  end

  after(:each) do 
    @driver.quit
  end

  context "does home page request" do
    it "does title appear" do
      title = @driver.find_element(:id, "title")
	  expect(title.text).to eq "url shortner"
    end
  end

  context "check existence of page elements" do
  	  it "does have form" do
	    form = @driver.find_element(:id, "form")
	    expect(form.nil?).to be false
	  end

	  it "does have input" do
	    input = @driver.find_element(:name, "url")
	    expect(input.nil?).to be false
	  end

	  it "does have button" do
	    button = @driver.find_element(:id, "button")
	    expect(button.nil?).to be false
	  end
  end

  context "creates a short url" do
      it "does create short url" do
	  	url = @driver.find_element(:name, "url")
	  	url.send_keys("https://en.wikipedia.org/wiki/Germany")

	  	button = @driver.find_element(:id, "button")
	  	button.click

		result = @driver.find_element(:class, "generated-url")
		
	  	expect(result.text).not_to eq "http://localhost:9292/"
	  end
  end

  context "validates url" do
  	it "is url empty" do
	  	url = @driver.find_element(:name, "url")
	  	expect(url['value']).not_to match(/^(http|https):\/\/.*$/)
  	end

  	it "is url valid" do
	  	url = @driver.find_element(:name, "url")
	  	url.send_keys("https://en.wikipedia.org/wiki/Germany")
	  	expect(url['value']).to match(/^(http|https):\/\/.*$/)
  	end

  	it "is url invalid" do
	  	url = @driver.find_element(:name, "url")
	  	url.send_keys("url is invalid")
	  	expect(url['value']).not_to match(/^(http|https):\/\/.*$/)
  	end
  end
end