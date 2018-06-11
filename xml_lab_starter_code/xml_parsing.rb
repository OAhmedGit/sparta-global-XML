require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    @price_array = []
  end

  # Place your methods here

  def get_price
    @menu.xpath('//price').each do |price|
      price.text.gsub('£', '').to_f
      @price_array << price
    end

    return @price_array
  end

  def get_calories
    @menu.xpath('//calories').each do |calorie|
      calorie.to_f
    end
  end

  def get_food
    
  end


  def get_waffle_description
    array = []

    get_food.each do |item|
      if item.children[1].text.include?('Waffle')
        array << item.children[5].text
      end
    end

    return array
  end

end

h = GuiseppesMenu.new
h.get_price