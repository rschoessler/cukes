require 'rubygems'
require 'watir-webdriver'
require_relative 'Modules/adoption_helper'

include AdoptionHelper

goto_puppy_adoption_site
adopt_puppy_number (1)
continue_adopting_puppies
adopt_puppy_number (2)
checkout_with('Shess', '44 Nittany Lane', 'shess@outlaws.com', 'Check')
verify_page_contains('Thank you for adopting a puppy!')
close_browser
