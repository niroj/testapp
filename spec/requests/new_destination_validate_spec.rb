require 'spec_helper'

describe "new_destination" do

  it "cannot be created without login" do

    visit "/destinations/new"

    page.should have_content("You need to sign in or sign up before continuing.")

  end

end

describe Destination do


    it {should have_valid(:place).when('kathmandu', 'the place') }
    it {should_not have_valid(:place).when('',34567, 'ward no. 9') }

    it {should have_valid(:description).when('very nice place is ktm', 'wow very nice place :-)', 'gr8 place wanna live there ;-)') }
    it {should_not have_valid(:description).when('', 'nice', 'we'*200) }


end