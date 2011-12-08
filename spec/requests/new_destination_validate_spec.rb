require 'spec_helper'  

describe "new_destination" do

  it "cannot be created without login" do

    visit "/destinations/new"  

    page.should have_content("You need to sign in or sign up before continuing.")

  end 
  
end        

describe "after signed in new destination" do
  
  before(:each) do         
    user = Factory(:user)

    visit "/users/sign_in" 
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
  end
      
  it {should have_valiid(:place).when("kathmandu,2044") }do
    
        visit "destinations/new"    
        
        
        fill_in "Place", :with => ""
        fill_in "Description", :with => ""
    
        click_button "Create Destination" 
        page.should have_content("Place can't be blank Description is too short (minimum is 10 characters)")     

     end             

  # it "should not be blank" do
  # 
  #     visit "destinations/new"    
  #     
  #     
  #     fill_in "Place", :with => ""
  #     fill_in "Description", :with => ""
  # 
  #     click_button "Create Destination" 
  #     page.should have_content("Place can't be blank Description is too short (minimum is 10 characters)")     

   #end
  
  it "place should not be blank" do

    visit "destinations/new" 
    
    destination = Factory(:destination)
    
    fill_in "Place", :with => ""
    fill_in "Description", :with => destination.description
    
    click_button "Create Destination" 
    page.should have_content("Place can't be blank")

  end
   
  it "description should not be blank" do

    visit "destinations/new" 
    
    destination = Factory(:destination)
    
    fill_in "Place", :with => destination.place
    fill_in "Description", :with => ""
    
    click_button "Create Destination" 
    page.should have_content("Description is too short (minimum is 10 characters)")

  end 
  
  it "Description should exceed 240 characters" do

    visit "destinations/new" 
    
    destination = Factory(:destination)
    
    fill_in "Place", :with => destination.place
    fill_in "Description", :with => "were" * 100
    
    click_button "Create Destination" 
    page.should have_content("Description is too long (maximum is 240 characters)")

  end         

end