require 'rails_helper'

RSpec.describe UserTaskService, type: :service do
  let(:user) { create(:user) }
  let(:params) { { title: 'Test Task', description: 'Test Description', state: 'Backlog', deadline: 1.day.from_now } }
  let(:service) { UserTaskService.new(user, params) }

  describe '#create' do
    it 'creates a new task' do
      success, task = service.create
      expect(success).to be true
      expect(task.title).to eq('Test Task')
      expect(task.user).to eq(user)
    end

    it 'fails to create a task with invalid params' do
      invalid_params = params.merge(title: '')
      service = UserTaskService.new(user, invalid_params)
      success, task = service.create
      expect(success).to be false
      expect(task.errors[:title]).to include("can't be blank")
    end
  end

  describe '#update' do
    let!(:task) { create(:user_task, user: user) }

    it 'updates the task' do
      updated_params = { title: 'Updated Task' }
      service = UserTaskService.new(user, updated_params)
      success, updated_task = service.update(task)
      expect(success).to be true
      expect(updated_task.title).to eq('Updated Task')
    end

    it 'fails to update the task with invalid params' do
      invalid_params = { title: '' }
      service = UserTaskService.new(user, invalid_params)
      success, updated_task = service.update(task)
      expect(success).to be false
      expect(updated_task.errors[:title]).to include("can't be blank")
    end
  end

  describe '#destroy' do
    let!(:task) { create(:user_task, user: user) }

    it 'destroys the task' do
      service = UserTaskService.new(user, params)
      success = service.destroy(task)
      expect(success).to be true
      expect { task.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
