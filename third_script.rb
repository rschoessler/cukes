require 'rubygems'
require 'watir-webdriver'

@browser = Watir::Browser.new :firefox
aut = 'http://puppies.heroku.com'

def adopt_puppy_number(num)
  @browser.button(:value => 'View Details', :index => num - 1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

@browser.goto aut

adopt_puppy_number (1)
continue_adopting_puppies
adopt_puppy_number (2)

#now complete the adoption
@browser.button(:value => 'Complete the Adoption').click
@browser.text_field(:id => 'order_name').set('Shess')
@browser.text_field(:id => 'order_address').set('123 Main St.')
@browser.text_field(:id => 'order_email').set('shess@foo.com')
@browser.select_list(:id => 'order_pay_type').select('Check')
@browser.button(:value => 'Place Order').click

fail 'Browser text did not match expected value!' unless @browser.text.include? 'Thank you for adopting a puppy!'

@browser.close