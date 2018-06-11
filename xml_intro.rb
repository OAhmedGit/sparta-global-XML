require 'nokogiri'

class GuiseppesMenu
    attr_accessor :menu

    def initialize
        @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    end

    def get_menu_names
        # @menu.search('name')
        @menu.xpath('//name')
    end

    def xpath_get_calories
        @menu.xpath('/breakfast_menu/food/calories')
    end

end

menu = GuiseppesMenu.new
# puts menu.get_menu_names
puts menu.xpath_get_calories