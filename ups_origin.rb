require_relative("ups_header")

class UpsOrigin < UpsHeader

  def initialize
    @name = "//*[@id='originname']"
    @street_address = "//*[@id='originaddress1']"
    @apartment = "//*[@id='originaddress2']"
    @zip = "//*[@id='originpostal']"
    @city = "//*[@id='origincity']"
    @state = "//select[@id='originstate']"
    @email = "//*[@id='originemail']"
    @phone = "//*[@id='originphone']"
    @continue_button = "//*[@id='nbsBackForwardNavigationContinueButton']"
  end

  def fill_name(name)
    fill(@name, name)
  end

  def name_empty?
    value = get_input_value(@name)
    return value == ""
  end

  def url_contains?(page)
    return $driver.current_url.include?(page)
  end

  def fill_address(street, apartment = "")
    fill(@street_address, street)
    fill(@apartment, apartment)
  end

  def fill_zip(zip)
    fill(@zip, zip)
  end

  def fill_email(email)
    fill(@email, email)
  end

  def fill_phone(phone)
    fill(@phone, phone)
  end

  def wait_for_city(city)
    get_wait.until{get_input_value(@city).include?(city)}
  end

  def wait_for_dropdown_option(select)
    state = get_select(@state)
    get_wait.until{ state.selected_options.first.text.include?(select)}
  end

  def submit
    click(@continue_button)
  end


end