require 'rails_helper'


feature 'tasks/index' do
  scenario 'renders a list of tasks' do
    create(:homework)
    create(:email)

    visit tasks_path

    expect(page).to have_content('Complete homework')
    expect(page).to have_content('Reply to Uncle Chewies email')
  end
end


feature 'New task' do
  scenario 'user adds a new task' do
    user = create(:user)

    visit tasks_path

    expect {
      click_link 'New Task'
      fill_in 'Name', with: 'Learn RSpec'
      fill_in 'Priority', with: 1
      fill_in 'Due date', with: DateTime.now
      select(user.email, from: 'task_user_id')

      click_button('Create Task')
    }.to change(Task, :count).by(1)

    expect(current_path).to eq(task_path(Task.last.id))
    expect(page).to have_content('Learn RSpec')
  end
end
