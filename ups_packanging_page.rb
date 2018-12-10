require_relative("page_object")

class UpsPackangingPage < PageObject

  def initialize
    # @packanging_type = "//*[@class='ups-dropdown_wrapper ups-input_wrapper']"
    @type = "//*[@id='nbsPackagePackagingTypeDropdown0']"
    @weight = "//*[@id='nbsPackagePackageWeightField0']"

    @charges_changed = "//*[@class='ng-tns-c1-0']"

    #@cheapest_option = "//*[text()='$37.92']/../..//*[@id='nbsServiceTileServiceDescription2_0_1']"
    @cheapest_option = "//*[text()='$37.92']/../..//*[@id='nbsServiceTileTotalCharge1_0_1']"

    @saturday_delivery = "//*[@class='ups-form_label ups-lever_label'][contains(text(), 'Saturday Delivery')]"
  end

  sleep 10
  def select_packaging(type)
    #click(@packanging_type)
    get_select(@type).select_by(:text, type)
    # multi_dropdown = $driver.find_element(:xpath, "//*[@class='ups-dropdown_wrapper ups-input_wrapper']")
    # multi_select_list = Selenium::WebDriver::Support::Select.new(multi_dropdown)
    # multi_select_list.select_by(:option, 'UPS Express Box - Small')
  end

  def fill_weight(text)
    fill(@weight, text)
  end


  def cheapest_option
    click(@cheapest_option)
  end

  def saturday_delivery
    click(@saturday_delivery)
  end
end