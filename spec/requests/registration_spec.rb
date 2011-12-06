require 'spec_helper'

describe "Registration" do

  it "validated user should be able to signup" do

    user = Factory(:user, :email => "millisami1@gmail.com", :password => "secret")

    visit "/users/sign_up"
    fill_in "Email", :with => "m@gmail.com"
    fill_in "Password", :with => "secret" 
    fill_in "Password confirmation", :with => "secret"
    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")

  end
end