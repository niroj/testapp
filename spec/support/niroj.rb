module niroj
  def login(user)
    user = Factory(:user) 
    
    visit "/users/sign_in"
    fill_in "Email", :with => "person1@example.com"
    fill_in "Password", :with => "anything" 
    click_button "Sign in"

    page.should have_content("Signed in successfully.")
    
  end
  
end