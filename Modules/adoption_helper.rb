module AdoptionHelper


  def adopt_puppy_number(num)
    @browser.button(:value => 'View Details', :index => num - 1).click
    @browser.button(:value => 'Adopt Me!').click
  end

  def checkout_with(name, address, email, pay_type)
    @browser.button(:value => 'Complete the Adoption').click
    @browser.text_field(:id => 'order_name').set(name)
    @browser.text_field(:id => 'order_address').set(address)
    @browser.text_field(:id => 'order_email').set(email)
    @browser.select_list(:id => 'order_pay_type').select(pay_type)
    @browser.button(:value => 'Place Order').click
  end

  def close_browser
    @browser.close
  end

  def continue_adopting_puppies
    @browser.button(:value => 'Adopt Another Puppy').click
  end

  def goto_puppy_adoption_site
    @browser = Watir::Browser.new :firefox
    @aut = 'http://puppies.heroku.com'
    @browser.goto @aut
  end

  def verify_page_contains(text)
    fail 'Browser text did not match expected value!' unless @browser.text.include? 'Thank you for adopting a puppy!'
  end

end