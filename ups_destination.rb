require_relative("ups_header")

class UpsDestination < UpsHeader

  def initialize
    @result = "//agent-summary[@prefix='origin']"
    @result_contents = "//*[@id='originnbsAgentSummaryName']"
    @cancel_button = "//*[@id='nbsBackForwardNavigationCancelShipmentButton']"
    @cancel_confirm = "//button[@id='nbsCancelShipmentWarningYes']"

    @name_destination = "//*[@id='destinationname']"
    @street_destination = "//*[@id='destinationaddress1']"
    @apartment_destination = "//*[@id='destinationaddress2']"
    @zip_destination = "//*[@id='destinationpostal']"
    @city_destination = "//*[@id='destinationcity']"
    @state_destination = "//select[@id='destinationstate']"
    @email_destination = "//*[@id='destinationemail']"
    @phone_destination = "//*[@id='destinationphone']"
    @continue_button_destination = "//button[@id='nbsBackForwardNavigationContinueButton']"

    @total_charges = "//*[@id='nbsBalanceBarTotalCharges']"
    @total_charges_content = "//*[@id='total-charges-spinner']"
    @total_charges_generated = "//*[@class='ng-tns-c1-0']"

  end

  def result_text
    wait_for_visible(@result_contents)
    get_text(@result)
  end

  def cancel_form
    click(@cancel_button)
    click(@cancel_confirm)
  end

  def fill_name_destination(name_destination)
    fill(@name_destination, name_destination)
  end

  def fill_address_destination(street_destination, apartment_destination = "")
    fill(@street_destination, street_destination)
    fill(@apartment_destination, apartment_destination)
  end

  def fill_zip_destination(zip_destination)
    fill(@zip_destination, zip_destination)
  end

  def fill_email_destination(email_destination)
    fill(@email_destination, email_destination)
  end

  def fill_phone_destination(phone_destination)
    fill(@phone_destination, phone_destination)
  end

  def wait_for_city_destination(city_destination)
    get_wait.until{get_input_value(@city_destination).include?(city_destination)}
  end

  def wait_for_dropdown_option(select)
    state_destination = get_select(@state_destination)
    get_wait.until{ state_destination.selected_options.first.text.include?(select)}
  end

  def submit_destination
    click(@continue_button_destination)
  end

end