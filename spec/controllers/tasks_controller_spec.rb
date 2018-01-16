require 'rails_helper'

RSpec.describe TasksController, type: :controller do
describe 'GET #index' do
  it 'renders the index template' do
    get :index

    expect(response).to render_template(:index)
  end

  it 'returns all the tasks for the user'do
      user =create(:user)

      get :index

      expect(assigns(:tasks)).not_to be_nil
    end
  end

  describe 'GET #new' do
  it 'renders the new template' do
    get :new

    expect(response).to render_template(:new)
    end

    it 'assigns a new task to @task' do
      get :new

      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      task = create(:homework)

      get :show, params: { id: task.to_param }

      expect(response).to render_template(:show)
    end

    it 'assigns the requested task as @task' do
      task = create(:homework)

      get :show, params: { id: task.to_param }

     # raise task.inspect

      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'GET #edit' do
  it 'renders the edit template' do
    task = create(:email)
    get :edit, params: { id: task.to_param}

    expect(response).to render_template(:edit)
    end

    it 'assigns the requested task as @task' do
      task = create(:homework)
      get :edit, params: { id: task.to_param }

      expect(assigns(:task)).to eq(task)
    end
  end

end
