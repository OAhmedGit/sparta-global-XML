require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.get_price.each do |price|
      expect(price).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_calories.each do |calorie|
      expect(calorie).to be < 1000
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_waffle_description.each do |waffle|
      expect(waffle.include?("Two")).to be true
      expect(waffle.include?("waffles") || waffle.include?("Waffle")).to be true
    end
  end

end
