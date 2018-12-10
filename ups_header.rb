require_relative "page_object"

class UpsHeader < PageObject

  def initialize
    @url = "https://www.ups.com/us/en/Home.page"

    @shipping_menu = "//a[@id='ups-menuLinks1']"
    @create_shipment = "//ul[@class='ups-menu_links']//a[contains(@href,'ship?')]"
  end

  def go_to_create_shipment
    click(@shipping_menu)
    click(@create_shipment)
  end

end