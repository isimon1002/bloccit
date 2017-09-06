require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

let(:q) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }

   describe "GET question" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "assigns [q] to @questions" do
       get :index
 # #9
       expect(assigns(:questions)).to eq([q])
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
      it "instantiates @question" do
        get :new
        expect(assigns(:question)).not_to be_nil
      end
    end

    describe "QUESTION create" do
 # #4
      it "increases the number of question by 1" do
        expect{ post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true } } }.to change(Question,:count).by(1)
      end
 
 # #5
      it "assigns the new question to @questiont" do
        post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true } }
        expect(assigns(:question)).to eq Question.last
      end
 
 # #6
      it "redirects to the new question" do
        post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true } }
        expect(response).to redirect_to Question.last
      end
    end

   describe "GET show" do
     it "returns http success" do
 # #16
       get :show, params: { id: q.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
 # #17
       get :show, params: { id: q.id }
       expect(response).to render_template :show
     end
 
     it "assigns q to @question" do
       get :show, params: { id: q.id }
 # #18
       expect(assigns(:question)).to eq(q)
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit, params: { id: q.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, params: { id: q.id }
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns question to be updated to @question" do
       get :edit, params: { id: q.id }
 
       question_instance = assigns(:question)
 
       expect(question_instance.id).to eq q.id
       expect(question_instance.title).to eq q.title
       expect(question_instance.body).to eq q.body
       expect(question_instance.resolved).to eq q.resolved
       
     end
   end

   describe "PUT update" do
     it "updates question with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, params: { id: q.id, question: {title: new_title, body: new_body, new_resolved: true } }
 
 # #3
       updated_question = assigns(:question)
       expect(updated_question.id).to eq q.id
       expect(updated_question.title).to eq new_title
       expect(updated_question.body).to eq new_body
     end
 
     it "redirects to the updated question" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

 
 # #4
       put :update, params: { id: q.id, question: {title: new_title, body: new_body, resolved: true } }
       expect(response).to redirect_to q
     end
   end

   describe "DELETE destroy" do
     it "deletes the question" do
       delete :destroy, params: { id: q.id }
 # #6
       count = Question.where({id: q.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to questions index" do
       delete :destroy, params: { id: q.id }
 # #7
       expect(response).to redirect_to questions_path
     end
   end
end
