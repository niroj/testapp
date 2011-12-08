require 'spec_helper'    

describe "review" do

  it "should see login to add review" do
    destination = Factory(:destination)
    visit destination_path(destination)

    page.should have_content("Login to add review.")
  end               

  it "should login and able to add review" do
    
    user = Factory(:user)
    
    login(user)
    
    destination = Factory(:destination)

    visit destination_path(destination)

    fill_in "review_content", :with => "very very very good place"

    click_button "Create Review"

    page.current_path.should == destination_path(destination)

  end 
  
  it "should not allow user to add review to their destination" do
    
    user = Factory(:user)
    
    login(user)
    
    destination = Factory(:destination, :user_id => user.id)

    visit destination_path(destination)    
    
    page.should have_content("You cannot add review in your destination")

    page.current_path.should == destination_path(destination)

  end  

end
