require 'rails_helper'

RSpec.describe Advertisement, type: :model do
   let(:advertisement) { Advertisement.create!(title: "New Advertisement", copy: "This advertisement is amazing", price: 200) }
 
   describe "attributes" do
     it "has title, copy, and price attributes" do
       expect(advertisement).to have_attributes(title: "New Advertisement", copy: "This advertisement is amazing", price: 200)
     end
   end
end