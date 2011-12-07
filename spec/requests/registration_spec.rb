require 'spec_helper'  

describe "Registration" do

  it "should allow validated user to signup" do
                        
    visit "/users/sign_up"
    fill_in "Email", :with => "p@example.com"
    fill_in "Password", :with => "secret" 
    fill_in "Password confirmation", :with => "secret"
    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")

  end

  it "should allow user to signup with already registered username" do
                      
    user = Factory(:user)  
    visit "/users/sign_up"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password 
    fill_in "Password confirmation", :with => user.password
    click_button "Sign up"

    page.should have_content("Email has already been taken")

  end 
  
  it "should not allow email to be empty" do

    visit "/users/sign_up"
    fill_in "Email", :with => ""
    fill_in "Password", :with => "secret" 
    fill_in "Password confirmation", :with => "secret"
    click_button "Sign up"

    page.should have_content("Email can't be blank")

  end 
  
  it "should not allow blank password" do

    visit "/users/sign_up"
    fill_in "Email", :with => "asdf@hads.com"
    fill_in "Password", :with => "" 
    fill_in "Password confirmation", :with => ""
    click_button "Sign up"

    page.should have_content("Password can't be blank")

  end
  
  it "should match the password" do

    visit "/users/sign_up"
    fill_in "Email", :with => "d@h.com"
    fill_in "Password", :with => "anything" 
    fill_in "Password confirmation", :with => "secret"
    click_button "Sign up"

    page.should have_content("Password doesn't match confirmation")

  end 
  
  it "should not allow password less thean 6 character" do

    visit "/users/sign_up"
    fill_in "Email", :with => "d@h.com"
    fill_in "Password", :with => "any" 
    fill_in "Password confirmation", :with => "any"
    click_button "Sign up"

    page.should have_content("Password is too short (minimum is 6 characters)")

  end
  
  
end