require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:user_with_tasks) { build(:user_with_tasks )}

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'creates a valid user when given first and last name' do
    expect(user).to be_valid
  end

  it 'is not valid when the first name is missing' do
    user = User.new(first_name: nil, last_name: 'ly')

    expect(user).not_to be_valid
  end

  it 'will return false on saving when the last name is missing' do
    user = User.new(first_name: 'Dill', last_name: nil)

    expect(user.save).to eq(false)
  end

  it 'will return false on saving when the email address is missing' do
    user = build(:user, email: nil)

    expect(user.save).to eq(false)
  end

  it 'will return false on saving when email address is not unique' do
    user.save
    new_user =build(:user, email: user.email)
    new_user.valid?

    expect(new_user.errors[:email]).to include('has already been taken')
  end

  it 'has 2 tasks' do
      expect(user_with_tasks.tasks.length).to eq(2)
  end

  it 'shows first and last name with the full_name method' do
    user = User.new(first_name: 'Anita', last_name: 'Mann')

    expect(user.full_name).to eq('Anita Mann')
  end

it 'returns the tasks that are due today' do
    task = user_with_tasks.tasks.first
    task.update(due_date: DateTime.now)

    expect(user_with_tasks.due_today.length).to eq(1)
  end
end