# FactoryGirl.define do
 #  sequence :email do |n|
 #     "person#{n}@example.com"
 #   end
 # end
 #       

FactoryGirl.define do

  factory :user do
    email "abc@yahoo.com"
    password "secret"
  end
end