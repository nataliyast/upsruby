require_relative("page_object")

class UpsReviewDetails < PageObject

  def initialize
    @ship_from_name = "//*[@id='originnbsAgentSummaryName']"
    @ship_from_address = "//*[@id='originnbsAgentSummaryAddressLine1']"
    @ship_from_city = "//*[@id='originnbsAgentSummaryCity']"
    @ship_from_state = "//*[@id='originnbsAgentSummaryState']"
    @ship_from_zip = "//*[@id='originnbsAgentSummaryPostalCode']"
    @ship_from_email = "//*[@id='originnbsAgentSummaryEmail']"
    @ship_from_phone = "//*[@id='originnbsAgentSummaryPhone']"

    @ship_to_name = "//*[@id='destinationnbsAgentSummaryName']"
    @ship_to_address = "//*[@id='destinationnbsAgentSummaryAddressLine1']"
    @ship_to_city = "//*[@id='destinationnbsAgentSummaryCity']"
    @ship_to_state = "//*[@id='destinationnbsAgentSummaryState']"
    @ship_to_zip = "//*[@id='destinationnbsAgentSummaryPostalCode']"
    @ship_to_email = "//*[@id='destinationnbsAgentSummaryEmail']"
    @ship_to_phone = "//*[@id='destinationnbsAgentSummaryPhone']"

    @package_information = "//*[@id='nbsShipmentPackagesPackage0']//p"
    @additional_option = "//*[@id='optionReviewsaturdayDeliveryShip']"
    @review_payment = "//*[@id='nbsPaymentSummaryBillPayPalSummary']"
  end

  def ship_from_name_text
    return get_text(@ship_from_name)
  end

  def ship_from_address_text
    return get_text(@ship_from_address)
  end

  def ship_from_city_text
    return get_text(@ship_from_city)
  end

  def ship_from_state_text
    return get_text(@ship_from_state)
  end

  def ship_from_zip_text
    return get_text(@ship_from_zip)
  end

  def ship_from_email_text
    return get_text(@ship_from_email)
  end

  def ship_from_phone_text
    return get_text(@ship_from_phone)
  end


  def ship_to_name_text
    return get_text(@ship_to_name)
  end

  def ship_to_address_text
    return get_text(@ship_to_address)
  end

  def ship_to_city_text
    return get_text(@ship_to_city)
  end

  def ship_to_state_text
    return get_text(@ship_to_state)
  end

  def ship_to_zip_text
    return get_text(@ship_to_zip)
  end

  def ship_to_email_text
    return get_text(@ship_to_email)
  end

  def ship_to_phone_text
    return get_text(@ship_to_phone)
  end

  def package_information_text
    return get_text(@package_information)
  end

  def additional_option_text
    return get_text(@additional_option)
  end

  def review_payment_text
    return get_text(@review_payment)
  end
end