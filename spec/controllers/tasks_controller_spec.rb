require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  it 'renders the index template' do
    get :index

    expect(response).to render_template(:index)
  end

  it 'renders the show template'

  it 'renders the edit template'

  it 'renders the new template'

end
