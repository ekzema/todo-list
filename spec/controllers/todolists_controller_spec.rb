require 'rails_helper'


RSpec.describe TodolistsController, type: :controller do
 


  describe 'POST #create' do
  
      it 'creates a project' do
    
          post :create, todolist: {name: "fdfd"}
        response.should redirect_to :root
      end
 

    context 'with invalid attributes' do
      it 'does not create a project' do
        expect{
          post :create, todolist: attributes_for(:invalid_project)
        }.to_not change(Todolist, :count)
      end

      it 'returns an error' do
        post :create, todolist: attributes_for(:invalid_project)
        expect(response.status).to eq 422
      end
    end
  end

  
end
