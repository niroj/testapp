require 'spec_helper'

describe "log_in" do

  it "should allow validated user to sign in" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => "person1@example.com"
    fill_in "Password", :with => "anything" 
    click_button "Sign in"

    page.should have_content("Signed in successfully.")

  end 
  
  it "should not allow invalid password" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => "person1@example.com"
    fill_in "Password", :with => "invalidPassword" 
    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end  
  
  it "should not allow invalid email" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => "notaemail@example.com"
    fill_in "Password", :with => "anything" 
    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end
  
  it "should not allow blank email" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => ""
    fill_in "Password", :with => "anything" 
    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end 
  
  it "should not allow blank password" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => "person1@example.com"
    fill_in "Password", :with => "" 
    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end 
  
  it "should not allow blank email and password" do
    
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => ""
    fill_in "Password", :with => "" 
    click_button "Sign in"

    page.should have_content("Invalid email or password.")

  end
  
end