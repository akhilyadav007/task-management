require 'rails_helper'

RSpec.describe UserTasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:user_task, user: user) }
  let(:valid_attributes) { { title: 'Test Task', description: 'Test Description', state: 'Backlog', deadline: 1.day.from_now } }
  let(:invalid_attributes) { { title: '', description: 'Test Description', state: 'Backlog', deadline: 1.day.from_now } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new UserTask' do
        expect {
          post :create, params: { user_task: valid_attributes }
        }.to change(UserTask, :count).by(1)
      end

      it 'redirects to the created task' do
        post :create, params: { user_task: valid_attributes }
        expect(response).to redirect_to(UserTask.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { user_task: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'Updated Task' } }

      it 'updates the requested task' do
        put :update, params: { id: task.id, user_task: new_attributes }
        task.reload
        expect(task.title).to eq('Updated Task')
      end

      it 'redirects to the task' do
        put :update, params: { id: task.id, user_task: valid_attributes }
        expect(response).to redirect_to(task)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        put :update, params: { id: task.id, user_task: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task_to_destroy = create(:user_task, user: user)
      expect {
        delete :destroy, params: { id: task_to_destroy.id }
      }.to change(UserTask, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(user_tasks_url)
    end
  end
end
