require 'spec_helper'
module Login
  def login(user) 
          
    visit "/users/sign_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"

    page.should have_content("Signed in successfully.")
    
  end
  
end                  

Rspec.configure do |c|
   c.include Login
 end