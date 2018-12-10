require_relative("page_object")

class UpsPayment < PageObject
  def initialize
    @ways_to_pay = "//*[@id='tile-4']//*[@class='ups-tile_button_content']"
    @paypal = "//*[@class='ups-radio-custom-label ng-star-inserted']"
    @review_button = "//button[@id='nbsBackForwardNavigationReviewPrimaryButton']"
  end

  def ways_to_pay
    click(@ways_to_pay)
    click(@paypal)

  end

  def review_button
    click(@review_button)
  end

end