require 'rails_helper'

 RSpec.describe AdvertisementsController, type: :controller do
 # #8
   let(:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_integer) }

   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "assigns [my_advertisement] to @advertisements" do
       get :index
 # #9
       expect(assigns(:advertisements)).to eq([my_advertisement])
     end
   end
   
   describe "GET show" do
     it "returns http success" do
 # #16
       get :show, params: { id: my_advertisement.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
 # #17
       get :show, params: { id: my_advertisement.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_advertisement to @advertisement" do
       get :show, params: { id: my_advertisement.id }
 # #18
       expect(assigns(:advertisement)).to eq(my_advertisement)
     end
   end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
 # #2
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
 # #3
      it "instantiates @advertisement" do
        get :new
        expect(assigns(:advertisement)).not_to be_nil
      end
    end
 
    describe "ADVERTISEMENT create" do
 # #4
      it "increases the number of Advertisements by 1" do
        expect{ advertisement :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_integer } } }.to change(Advertisement,:count).by(1)
      end
 
 # #5
      it "assigns the new advertisement to @advertisement" do
        advertisement :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_integer } }
        expect(assigns(:advertisement)).to eq Advertisement.last
      end
 
 # #6
      it "redirects to the new post" do
        advertisement :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_integer} }
        expect(response).to redirect_to Advertisement.last
      end
    end
 end