require_relative("../pages/ups_header")
require_relative("../pages/ups_origin")
require_relative("../pages/ups_destination")
require_relative("../pages/ups_packanging_page")
require_relative("../pages/ups_payment")
require_relative("../pages/ups_review_details")

And(/^I go to Create a Shipment$/) do
  ups = UpsHeader.new
  ups.go_to_create_shipment
end

When(/^I fill out origin shipment fields$/) do
  origin = UpsOrigin.new
  origin.fill_name("Administrator")
  origin.fill_address("4970 El Camino Real")
  origin.fill_zip("94022")
  origin.wait_for_city("LOS ALTOS")
  origin.wait_for_dropdown_option("California")
  origin.fill_email("mail@example.com")
  origin.fill_phone("1234567890")
end

And(/^I submit the shipment form$/) do
  UpsOrigin.new.submit
end

Then(/^I verify origin shipment fields submitted$/) do
  result = UpsDestination.new.result_text

  assert(result.include?("Administrator"))
  assert(result.include?("4970 El Camino Real"))
  assert(result.include?("mail@example.com"))
  assert(result.include?("1234567890"))
end

And(/^I cancel the shipment form$/) do
  UpsDestination.new.cancel_form
end

Then(/^I verify shipment form is reset$/) do
  origin = UpsOrigin.new
  assert(origin.name_empty?)
  assert(origin.url_contains?("origin"))
end

When(/^I fill out destination	shipment fields$/) do
  destination = UpsDestination.new
  destination.fill_name_destination("John Doe")
  destination.fill_address_destination("870 7th Ave")
  destination.fill_zip_destination("10019")
  destination.wait_for_city_destination("NEW YORK")
  destination.wait_for_dropdown_option("New York")
  destination.fill_email_destination("mail1@example.com")
  destination.fill_phone_destination("2345678901")
end

Then(/^I verify total charges appear$/) do
  UpsDestination.new.wait_for_visible("//*[@class='ng-tns-c1-0']", 15)
  total_text = $driver.find_element(:xpath, "//*[@class='ng-tns-c1-0']").text

  assert(total_text.include?("$11.04"), "Total charges doesn't appear")
end


And(/^I set packaging type$/) do
 ups_packaging = UpsPackangingPage.new
 ups_packaging.select_packaging("UPS Express Box - Small")
 ups_packaging.fill_weight("1")
end

Then(/^I verify total charges changed$/) do
  #ups_packaging = UpsPackangingPage.new
  wait = Selenium::WebDriver::Wait.new({:timeout => 15})
  wait.until { $driver.find_element(:xpath, "//*[@class='ng-tns-c1-0']").text.include?("$37.92") }
  # charges_changed = $driver.find_element(:xpath, "//*[@class='ng-tns-c1-0']").text
  # assert(charges_changed.include?("$38.44"), "Total charges doesn't appear")
end


And(/^I select cheapest delivery option$/) do
  UpsPackangingPage.new.cheapest_option

end

And(/^I set Saturday Delivery type$/) do
  UpsPackangingPage.new.saturday_delivery

end

Then(/^I verify total charges  changed$/) do
  wait = Selenium::WebDriver::Wait.new({:timeout => 15})
  wait.until { $driver.find_element(:xpath, "//*[@class='ng-tns-c1-0']").text.include?("$55.12") }
end

And(/^I select Paypal payment type$/) do
   UpsPayment.new.ways_to_pay

end

And(/^I submit the shipment  form$/) do
  UpsPayment.new.review_button
end

Then(/^I review all recorded details on threview page$/) do
  review_details = UpsReviewDetails.new
  assert(review_details.ship_from_name_text == "Administrator", "incorrect name!")
  assert(review_details.ship_from_address_text == "4970 El Camino Real", "incorrect address!")
  assert(review_details.ship_from_city_text == "LOS ALTOS", "incorrect name of city!")
  assert(review_details.ship_from_state_text == "California", "incorrect state!")
  assert(review_details.ship_from_zip_text == "94022", "incorrect zip code!")
  assert(review_details.ship_from_email_text == "mail@example.com", "incorrect email!")
  assert(review_details.ship_from_phone_text == "1234567890", "incorrect phone!")

  assert(review_details.ship_to_name_text == "John Doe", "incorrect name!")
  assert(review_details.ship_to_address_text == "870 7th Ave", "incorrect address!")
  assert(review_details.ship_to_city_text == "NEW YORK", "incorrect name of city!")
  assert(review_details.ship_to_state_text == "New York", "incorrect state!")
  assert(review_details.ship_to_zip_text == "10019", "incorrect zip code!")
  assert(review_details.ship_to_email_text == "mail1@example.com", "incorrect email!")
  assert(review_details.ship_to_phone_text == "2345678901", "incorrect phone!")

  assert(review_details.package_information_text.include?("UPS Express Box - Small - 1 lbs"), "no package information!")
  assert(review_details.additional_option_text.include?("Saturday Delivery"), "incorrect option!")
  assert(review_details.review_payment_text.include?("PayPal"), "incorrect ways to pay!")
end